Level level1;
Spieler spieler;
public  boolean[] keys = new boolean[3]; // left 0, right 1, up 2

void setup() {
  noSmooth();
  size(1100, 640);
  background(255, 204, 0);
  frameRate(24);
  PImage[] bgs = new PImage[1];
  bgs[0] = loadImage("Images/Level_1/Trees_1.png");
  PImage bg = loadImage("Images/Level_1/Hintergrund.png");
  level1 = new Level(bg, bgs);
  PImage[] playerAnimation = new PImage[1];
  for(boolean k : keys)
  {
    k = false;
  }
  playerAnimation[0] = (loadImage("Images/Texturen/BlockMitLaternen.png"));
  spieler = new Spieler(playerAnimation, 100.0, 100.0);
}

void draw() {
  level1.display(mouseX, mouseY);
  spieler.update();
  spieler.display();
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      keys[0] = true;
    }
    if (keyCode == RIGHT)
    {
      keys[1] = true;
    }
    if (keyCode == UP)
    {
      keys[2] = true;
    }
  }
}

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      keys[0] = false;
    }
    if (keyCode == RIGHT)
    {
      keys[1] = false;
    }
    if (keyCode == UP)
    {
      keys[2] = false;
    }
  }
}