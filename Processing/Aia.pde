class Ei extends StupidEnemy{
  int time, explodeTime;
  Ei(PImage[] pAnimation, float xpos, float ypos, int eTime)
  {
   super(pAnimation, xpos, ypos, xpos, xpos, 0, false); 
   y0 = 600;
   time = 0;
   explodeTime = eTime;
  }
  
  void updaten()
  {
    if(time > 0)
    {
      time++;
      if(time > explodeTime)
      {
       explode(); 
      }
    }
    if (!flying)
    {
      if (!onGround)
      {
        if (y >= y0)
        {
          onGround = true;
          y = y0;
          vy=0;
          time = 1;
        } else
        {
          vy += g;
        }
      }
    }
    y += vy;
  }
  
  void explode()
  {
    PImage[] eggAni = new PImage[1];
    eggAni[0] = loadImage("Images/Gegner/Gegner3/eggsplosion.png");
    enemies.add(new Eggsplosion(eggAni, x, y, explodeTime));
    enemies.remove(this);
  }
}