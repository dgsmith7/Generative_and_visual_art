import peasy.*;
PeasyCam cam;
float noiseDelta, nxCount, nyCount;
int dir;

void setup() {
  size(1650, 1000, P3D);
//  noStroke();
stroke(#C746F7, 100);
  fill(#C746F7, 100);
  cam = new PeasyCam(this, width/2, height/2, -600, 1250);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(2500);
}

void draw() {
  background(95);
  for (int i = 0; i < 700; i++) {
    for (int j = 0; j < 700; j++) {
      noiseDelta = noise(nxCount+(j/10), nyCount+(i/10)) * 50;
      //      print(noiseDelta+"  ");
      pushMatrix();
      translate(i, 550 - noiseDelta, -j);
      point(0,0);
//      ellipse(0,0,2,2);
      popMatrix();
    }
  }
  switch(dir) {
  case 1: 
    nxCount++;
    break;
  case 3: 
    nxCount--;
    break;
  case 4: 
    nyCount--;
    break;
  case 2: 
    nyCount++;
    break;
  }
}

void keyPressed() {
  switch(keyCode) {
  case UP:     
      dir = 1;
      break;
  case DOWN:   
      dir = 3;
      break;
  case LEFT:   
      dir = 4;
      break;
  case RIGHT:  
      dir = 2;
      break;
  case SHIFT:  
      dir = 0;
      break;
  }
} 
