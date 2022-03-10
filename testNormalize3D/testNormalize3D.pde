import peasy.*;
PeasyCam cam;
float x, y;
float ang = radians(315);
float radius = 200;
float normAngX, normAngY, normAngZ;
PShape cow;

void setup() {
//  size(500, 500);
  size(500, 500, P3D);
  background(125); 
  frameRate(60);
  cam = new PeasyCam(this, width/2, height/2, -width/2, 500);
  cam.setMinimumDistance(300);
  cam.setMaximumDistance(2700);
  cow = loadShape("cowShape.obj");
  cow.setFill(color(200));
  cow.scale(25);
}

void draw() {
  background(125);
  lights();
  stroke(0, 0, 255);
  drawAxis();
  // draw cente sphere
//scale(25);
shape(cow,0,0);
  pushMatrix();
  translate(width/2, height/2, -1000);
scale(1/25);
  sphere(3);
  popMatrix();
//  ellipse(width/2, height/2, 3, 3);
  computeXYZandAng();
  // draw sphere on surface
  pushMatrix();
  translate(x, y, -width/2);
  sphere(5);
  popMatrix();
//  ellipse(x, y, 5, 5);
  pushMatrix();
  // draw computed normal in white
  stroke(255);
  translate(x, y, -width/2);
  rotateX(normAngX);
  rotateY(normAngY);
  rotateZ(normAngZ);
  line(0, 0, 0, -25, 0 , -width/2);
  popMatrix();
  stroke(0);
}

void drawAxis() {
  //around center on x y z
  rectMode(CENTER);
  pushMatrix();
  translate(width/2, height/2, -width/2);
  stroke(255, 0 , 0);
  line(0, 0 , 0, 25, 0 ,0);
  noStroke();
  fill(255, 0 , 0, 75);
  rect(0, 0, 100, 100);
  stroke(0, 255, 0);
  line(0 ,0 ,0, 0,25, 0);
  noStroke();
  fill(0 ,255,  0, 75);
  rotateY(HALF_PI);
  rect(0, 0, 100, 100);
  rotateY(-HALF_PI);
  stroke(0, 0, 255);
  line (0, 0, 0, 0, 0, 25);
  noStroke();
  fill(0 , 0, 255, 75);
  rotateX(HALF_PI);
  rect(0, 0, 100, 100);
  rotateX(-HALF_PI);
  
  popMatrix();
  stroke(0);
  line(width/2, height/2, -width/2, x, y, -width/2);
}

void computeXYZandAng() {
  x = width/2 + cos(ang) * radius;
  y = height/2 + sin(ang) * radius;
  normAngX = -sin(ang) + PI;
  normAngY = 0;
  normAngZ = 0;
}
