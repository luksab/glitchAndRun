class Item extends Image
{
  
  boolean dead = false;
  
  Item(PImage picture, float xPos, float yPos){
    super(picture, xPos, yPos);
  }
  
  void display(float verschoben)
  {
        image(image, xLeft - verschoben, yTop);

  }
  
}