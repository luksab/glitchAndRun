Level level1;

void setup() {
  noSmooth();
  size(1024, 640);
  background(255, 204, 0);
  frameRate(24);
  PImage[] bgs = new PImage[1];
  bgs[0] = loadImage("Images/Level_1/Trees_1.png");
  bgs[0].resize(2048, 640);
  PImage bg = loadImage("Images/Level_1/Hintergrund.png");
  bg.resize(width, height);
  level1 = new Level(bg, bgs);
}

void draw() {
  level1.display(mouseX, mouseY);
}