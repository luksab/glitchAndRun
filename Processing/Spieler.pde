import java.awt.Rectangle;
class Spieler extends Sprite {
  float v0 = 7.0, vmax, vjump = -15.0;
  boolean right = true, jump = false, gotKey = false, fast = false, hasDied=false;
  int coins = 0, diamonds = 0, shield = 0, lives = 3, time = 0, fastTime = 0, eggs = 0, food = 0, gegnerTime = 0;

  Spieler(PImage[] pAnimation, float xPos, float yPos)
  {
    super(pAnimation, xPos, yPos, 5);
    x = xPos;
    y = yPos;
    vx = 0;
    vy = 0;
    y0 = 570;
    vmax = v0;
  }

  void collision()
  {
    for (int i= 0; i<enemies.size(); i++)
    {
      Enemy e = (Enemy)enemies.get(i);
      if (e.x <= x + dx && e.x + e.dx >= x && e.y <= y + dy && e.y + e.dy >= y)
      {
        if (keys[3])
        {
          if (e.getClass() == Eggsplosion.class)
          {
            die();
          } else if (e.getClass() == Ei.class && !onGround)
          {
            eggs++;
          }
          e.dead = true;
        } else
        {
          if (e.getClass() == Ei.class)
          {
            e.explode();
          } else
          {
            die();
          }
        }
      }
    }

    if (boss)
    {
      if (gegner.x <= x + dx && gegner.x + gegner.dx >= x && gegner.y <= y + dy && gegner.y + gegner.dy >= y)
      {
        if (keys[3])
        {
          if (millis()-gegnerTime >= 1000)
          {
            gegner.leben--;
            gegnerTime = millis();
          }
        } else
        {
          die();
        }
      }
    }
  }

  void die()
  {
    if (millis()-time >= 1000)
    {
      time = millis();
      if (shield >0)
      {
        shield--;
      } else if (lives > 0)
      {
        lives--;
      } else
      {
        actuallyDie();
      }
    }
  }

  void actuallyDie()
  {
    hasDied = true;
  }

  void display(int pX, int pY) {
    for (int i = 0; i < lives; i++)
    {
      image((loadImage("Images/Items/heart.png")), 30 + 30 * i, 30);
    }
    for (int i = lives; i < lives + shield; i++)
    {
      image((loadImage("Images/Items/Shield.png")), 30 + 30 * i, 30);
    }
    for (int i = 0; i < food; i++)
    {
      image((loadImage("Images/Items/food.png")), 30 + 30 * i, 90);
    }
    for (int i = 0; i < eggs; i++)
    {
      image((loadImage("Images/Items/Spiegelei1.png")), 30 + 30 * i, 60);
    }
    if (fast)
    {
      image((loadImage("Images/Items/Speed.png")), 1060, 12);
    }
    for (int i = 0; i < coins; i++)
    {
      image((loadImage("Images/Items/Coin.png")), 1060 - 30 * i, 30);
    }
    for (int i = 0; i < diamonds; i++)
    {
      image((loadImage("Images/Items/Diamond.png")), 1060 - 30 * i, 60);
    }
    if (gotKey)
    {
      image((loadImage("Images/Items/key.png")), 1060, 90);
    }


    if (keys[3])
    {
      frame = (frame+1) % (4);
    } else if (right)
    {
      frame = 4;
    } else 
    {
      frame = 5;
    }
    image(animation[frame], pX, pY);
  }

  void collectItems()
  {
    for (int i=0; i<items.size(); i++) {
      Item o = (Item)items.get(i);
      if (x <= o.xRight && x + dx >= o.xLeft && y <= o.yBottom && y + dy >= o.yTop)
      {
        switch(o.type)
        {
        case 0: 
          coins++;
          break;
        case 1: 
          diamonds++;
          break;
        case 2: 
          food++;
          break;
        case 3: 
          lives ++;
          break;
        case 4: 
          gotKey = true;
          break;
        case 5: 
          shield++;
          break;
        case 6: 
          fast = true;
          fastTime = millis();
          vmax = v0 * 2;
        }
        o.dead = true;
      }
    }
  }


  void updaten()
  {    
    if (keys[0] && !keys[1] && imageCollision() != 2 && !(vy > 0 && imageCollision() == 8) && !(vy < 0 && imageCollision() == 5)) {
      vx = -vmax * pow(0.9, shield);
    } else if (keys[1] && !keys[0] && imageCollision() != 1 && !(vy >= 0 && imageCollision() == 7) && !(vy <= 0 && imageCollision() == 4)) {
      vx = vmax * pow(0.9, (float)shield);
    } else
    {
      vx = 0;
    }
    if (keys[3])
    {
      vx *= 0.5;
    }
    x += vx;
    if (x < 0)
    {
      x = 0;
    } else if (x > level.levelbreite - dx)
    {
      x = level.levelbreite - dx;
    }

    if (imageCollision() == 6 || (vx >= 0 && imageCollision() == 7) || (vx <= 0 && imageCollision() == 8))
    {
      onGround = true;
    } else if (y < y0)
    {
      onGround = false;
    }

    jump = false;
    if (keys[2] && onGround && !keys[3])
    {
      vy = vjump * pow(1.25, food);
      jump = true;
      onGround = false;
      food = 0;
    } else
    {
      if (onGround)
      {
        vy = 0;
      } else if (y >= y0 || imageCollision() > 5)
      {
        onGround = true;
        vy = 0;
      } else {
        vy += g;
      }
    }
    if ((vy < 0 && imageCollision() > 2 && imageCollision() < 6) || (!jump && imageCollision() > 5))
    {
      vy = 0;
    }
    y += vy;
    if (y > y0)
    {
      y = y0;
    }

    collectItems();
    collision();

    if (millis() >= fastTime + 5000)
    {
      vmax = v0;
      fast = false;
    }
  }
}