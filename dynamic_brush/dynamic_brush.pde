import peasy.*;
PeasyCam cam;
float radius = -1000;


boolean penDown = false;
float mX = 0;
float mY = 0;
int counter = 0;
String fileName;

void setup() {
  size(1100, 750, P3D);
  noFill();
  strokeWeight(2);
//  noFill();
//  stroke(#78ABD1);
//  fill(#78ABD1);
  
    cam = new PeasyCam(this, 150);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(15000);

}

void draw() {
  background(255);
  doHelix();
//  if ((penDown) && ((int((dist(mX, mY, mouseX, mouseY) % 40)) == 0 ) || (int((dist(mX, mY, mouseX, mouseY) % 41)) == 0 ) )) {
//ellipse(mouseX, mouseY, 20 +  mouseX/2, 20 + mouseY/3);
 /*   
beginShape();
    vertex(mouseX, mouseY);
    bezierVertex(width / mouseX, height / mouseY, width - 250, height - 250, mouseX, mouseY);
    vertex(mouseX, mouseY);
    bezierVertex(50, 250, 250 + (mouseX / 5), 400 + (mouseY / 5), mouseX, mouseY);
endShape(CLOSE);
*/
//  }
}

void keyPressed() {
  if (key == 'd') { // down
    penDown = true;
    mX = mouseX;
    mY = mouseY;
  }
  if (key == 'u') { // up
    penDown = false;
  }
  if (key == 'm') { // mark X and mark Y
    mX = mouseX;
    mY = mouseY;
  }
  if (key == 's') {
    fileName = "print" + counter + ".png";
    save(fileName);
  }
  if (key == 'c') {
    background(255);
    penDown = false;
  }
}

void doHelix() {
  int top = 50;
  int bottom = 1750;
  int legs = 50;
  int step = 250;
  float radi = 500;
  int globe = 15;
  float ang;
  float incline;
  float oldX, newX, oldY, newY, oldZ, newZ;
//  strokeWeight(25);
  for (int y = top; y < bottom; y = y + step) {
//    translate(500, y, -500);
//    box(3);
//    translate(-500, -y, 500);
    oldX = 500 + cos(0) * radi;
    oldY = y + 0;
    oldZ = -500 + sin(0) * radi;
    for (int z = 0; z < legs + 1; z ++) {
      ang = map(z, 0, legs, 0, TWO_PI);
      incline = map(z, 0, legs, 0 , step);
//      line(500, y, -500, 500 + cos(ang)*radius,y + incline, -500 + sin(ang) * radius);
      newX = 500 + cos(ang)*radi;
      newY = y + incline;
      newZ = -500 + sin(ang) * radi;
//      line(newX, newY, newZ, oldX, oldY, oldZ);
//rotateZ(HALF_PI);
translate(oldX, oldY,oldZ);
//rect(0,0, globe, globe);
sphere(globe);
//box(globe);
translate(-oldX,-oldY,-oldZ);
//rotateZ(-HALF_PI);
      oldX = newX;
      oldY = newY;
      oldZ = newZ;
    }
  }
}
