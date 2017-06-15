class Spieler extends Sprite{
  float x0, vmax = 1.0, vjump = -2.0, g = 0.1;
  boolean onGround = true;
  
  Spieler(PImage[] pAnimation, float xPos, float yPos)
  {
    super(pAnimation, xPos, yPos);
    x = xPos;
    y = yPos;
    vx = 0;
    vy = 0;
    x0 = 10;
  }
  
  void updaten()
  {
    if(x <= x0)
    {
     onGround = true; 
    }
    if(!onGround)
    {
     vy +=g; 
    }
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode  == RIGHT && !(keyCode == LEFT)) {
          vx = vmax;
        }
        else if (keyCode  == LEFT && !(keyCode == RIGHT)) {
          vx = -vmax;
        }
        else
        {
         vx = 0; 
        }
        if(keyCode == UP && onGround)
        {
          vy = vjump;
          onGround = false;
        }
      }
    }
  }
}