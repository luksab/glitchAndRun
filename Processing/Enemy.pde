class Enemy extends Sprite{
  float vmove;
  boolean flying, dead;
  
  Enemy(PImage[] pAnimation, float xpos, float ypos, float velocity, boolean flies)
  {
    super(pAnimation, xpos, ypos);
    vmove = velocity;
    flying = flies;
  }
  
  void update()
  {
   if(dead)
   {
     enemies.remove(this);
   }
   updaten();
  }
}