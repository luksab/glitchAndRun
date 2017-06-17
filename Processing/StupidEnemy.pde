class StupidEnemy extends Enemy {
  float xmin, xmax;

  StupidEnemy(PImage[] pAnimation, float xpos, float ypos, float xMin, float xMax, float velocity, boolean flies)
  {
    super(pAnimation, xpos, ypos, velocity, flies);
    xmin = xMin;
    xmax = xMax;
    y0 = 570;
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
    if ((vmove > 0 && x >= xmax) || (vmove < 0 && x <= xmin))
    {
      vmove = -vmove;
    }
    x += vmove;
    if (!flying)
    {
      if (!onGround)
      {
        if (y >= y0)
        {
          onGround = true;
          y = y0;
          vy=0;
        } else
        {
          vy += g;
        }
      }
    }
    y += vy;
  }
}