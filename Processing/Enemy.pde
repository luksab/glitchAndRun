class Enemy extends Sprite{
  float vmove;
  boolean flying, dead;
  
  Enemy(PImage[] pAnimation, float xpos, float ypos, float velocity, boolean flies)
  {
    super(pAnimation, xpos, ypos,5);
    vmove = velocity;
    flying = flies;
  }
  Enemy(PImage[] pAnimation, float xpos, float ypos, boolean flies)
  {
    super(pAnimation, xpos, ypos,5);
    vmove = 5;
    flying = flies;
  }
  
  void explode()
  {}
  
  void update()
  {
   updaten();
  }
}