class Image {
  PImage image;
  int frame = 0;
  float xLeft, xRight, yBottom, yTop;
  Image(PImage picture, float xPos, float yPos){
    image = picture;
    xLeft = xPos;
    xRight = xPos + image.width;
    yTop = yPos;
    yBottom = yPos + image.height;
  }

  void display(float xpos, float ypos) {
    image(image, xpos, ypos);
  }
}