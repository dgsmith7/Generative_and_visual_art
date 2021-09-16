import peasy.*;
PeasyCam cam;
int rounds = 5;
float[] angle = new float[50000];
int counter = 0;
float cx, cy, cz, nx, ny, nz;

void setup() {
  size(1000, 1000, P3D);
  frameRate(60);
initAngleArray();
cx = width/2; 
  cy = height*.9; 
  cz = -width/2;
  nx = 0;
  ny = 0;
  nz = 0;
  cam = new PeasyCam(this, 150);
  cam.setMinimumDistance(500);
  cam.setMaximumDistance(1000);
  //  noLoop();
}

void draw() {
  background(125);
//  buildBase(rounds+1);
//  buildSegment(rounds);
drawSegment(rounds, 0 , 0, 0);
//dl(rounds, 0,0,0);
counter=0;
}

void initAngleArray() {
  for (int i = 0; i < 50000; i++) {
    angle[i] = radians(random(90, 270));
  }
}

void buildBase(int howMany) {
  fill(255, 0, 0);
  translate(0, .1 * howMany, -500);
  box(howMany*5, howMany*10, howMany*5);
}

void buildSegment(int which) {
  fill(255/(which+1));
  if (which > 0) {
    pushMatrix();
    translate(0, -which * 12, 0);
pushMatrix();
translate(which*10, 0, 0);
    box(which*5, which*10, which*5);
popMatrix();
    buildSegment(which-1);
//    translate(-(which*10), 0, 0);
pushMatrix();
    rotateY(PI);
    translate(which*10, 0, 0);    
    box(which*5, which*10, which*5);
popMatrix();
    buildSegment(which-1);
    //rotateY(-HALF_PI);
    //translate(-(which*10), 0, 0);
    popMatrix();

  }

}


void drawSegment(int r, float x, float y, float z) {
  nx = x + sin(angle[counter]) * (r*50);
  ny = y - 15;
  nz = z + cos(angle[counter]) * (r*50);
  strokeWeight(r * 3);
  line(x, y, z, nx, ny, nz);
  counter++;
  if (r > 0) {
    drawSegment(r-1, nx, ny, nz);
    counter++;
    drawSegment(r-1, nx, ny, nz);
    counter++;
  }
}

void dl(int r, float x, float y, float z){
for (int i = rounds; i > 0;  i--) {
  nx = x + sin(angle[counter]) * (i*50);
  ny = y - 15;
  nz = z + cos(angle[counter]) * (i*50);
  strokeWeight(i * 10);
  stroke(255,0,0,125);
  line(x, y, z, nx, ny, nz);
  counter++;
  nx = x + sin(angle[counter]) * (i*50);
  ny = y - 15;
  nz = z + cos(angle[counter]) * (i*50);
  strokeWeight(i * 10);
  stroke(0,0,255,125);
  line(x, y, z, nx, ny, nz);
  counter++;
  x = nx;
  y = ny;
  z = nz;
}
}
