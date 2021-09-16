import peasy.*;
PeasyCam cam;

float depth = -700;
ArrayList<HalfCube> halves = new ArrayList<HalfCube>();

void setup() {
  size(700, 700, P3D);
  frameRate(60);
  initializeHalves();
  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(2500);
}

void draw() {
  background(100);
  for (HalfCube h1 : halves) {
    h1.display();
    h1.update();
  }
}

void initializeHalves() {
  for (int i = 0; i < 10; i ++ ) {
    for (int j = 0; j < 5; j ++ ) {
      for (int k = 5; k < 10; k ++ ) {
        halves.add(new HalfCube(new PVector((i+1) * width/21, (j+1) * height/21, (k+1) * depth/21), 
                   new PVector(random(0.1), random(0.1), random(0.1)), 
                   10));
      }
    }
  }
  for (int i = 0; i < 5; i ++ ) {
    for (int j = 5; j < 10; j ++ ) {
      for (int k = 0; k < 10; k ++ ) {
        halves.add(new HalfCube(new PVector((i+1) * width/21, (j+1) * height/21, (k+1) * depth/21), 
                   new PVector(random(0.1), random(0.1), random(0.1)), 
                   10));
      }
    }
  }
}
