class Level{
PImage bg;
int frame = 0;
  Level(PImage pBg){
    bg = pBg;
  }
  
  void display(float xpos, float ypos) {
    image(bg, xpos, ypos);
  }
}