class Enemy extends Sprite{
  float vmove;
  boolean flying;
  
  Enemy(PImage[] pAnimation, float xpos, float ypos, float velocity, boolean flies)
  {
    super(pAnimation, xpos, ypos);
    vmove = velocity;
    flying = flies;
  }
}