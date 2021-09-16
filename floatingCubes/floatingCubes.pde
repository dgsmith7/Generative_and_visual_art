// import library and instantiate cam object
import peasy.*;
PeasyCam cam;

// define 3d array of cube objects
Cube[][][] allCubes = new Cube[3][3][3];

void setup() {
  size(800, 800, P3D);  // P3d cannot have background() in setup() and cannot have noLoop()
  // initilize cam object
frameRate(60);
cam = new PeasyCam(this, 100);
  // set cam parameters
  cam.setMinimumDistance(500);
  cam.setMaximumDistance(2500);
  // function call to instantiate and initialize cube array
  initCubes();
}

void draw() {
  background(125);
  //show cubes
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      for (int k = 0; k < 3; k++) {
        allCubes[i][j][k].display();
      }
    }
  }
}

void initCubes() {  // a custom function that fills array of cube objects
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      for (int k = 0; k < 3; k++) {
        allCubes[i][j][k] = new Cube(color(random(255), random(255), random(255), 175), width/2 * i, height/2 * j, 400 * k, 225);
      }
    }
  }
}

void keyPressed() {
  if ((key == 'c') || (key == 'C')) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < 3; k++) {
          allCubes[i][j][k].changeColor();
        }
      }
    }
  }
  if ((key == 's') || (key == 'S')) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < 3; k++) {
          allCubes[i][j][k].changeSize();
        }
      }
    }
  }
  
}
