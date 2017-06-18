class StupidEnemy extends Enemy {
  float xmin, xmax;

  StupidEnemy(PImage[] pAnimation, float xpos, float ypos, float xMin, float xMax, float velocity, boolean flies)
  {
    super(pAnimation, xpos, ypos, velocity, flies);
    xmin = xMin;
    xmax = xMax;
    y0 = 570;
    vx = vmove;
  }
  StupidEnemy(PImage[] pAnimation, float xpos, float ypos, float xMin, float xMax, boolean flies)
  {
    super(pAnimation, xpos, ypos, flies);
    xmin = xMin;
    xmax = xMax;
    y0 = 570;
  }

  void updaten()
  {
    if ((vx > 0 && x >= xmax) || imageCollision() != 1 || (vmove < 0 && x <= xmin) || imageCollision() != 2)
    {
      vmove = -vmove;
    } if (imageCollision() != 1 && imageCollision() != 2)
    {
      vx = vmove;
    } else
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
          vy=0;
        } else if (imageCollision() > 5)
        {
          vy = 0;
        } else
        {
          vy += g;
        }
      }
    }
    y += vy;
  }
}