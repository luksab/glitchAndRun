class Eggsplosion extends Ei{
  Eggsplosion(PImage[] pAnimation, float xpos, float ypos, int etime)
  {
   super(pAnimation, xpos, ypos, etime); 
  }
  
  void updaten()
  {
    time++;
    if(time > explodeTime)
    {
     enemies.remove(this); 
    }
  }
}