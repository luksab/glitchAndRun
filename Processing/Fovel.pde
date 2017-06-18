class Fowel extends StupidEnemy { // Lukas wollte das
  int timeBetween, timeLast;
  Fowel(PImage[] pAnimation, float xpos, float ypos, float xmin, float xmax, float velocity, int time)
  {
    super(pAnimation, xpos, ypos, xmin, xmax, velocity, true);
    mult = 5;
    timeBetween = time;
    timeLast = 0;
  }
  void updaten()
  {
    if ((vmove > 0 && x >= xmax) || (vmove < 0 && x <= xmin))
    {
      vmove = -vmove;
    }
    x += vmove;
    if (timeLast >= timeBetween)
    {
      PImage[] eiAni = new PImage[1];
      eiAni[0] = (loadImage("Images/Gegner/Gegner3/egg.png"));
      enemies.add(new Ei(eiAni, x, y, timeBetween));
      timeLast = 0;
    }
    timeLast++;
  }
}