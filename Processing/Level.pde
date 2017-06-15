class Level {
  PImage bg;
  PImage[] bgs;
  int frame = 0;
  Level(PImage pBg, PImage[] pBgs) {
    bg = pBg;
    bgs=pBgs;
  }

  void display(float xpos, float ypos) {
    image(bg, 0, 0);
    for (int i=0; i<bgs.length; i++)
      image(bgs[i], xpos/(i+1)-1024, 0);
  }
}