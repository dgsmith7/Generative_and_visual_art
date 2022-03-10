 import processing.dxf.*;

import peasy.*;
PeasyCam cam;
float radius = 00;


PVector a, b, c, d, a1, b1, c1, d1;

void setup() {
  size(500, 500, P3D);
  //  fill(100, 100, 100, 100);
  //noLoop();
  //  noStroke();
    cam = new PeasyCam(this, 0);
  cam.setMinimumDistance(150);
  cam.setMaximumDistance(2500);

}


void draw() {
  background(125);
   //     beginRaw(DXF, "output.dxf");

  //background(0);
  /*
  stroke(125, 0 , 0, 125);
   line (70, 100, -100, 430, 100, -100);
   stroke(0, 125, 0, 125);
   line (70, 130, -100, 430, 130, -100);
   
   stroke(0);
   beginShape();
   vertex(100, 100, -130);
   vertex(100, 100, -100);
   vertex(100, 130, -100);
   vertex(100, 130, -130);
   vertex(100, 100, -130);
   vertex(150, 100, -130);
   for (int i = 0; i < 200; i ++) {
   vertex(150+i, 115 - cos((HALF_PI/200) * i - (HALF_PI / 2)) * 21.213203, -115 + sin((HALF_PI/200) * i- (HALF_PI / 2)) * 21.213203);
   }
   vertex(350, 100, -100);
   vertex(400, 100, -100);
   vertex(400, 130, -100);
   for (int i = 200; i < 0; i --) {
   vertex(150+i, 115 - cos((HALF_PI/200) * i + (HALF_PI / 2)) * 21.213203, -115 + sin((HALF_PI/200) * i + (HALF_PI / 2)) * 21.213203);
   }
   endShape();
   }
   */
  stroke(125, 125, 125, 125);


  a = new PVector(100 + cos((.25 * PI) + ((HALF_PI/200)*50)) * 21.213203, 100 + sin((.25 * PI) + ((HALF_PI/200)*50)) * 21.213203, -300 + 0);
  b = new PVector(100 + cos((.75 * PI) + ((HALF_PI/200)*50)) * 21.213203, 100 + sin((.75 * PI) + ((HALF_PI/200)*50)) * 21.213203, -300 + 0);
  c = new PVector(100 + cos((1.25 * PI) + ((HALF_PI/200)*50)) * 21.213203, 100 + sin((1.25 * PI) + ((HALF_PI/200)*50)) * 21.213203, -300 + 0);
  d = new PVector(100 + cos((1.75 * PI) + ((HALF_PI/200)*50)) * 21.213203, 100 + sin((1.75 * PI) + ((HALF_PI/200)*50)) * 21.213203, -300 + 0);
  
      beginShape();
    vertex(a.x, a.y, a.z);
    vertex(b.x, b.y, b.z);
    vertex(c.x, c.y, c.z);
    vertex(d.x, d.y, d.z);
    vertex(a.x, a.y, a.z);
    endShape();

  for (int i = 5; i < 300; i = i + 5) {
    if (i <= 50) {
      a1 = new PVector(100 + cos((.25 * PI) + ((HALF_PI/200)*50)) * 21.213203, 100 + sin((.25 * PI) + ((HALF_PI/200)*50)) * 21.213203, -300 + i);
      b1 = new PVector(100 + cos((.75 * PI) + ((HALF_PI/200)*50)) * 21.213203, 100 + sin((.75 * PI) + ((HALF_PI/200)*50)) * 21.213203, -300 + i);
      c1 = new PVector(100 + cos((1.25 * PI) + ((HALF_PI/200)*50)) * 21.213203, 100 + sin((1.25 * PI) + ((HALF_PI/200)*50)) * 21.213203, -300 + i);
      d1 = new PVector(100 + cos((1.75 * PI) + ((HALF_PI/200)*50)) * 21.213203, 100 + sin((1.75 * PI) + ((HALF_PI/200)*50)) * 21.213203, -300 + i);
    }
    if ((i > 50) && (i <= 250)) {
      a1 = new PVector(100 + cos((.25 * PI) + ((HALF_PI/200)*i)) * 21.213203, 100 + sin((.25 * PI) + ((HALF_PI/200)*i)) * 21.213203, -300 + i);
      b1 = new PVector(100 + cos((.75 * PI) + ((HALF_PI/200)*i)) * 21.213203, 100 + sin((.75 * PI) + ((HALF_PI/200)*i)) * 21.213203, -300 + i);
      c1 = new PVector(100 + cos((1.25 * PI) + ((HALF_PI/200)*i)) * 21.213203, 100 + sin((1.25 * PI) + ((HALF_PI/200)*i)) * 21.213203, -300 + i);
      d1 = new PVector(100 + cos((1.75 * PI) + ((HALF_PI/200)*i)) * 21.213203, 100 + sin((1.75 * PI) + ((HALF_PI/200)*i)) * 21.213203, -300 + i);
    }
    if (i > 250) {
      a1 = new PVector(100 + cos((.25 * PI) + ((HALF_PI/200)*249)) * 21.213203, 100 + sin((.25 * PI) + ((HALF_PI/200)*249)) * 21.213203, -300 + i);
      b1 = new PVector(100 + cos((.75 * PI) + ((HALF_PI/200)*249)) * 21.213203, 100 + sin((.75 * PI) + ((HALF_PI/200)*249)) * 21.213203, -300 + i);
      c1 = new PVector(100 + cos((1.25 * PI) + ((HALF_PI/200)*249)) * 21.213203, 100 + sin((1.25 * PI) + ((HALF_PI/200)*249)) * 21.213203, -300 + i);
      d1 = new PVector(100 + cos((1.75 * PI) + ((HALF_PI/200)*249)) * 21.213203, 100 + sin((1.75 * PI) + ((HALF_PI/200)*249)) * 21.213203, -300 + i);
    }
    
    beginShape();
    vertex(a.x, a.y, a.z);
    vertex(a1.x, a1.y, a1.z);
    vertex(b1.x, b1.y, b1.z);
    vertex(b.x, b.y, b.z);
    vertex(a.x, a.y, a.z);
    endShape();
     beginShape();
    vertex(b.x, b.y, b.z);
    vertex(b1.x, b1.y, b1.z);
    vertex(c1.x, c1.y, c1.z);
    vertex(c.x, c.y, c.z);
    vertex(b.x, b.y, b.z);
    endShape();
    beginShape();
    vertex(c.x, c.y, c.z);
    vertex(c1.x, c1.y, c1.z);
    vertex(d1.x, d1.y, d1.z);
    vertex(d.x, d.y, d.z);
    vertex(c.x, c.y, c.z);
    endShape();
    beginShape();
    vertex(d1.x, d1.y, d1.z);
    vertex(d1.x, d1.y, d1.z);
    vertex(a1.x, a1.y, a1.z);
    vertex(a.x, a.y, a.z);
    vertex(d.x, d.y, d.z);
    endShape();
   
    a = a1;
    b = b1;
    c = c1;
    d = d1;
  }
  
      beginShape();
    vertex(a.x, a.y, a.z);
    vertex(b.x, b.y, b.z);
    vertex(c.x, c.y, c.z);
    vertex(d.x, d.y, d.z);
    vertex(a.x, a.y, a.z);
    endShape();

  /*
beginShape();
   for (int i = 0; i < 300; i = i + 5) {
   if (i <= 50) {
   vertex(100 + cos((.25 * PI) + ((HALF_PI/200)*50)) * 21.213203, 100 + sin((.25 * PI) + ((HALF_PI/200)*50)) * 21.213203, -300 + i);
   vertex(100 + cos((.75 * PI) + ((HALF_PI/200)*50)) * 21.213203, 100 + sin((.75 * PI) + ((HALF_PI/200)*50)) * 21.213203, -300 + i);
   vertex(100 + cos((1.25 * PI) + ((HALF_PI/200)*50)) * 21.213203, 100 + sin((1.25 * PI) + ((HALF_PI/200)*50)) * 21.213203, -300 + i);
   vertex(100 + cos((1.75 * PI) + ((HALF_PI/200)*50)) * 21.213203, 100 + sin((1.75 * PI) + ((HALF_PI/200)*50)) * 21.213203, -300 + i);
   vertex(100 + cos((.25 * PI) + ((HALF_PI/200)*50)) * 21.213203, 100 + sin((.25 * PI) + ((HALF_PI/200)*50)) * 21.213203, -300 + i);
   }
   if ((i > 50) && (i <= 250)) {
   vertex(100 + cos((.25 * PI) + ((HALF_PI/200)*i)) * 21.213203, 100 + sin((.25 * PI) + ((HALF_PI/200)*i)) * 21.213203, -300 + i);
   vertex(100 + cos((.75 * PI) + ((HALF_PI/200)*i)) * 21.213203, 100 + sin((.75 * PI) + ((HALF_PI/200)*i)) * 21.213203, -300 + i);
   vertex(100 + cos((1.25 * PI) + ((HALF_PI/200)*i)) * 21.213203, 100 + sin((1.25 * PI) + ((HALF_PI/200)*i)) * 21.213203, -300 + i);
   vertex(100 + cos((1.75 * PI) + ((HALF_PI/200)*i)) * 21.213203, 100 + sin((1.75 * PI) + ((HALF_PI/200)*i)) * 21.213203, -300 + i);
   vertex(100 + cos((.25 * PI) + ((HALF_PI/200)*i)) * 21.213203, 100 + sin((.25 * PI) + ((HALF_PI/200)*i)) * 21.213203, -300 + i);
   }
   if (i > 250) {
   vertex(100 + cos((.25 * PI) + ((HALF_PI/200)*249)) * 21.213203, 100 + sin((.25 * PI) + ((HALF_PI/200)*249)) * 21.213203, -300 + i);
   vertex(100 + cos((.75 * PI) + ((HALF_PI/200)*249)) * 21.213203, 100 + sin((.75 * PI) + ((HALF_PI/200)*249)) * 21.213203, -300 + i);
   vertex(100 + cos((1.25 * PI) + ((HALF_PI/200)*249)) * 21.213203, 100 + sin((1.25 * PI) + ((HALF_PI/200)*249)) * 21.213203, -300 + i);
   vertex(100 + cos((1.75 * PI) + ((HALF_PI/200)*249)) * 21.213203, 100 + sin((1.75 * PI) + ((HALF_PI/200)*249)) * 21.213203, -300 + i);
   vertex(100 + cos((.25 * PI) + ((HALF_PI/200)*249)) * 21.213203, 100 + sin((.25 * PI) + ((HALF_PI/200)*249)) * 21.213203, -300 + i);
   }
   }
   endShape();
   */
   //   endRaw();
}

