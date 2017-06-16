class SmartEnemy extends Enemy
{
  float jumpV;
  SmartEnemy(PImage[] pAnimation, float xpos, float ypos, float velocity, float jumpVelocity, boolean flies)
  {
    super(pAnimation, xpos, ypos, velocity, flies);
    jumpV = jumpVelocity;
  }
  
  void updaten()
  {
    if(x < spieler.x)
    {
     vx = vmove; 
    }
    else if(x > spieler.x)
    {
     vx = -vy; 
    }
    else
    {
     vx = 0; 
    }
    x += vx;
    if (!flying)
    {
      if (!onGround)
      {
        if (y >= y0)
        {
          onGround = true;
          y = y0;
        } else
        {
          vy += g;
        }
      }
    }
    y += vy;
  }
}