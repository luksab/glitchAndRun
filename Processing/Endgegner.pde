class Endgegner extends Sprite {
  int leben = 10;
  Endgegner(PImage[] pAnimation, float xpos, float ypos)
  {
    super(pAnimation, xpos, ypos);
  }

  void update()
  {
    if (leben <= 0)
    {
      //x = 10000;
      exit();
      boss = false;
      //gegner = null;
    }
  }
}