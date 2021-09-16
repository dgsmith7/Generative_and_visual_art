import peasy.*;
PeasyCam cam;

int nParticles = 7500;
Particle[] allParticles = new Particle[nParticles];
int currentRadius = 0;
float where = 0;
float rate = 0.01;

void setup() {
  size(750, 750, P3D);
  frameRate(60);
  background(0);
  sphereDetail(5);
  cam = new PeasyCam(this, 150);
  cam.setMinimumDistance(500);
  cam.setMaximumDistance(1000);
  colorMode(HSB, 180);
  initParticles();
  rectMode(CENTER);
}

void draw() {
  background(100);
  for (int i = 0; i < nParticles; i++) {
    allParticles[i].move();
    allParticles[i].display();
  }
  if (((mouseY > (.95 * height)) && (mouseY < height)) && 
       (mouseX > .25 * width && mouseX < (width - .25 * width))) {
    where = map(mouseX, 0 + (.25 * width), width - (.25 * width), 0, 100);
  }
  cam.beginHUD();
  // now draw things that you want relative to the camera's position and orientation
  displaySlider();
  cam.endHUD();
  cam.rotateX(rate);
  cam.rotateY(rate*1.1);
  cam.rotateZ(rate*1.2);
}

void initParticles() {
  for (int i = 0; i < nParticles; i ++) {
    allParticles[i] = new Particle();
  }
}

void keyPressed() {
  switch(keyCode) {
  case UP:
    where++;
    break;
  case DOWN:
    where--;
    break;
  }
}

void displaySlider() {
  float boxPosit = map(where, 0, 100, .25 * width, width-(.25 * width)); 
  println(boxPosit);
  fill (0);
  stroke(0);
  strokeWeight(3);
  line(.25 * width, .975* height, 0, width-(.25 * width), .975 * height, 0);
  strokeWeight(1);
  pushMatrix();
  translate(boxPosit, .975 * height, 0);
  box(13, .05 * height, 13);
  popMatrix();
}
