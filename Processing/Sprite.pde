class Sprite{
PImage[] animation;
int frame = 0;
  Sprite(PImage[] pAnimation){
    animation = pAnimation;
  }
  
  void display(float xpos, float ypos) {
    frame = (frame+1) % animation.length;
    image(animation[frame], xpos, ypos);
  }
}