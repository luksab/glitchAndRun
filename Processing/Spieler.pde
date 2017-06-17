import java.awt.Rectangle;
class Spieler extends Sprite {
  float vmax = 10.0, vjump = -15.0;
  boolean right = true, jump = false;

  Spieler(PImage[] pAnimation, float xPos, float yPos)
  {
    super(pAnimation, xPos, yPos, 5);
    x = xPos;
    y = yPos;
    vx = 0;
    vy = 0;
    y0 = 570;
  }

  void collision()
  {
    for (Object o : enemies)
    {
      Enemy e = (Enemy)o;
      if (e.x < x + dx && e.x + e.dx > x && e.y < y + dy && e.y + e.dy > y)
      {
        if (keys[3])
        {
          e.dead = true;
        } else
        {
          die();
        }
      }
    }
  }

  void die()
  {
  }

  void display(int pX, int pY) {
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
        o.dead = true;
      }
    }
  }


  void updaten()
  {    

    collectItems();
    println(imageCollision());

    if (keys[0] && !keys[1] && imageCollision() != 2 && imageCollision()  != 5 && imageCollision() != 8) {
      vx = -vmax;
    } else if (keys[1] && !keys[0] && imageCollision() != 1 && imageCollision()  != 4 && imageCollision() != 7) {
      vx = vmax;
    } else
    {
      vx = 0;
    }
    x += vx;
    if (x < 0)
    {
      x = 0;
    } else if (x > level.levelbreite - dx)
    {
      x = level.levelbreite - dx;
    }

    if (imageCollision() > 5)
    {
      onGround = true;
    } else if (y < y0)
    {
      onGround = false;
    }

    jump = false;
    if (keys[2] && onGround)
    {
      vy = vjump;
      jump = true;
      onGround = false;
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
  }
}