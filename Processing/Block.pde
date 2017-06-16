class Block extends Image{
  Block(PImage image, float xPos,float yPos)
  {
    super(image, xPos, yPos);
  }
  
  Block(float xPos,float yPos)
  {
    super(loadImage("Images/Texturen/BlockMitLaternen.png"), xPos, yPos);
  }
}