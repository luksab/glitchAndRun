class Item extends Image
{
  
  boolean dead = false;
  int type;
  Item(PImage picture, float xPos, float yPos, int item) //coin 0, diamond 1, food 2, heart 3, key 4, shield 5, speed 6;
  {
  super(picture, xPos, yPos);
  type = item;
  }
  
  void display(float verschoben)
  {
        image(image, xLeft - verschoben, yTop);

  }
  
}