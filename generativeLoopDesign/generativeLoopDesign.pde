float cx, cy;
float x, y;
float theta;

void setup() {
  size(500, 500);
  background(100);
  cx = width / 2;
  cy = height / 2;
  x = 150;
  y = 250;
  theta = 0;
  frameRate = 5;
  noFill();
}


void draw() {
  pushMatrix();
  translate(cx, cy);
  rotate(theta);
  stroke(noise(theta) * 255) ;
  ellipse(cx, cy, x + cy, y - cx);
  popMatrix();
  theta = theta + radians(1);
  if (theta == 360) {
    theta = 0;
  }
  x = x + 0.3;
  y = y + 0.7;
  cx = cx + .2;
  cy = cy + .3;
}
