class Sprite {
  PImage[] animation;
  int frame = 0;
  int mult = 1;
  boolean onGround = false;
  float x, y, vx, vy, dx, dy, y0 = 500, g = 1;
  Sprite(PImage[] pAnimation, float xpos, float ypos) {
    animation = pAnimation;
    x = xpos;
    y = ypos;
    dx = animation[0].width;
    dy = animation[0].height;
  }

  Sprite(PImage[] pAnimation, float xpos, float ypos, int pMult) {
    animation = pAnimation;
    x = xpos;
    y = ypos;
    mult = pMult;
    dx = animation[0].width;
    dy = animation[0].height;
  }

  void display(int pX, int pY) {
    frame = (frame+1) % (animation.length*mult);
    image(animation[frame/mult], pX, pY);
  }

  void update()
  {
    updaten();
  }

  void updaten() {
  }

  int imageCollision()
  {
    int c = 0;
    for (Object b : obstacles)
    {
      Image k = (Image)b;
      if (y < k.yBottom && y + dy > k.yTop)
      {
        if (vx >= 0 && x + dx >= k.xLeft  && x + dx <= k.xRight)
        {
          c +=1; // rechts
          break;
        }
        if (vx <= 0 && x >= k.xLeft  && x <= k.xRight)
        {
          c +=2; // links
          break;
        }
      }
    }
    for (Object b : obstacles)
    {
      Image k = (Image)b;
      if (x < k.xRight && x + dx > k.xLeft)
      {
        if (vy >= 0 && y + dy >= k.yTop  && y + dy <= k.yBottom)
        {
          c +=6;
          break; // unten
        }
        if (vy < 0 &&y >= k.yTop  && y <= k.yBottom)
        {
          c +=3; // oben
          break;
        }
      }
    }
    return c;
  }
}