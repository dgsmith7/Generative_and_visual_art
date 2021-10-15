import peasy.*;
int counter = 0;

PeasyCam cam;
float rx, ry, rz;

void setup() {
  size(500, 500, P3D);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  noStroke();
}

void draw() {
  background(50);
  fill(0);
  cam.beginHUD();
  text("drag", 25, 25);
  cam.endHUD();
  fill(255);
  scale(2);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
    fill(255, 0 , 0, 50);
  box(10, 16.18, 1);
    fill(0, 255, 0, 50);
  box(16.18, 1, 10);
    fill(0, 0 , 255, 50);
  box(1, 10, 16.18);
  rx += .001;
  ry += .002;
  rz += .003;
}

void keyPressed() {
  String fn = "phi-"+counter+".png";
  counter++;
  saveFrame(fn);
}
