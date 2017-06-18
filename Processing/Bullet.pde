class Bullet extends Sprite {
  float velocity = 30;
  Bullet(PImage[] animaton, float x0, float y0, float xm, float ym) 
  {
    super(animaton, x0, y0); 
    if(spieler.right)
    {
     vx = velocity; 
    }
    else
    {
      vx = -velocity;
    }
    vy = 0;
  }
  
  void collision()
  {
    for (int i= 0; i<enemies.size(); i++)
    {
      Enemy e = (Enemy)enemies.get(i);
      if (e.x <= x + dx && e.x + e.dx >= x && e.y <= y + dy && e.y + e.dy >= y)
      {
        enemies.remove(e);
        bullets.remove(this);
      }
    }
  }
  
  void updaten()
  {
    x += vx;
    y += vy;
    collision();
    if(x < - 20 || x > 1120 || y < -20 || y > 666) // Why? For the glory of satan of course!
    {
      bullets.remove(this);
    }
  }
}