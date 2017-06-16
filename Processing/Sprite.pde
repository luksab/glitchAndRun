class Sprite{
PImage[] animation;
int frame = 0;
float x, y, vx, vy;
  Sprite(PImage[] pAnimation, float xpos, float ypos){
    animation = pAnimation;
    x = xpos;
    y = ypos;
  }
  
  void display() {
    frame = (frame+1) % animation.length;
    image(animation[frame], x, y);
  }
  
  void update()
  {
    updaten();
  }
  
  void updaten(){
  }
}