// Peasy cam stuff
//import peasy.*;PeasyCam cam;//float radius = 50;
import processing.pdf.*; 
import processing.dxf.*;

int[] c1s = {2, 2, 2, 3, 4,  5,  6,  7,  10, 11, 15, 16};
int[] c2s = {6, 6, 7, 5, 10, 11, 10, 11, 16, 13, 6,  12};
int[] c3s = {5, 9, 4, 6, 7,  11, 3,  11, 16, 11, 3,  8};
int c1 = 2;
int c2 = 6;
int c3 = 5;
String fileName = "singleLine1.dxf";
int counter = 0;

float newX, newY, newZ;
float lastX, lastY, lastZ;

float span = 10;

PShape form, t1, t2, t3;
float strokeVal = 125;

void setup() {
  size(350, 560, P3D);
background(255);
  stroke(strokeVal);
//stroke(125, 0 , 0);
  strokeWeight(1);
//  fill(125);
//noStroke();
lastX = 350 + (125 * (cos(radians(0)) + (cos(radians(0)) / 2) + (sin(radians(0)) / 3)));  
lastY = 250 + (125 * (sin(radians(0)) + (sin(radians(0)) / 2) + (cos(radians(0)) / 3)));  
lastZ = -250 - (125 * (cos(radians(0)) + (sin(radians(0)) / 2) + (cos(radians(0)) / 3))); 

// more peasy cam stuff  
//cam = new PeasyCam(this, 500);cam.setMinimumDistance(50);cam.setMaximumDistance(1000);

//noLoop();

form = createShape(GROUP);
form.translate(-350, -250, -250);
}

void draw() {
//  beginRaw(DXF, fileName);
//  background(0);

  c1 = c1s[counter];
  c2 = c2s[counter];
  c3 = c3s[counter];

  t1 = createShape();
  t1.beginShape(TRIANGLE_STRIP);
  lastX = 350 + (125 * (cos(radians(0)) + (cos(radians(0)) / 2) + (sin(radians(0)) / 3)));  
  lastY = 250 + (125 * (sin(radians(0)) + (sin(radians(0)) / 2) + (cos(radians(0)) / 3)));  
  lastZ = -250 - (125 * (cos(radians(0)) + (sin(radians(0)) / 2) + (cos(radians(0)) / 3))); 
  t1.vertex(lastX, lastY, lastZ);
  for (float i = 0; i < 362; i = i + 1) {
    if ((i%2) == 0) {
      newX = 350 + (125 * (cos(radians(c1 * i)) + (cos(radians(c2 * i)) / 2) + (sin(radians(c3 * i)) / 3))); 
      newY = 250 + (125 * (sin(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
      newZ = -250 - (125 * (cos(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
    }
    else {
//      newX = 340 + (125 * (cos(radians(c1 * i)) + (cos(radians(c2 * i)) / 2) + (sin(radians(c3 * i)) / 3))); 
//      newY = 260 + (125 * (sin(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
//      newZ = -240 - (125 * (cos(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
      newX = 350 + (125 * (cos(radians(c1 * i)) + (cos(radians(c2 * i)) / 2) + (sin(radians(c3 * i)) / 3))); 
      newY = 250 + (125 * (sin(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
      newZ = -250 - (125 * (cos(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3)));     }
    t1.vertex(newX, newY, newZ);
    lastX = newX; 
    lastY = newY;
    lastZ = newZ;
  }
  t1.vertex(newX, newY, newZ);
  t1.endShape();
  form.addChild(t1);
/*
  t2 = createShape();
  t2.beginShape(TRIANGLE_STRIP);
  lastX = 340 + (125 * (cos(radians(0)) + (cos(radians(0)) / 2) + (sin(radians(0)) / 3)));  
  lastY = 260 + (125 * (sin(radians(0)) + (sin(radians(0)) / 2) + (cos(radians(0)) / 3)));  
  lastZ = -240 - (125 * (cos(radians(0)) + (sin(radians(0)) / 2) + (cos(radians(0)) / 3))); 
  t2.vertex(lastX, lastY, lastZ);
  for (float i = 0; i < 362; i = i + 1) {
    if ((i%2) == 0) {
      newX = 340 + (125 * (cos(radians(c1 * i)) + (cos(radians(c2 * i)) / 2) + (sin(radians(c3 * i)) / 3))); 
      newY = 260 + (125 * (sin(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
      newZ = -240 - (125 * (cos(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
    }
    else {
      newX = 370 + (125 * (cos(radians(c1 * i)) + (cos(radians(c2 * i)) / 2) + (sin(radians(c3 * i)) / 3))); 
      newY = 270 + (125 * (sin(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
      newZ = -270 - (125 * (cos(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
    }
    t2.vertex(newX, newY, newZ);
    lastX = newX; 
    lastY = newY;
    lastZ = newZ;
  }
  t2.vertex(newX, newY, newZ);
  t2.endShape();
  form.addChild(t2);

  t3 = createShape();
  t3.beginShape(TRIANGLE_STRIP);
  lastX = 370 + (125 * (cos(radians(0)) + (cos(radians(0)) / 2) + (sin(radians(0)) / 3)));  
  lastY = 270 + (125 * (sin(radians(0)) + (sin(radians(0)) / 2) + (cos(radians(0)) / 3)));  
  lastZ = -270 - (125 * (cos(radians(0)) + (sin(radians(0)) / 2) + (cos(radians(0)) / 3))); 
  t3.vertex(lastX, lastY, lastZ);
  for (float i = 0; i < 362; i = i + 1) {
    if ((i%2) == 0) {
      newX = 370 + (125 * (cos(radians(c1 * i)) + (cos(radians(c2 * i)) / 2) + (sin(radians(c3 * i)) / 3))); 
      newY = 270 + (125 * (sin(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
      newZ = -270 - (125 * (cos(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
    }
    else {
      newX = 350 + (125 * (cos(radians(c1 * i)) + (cos(radians(c2 * i)) / 2) + (sin(radians(c3 * i)) / 3))); 
      newY = 250 + (125 * (sin(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
      newZ = -250 - (125 * (cos(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
    }
    t3.vertex(newX, newY, newZ);
    lastX = newX; 
    lastY = newY;
    lastZ = newZ;
  }
  t3.vertex(newX, newY, newZ);
  t3.endShape();
  form.addChild(t3);

  t1.setFill(color(75));
  t2.setFill(color(125));
  t3.setFill(color(175));
  */
    //shape(form, 0 ,0);
//  endRaw();
//  exit();

{
  	for (int i = 1; i < 10; i ++) {
  	  form.translate(.2, .2, .2);
  	  form.rotateZ(radians(i/2));
  	  strokeVal = strokeVal - 2;
  	  form.setStroke(color(strokeVal));
  	  shape(form, 250, 50);
    }
    for (int i = 0; i < 50; i = i + 1) {
      form.translate(0,i,0);
  	  form.scale(.95);
  	  strokeVal = strokeVal - 5;
  	  form.setStroke(color(strokeVal));
      shape(form, 250, 50);	
    }
  }
}


void keyPressed() {
  if (key == 's') {
  	saveFrame("image.png");
 }
  else {
  	for (int i = 1; i < 10; i ++) {
  	  form.translate(.2, .2, .2);
  	  form.rotateZ(radians(i/2));
  	  shape(form, 250, 50);
    }
    for (int i = 0; i < 50; i = i + 1) {
      form.translate(0,i,0);
  	  form.scale(.95);
      shape(form, 250, 50);	
    }
  }
}


void mouseDragged() {
  if((mouseX%2==0) || (mouseY%2==0)){
	shape(form, mouseX, mouseY);
  }
}