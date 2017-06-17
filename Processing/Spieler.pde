class Spieler extends Sprite {
  float vmax = 10.0, vjump = -10.0;
  boolean right = true;

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
   for(Object o: enemies)
   {
    Enemy e = (Enemy)o;
    if(e.x < x + dx && e.x + e.dx > x && e.y < y + dy && e.y + e.dy > y)
    {
     if(keys[3])
     {
      e.dead = true; 
     }
     else
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
    if(keys[3])
    {
    frame = (frame+1) % (4);
    }
    else if(right)
    {
     frame = 4; 
    }
    else 
    {
     frame = 5; 
    }
    image(animation[frame], pX, pY);
  }

  void updaten()
  {
    if (keys[0] && !keys[1]) {
      vx = -vmax;
    } else if (keys[1] && !keys[0]) {
      vx = vmax;
    } else
    {
      vx = 0;
    }
    x += vx;
    if(x < 0)
     {
       x = 0;
     }
     else if(x > level.levelbreite - dx)
     {
      x = level.levelbreite - dx; 
     }


    if (keys[2] && onGround)
    {
      vy = vjump;
      onGround = false;
    } else
    {
      if (onGround)
      {
        vy = 0;
      } else if (y >= y0)
      {
        onGround = true;
        vy = 0;
      } else {
        vy += g;
      }
    }
    y += vy;
    if (y > y0)
    {
      y = y0;
    }
  }
}