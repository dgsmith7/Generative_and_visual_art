float mx = 50;
float my = 0;

void setup() {
  size(500, 500, P3D);
frameRate(60);
  background(0);
  noStroke();
}

void draw() {
  background(0);
  mx = mouseX;
  my = mouseY;
//  noLights();
  fill(50, 50, 50, 150);
//  ambientLight(200, 45, 75, 10, 10, 10);
  spotLight(255, 255, 255, 250, 250, -250, 500, 500, 500, 50, 2);
  translate(mx, my, -250);
  sphere(100);
  translate(-mx, -my, 250);
  sphereDetail(30);
}
