Level level1;
Spieler spieler;


void setup() {
  noSmooth();
  size(1100, 640);
  background(255, 204, 0);
  frameRate(24);
  PImage[] bgs = new PImage[1];
  bgs[0] = loadImage("Images/Level_1/Trees_1.png");
  PImage bg = loadImage("Images/Level_1/Hintergrund.png");
  level1 = new Level(bg, bgs);
  PImage[] playerAnimation = new PImage[4];
  playerAnimation[0] = (loadImage("Images/Bossfight/Tod2.png"));
  playerAnimation[1] = (loadImage("Images/Bossfight/Tod3.png"));
  playerAnimation[2] = (loadImage("Images/Bossfight/Tod4.png"));
  playerAnimation[3] = (loadImage("Images/Bossfight/Tod5.png"));
  spieler = new Spieler(playerAnimation, 100.0, 100.0);
}

void draw() {
  level1.display(mouseX, mouseY);
  spieler.update();
  spieler.display();
}

  void keyPressed()
  {
   if(key == CODED)
   {
    if(keyCode == UP)
    {
      if(spieler.onGround)
       {
        spieler.jump = true;
       }  
  }
   }
  }