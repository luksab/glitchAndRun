class Spieler extends Sprite {
  float y0, vmax = 10.0, vjump = -10.0, g = 0.5;
  boolean onGround = false, jump = false;

  Spieler(PImage[] pAnimation, float xPos, float yPos)
  {
    super(pAnimation, xPos, yPos, 5);
    x = xPos;
    y = yPos;
    vx = 0;
    vy = 0;
    y0 = 550;
  }

  void updaten()
  {
    vx = 0;
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode  == RIGHT) {
          vx = vmax;
        } else if (keyCode  == LEFT) {
          vx = -vmax;
        } else
        {
          vx = 0;
        }
      } else
      {
        vx = 0;
      }
    } else
    {
      vx = 0;
    }

    if (jump)
    {
      vy = vjump;
      jump = false;
      onGround = false;
    } else
    {
      if (onGround)
      {
        vy = 0;
      } else
      {
        vy += g;
        if (y >= y0)
        {
          onGround = true;
        }
      }
    }
  }
}