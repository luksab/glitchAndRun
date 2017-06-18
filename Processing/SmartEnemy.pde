class SmartEnemy extends Enemy
{
  float jumpV;
  SmartEnemy(PImage[] pAnimation, float xpos, float ypos, float velocity, float jumpVelocity, boolean flies)
  {
    super(pAnimation, xpos, ypos, velocity, flies);
    jumpV = jumpVelocity;
    y0 = 550;
  }
  SmartEnemy(PImage[] pAnimation, float xpos, float ypos, float jumpVelocity, boolean flies)
  {
    super(pAnimation, xpos, ypos, flies);
    jumpV = jumpVelocity;
    y0 = 550;
  }

  void updaten()
  {
    if (x < spieler.x)
    {
      vx = vmove;
    } else if (x > spieler.x)
    {
      vx = -vmove;
    } else
    {
      vx = 0;
    }
    if (imageCollision() % 3 == 0)
    {
      x += vmove;
    }

    if (!flying)
    {
      if (y >= y0)
      {
        y = y0;
      } else if (imageCollision() > 5)
      {
        vy = 0;
      } else
      {
        vy += g;
      }
    }
    y += vy;
  }
}