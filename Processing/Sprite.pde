class Sprite {
  PImage[] animation;
  int frame = 0;
  int mult = 1;
  boolean onGround = false;
  float x, y, vx, vy, dx, dy, y0, g = 1;
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
}