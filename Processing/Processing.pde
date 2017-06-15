Animation animation1, animation2;

float xpos;
float ypos;
float drag = 10.0;

void setup() {
  size(640, 360);
  background(255, 204, 0);
  frameRate(24);
  animation1 = new Animation("PT_Shifty_", 2);
  animation2 = new Animation("PT_Teddy_", 2);
  ypos = height * 0.25;
}

void draw() { 
  float dx = mouseX - xpos;
  ypos = mouseY;
  xpos = xpos + dx/drag;

  if (mousePressed) {
    background(255, 125, 0);
    animation1.display(xpos-animation1.getWidth()/2, ypos-animation2.getHeight()/2);
  } else {
    background(245, 254, 0);
    animation2.display(xpos-animation2.getWidth()/2, ypos-animation2.getHeight()/2);
  }
}

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".gif";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
  
  int getHeight() {
    return images[0].height;
  }
}