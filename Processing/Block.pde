class Block extends Image {
  
  boolean b = true;
  Block(PImage image, float xPos, float yPos)
  {
    super(image, xPos, yPos);
  }

  Block(float xPos, float yPos)
  {
    super(loadImage("Images/Texturen/BlockMitLaternen.png"), xPos, yPos);
  }

  void display() {
    image(image, xLeft - verschoben, yTop);
    if(b)
    {
     b = false;
    }
  }
}