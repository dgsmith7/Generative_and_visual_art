// define some particle properties
float x, y, spdX, spdY;
float radius;
color col;
float gravity;
float damping;
float friction;
float wind;

// define some particle methods

void setup () {
  size (800, 600);
  x = width/2;
  y = height/2;
  wind = random (-5, 5);
  spdX = random (-0.5, 0.5)+wind;
  spdY = random (-5, 5);
  radius = 2.0;
  col = color (100, 50, 125);
  gravity = 0.05;  // atmosphere
  damping = 0.55;  // material
  friction = 0.79;  // surface
}

void draw () {
  background (255);
  fill (col);
  ellipse (x, y, radius*2, radius*2);
  x += spdX;
  spdY += gravity;
  y += spdY;
  if (x > width-radius) {
    x = width-radius; 
    spdX *= -1;
  }
  if (x < 0+radius) {
    x = 0+radius;
    spdX *= -1;
  }
  if (y > height-radius) {
    y= height-radius;
    spdY *= -1; 
    spdY *= damping;
    spdX *= friction;
  }
  if (y < 0+radius) {
    y = 0+radius;
    spdY *= -1;
  }
}



