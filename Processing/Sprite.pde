class Sprite{
PImage[] animation;
int frame = 0;
int mult = 1;
float x, y, vx, vy;
  Sprite(PImage[] pAnimation, float xpos, float ypos){
    animation = pAnimation;
    x = xpos;
    y = ypos;
  }
  
  Sprite(PImage[] pAnimation, float xpos, float ypos, int pMult){
    animation = pAnimation;
    x = xpos;
    y = ypos;
    mult = pMult;
  }
  
  void display(int pX, int pY) {
    frame = (frame+1) % (animation.length*mult);
    image(animation[frame/mult], pX, pY);
  }
  
  void update()
  {
    updaten();
  }
  
  void updaten(){
  }
}