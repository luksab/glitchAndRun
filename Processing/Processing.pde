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
  PImage[] playerAnimation = new PImage[1];
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