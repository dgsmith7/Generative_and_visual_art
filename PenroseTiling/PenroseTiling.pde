
PShape t1, t2;


void setup() {
  size(500, 500);
  println(20 * sin(radians(18))); 
  println(20 * cos(radians(18)));
  println(20 * sin(radians(36))); 
  println(20 * cos(radians(36)));
  makeShapes();
}

void draw() {
  background(125);
  translate(width/2, height/2);
  pushMatrix();
  rotate(PI + HALF_PI);
  for (int i = 0; i < 5; i ++) {
    pushMatrix();
      rotate(i * TWO_PI / 5);
      translate(16.18, 0);
      shape(t1);
    popMatrix();
    pushMatrix();
      rotate(i * TWO_PI / 5 + (TWO_PI / 10));
      translate(26.18, 0);
      pushMatrix();
        rotate(HALF_PI);
        shape(t2);
      popMatrix();
    popMatrix();
  }
  for (int j = 0; j < 5; j ++) {
    pushMatrix();
    rotate(j * TWO_PI / 5);
    translate(4 * 16.18 + 20, 0);
    rotate(PI);
    for (int i = 0; i < 5; i ++) {
      pushMatrix();
      rotate(i * TWO_PI / 5);
      translate(16.18, 0);
      shape(t1);
      popMatrix();
    }
    popMatrix();
  }
  popMatrix();
}

void makeShapes() {
  t1 = createShape();
  t1.beginShape();
  t1.fill(102,149,200);
//  t1.noStroke();
  t1.vertex(cos(0) * 16.18, sin(0) * 16.18);
  t1.vertex(cos(HALF_PI) * 11.76, sin(HALF_PI) * 11.76);
  t1.vertex(cos(PI) * 16.18, sin(PI) * 16.18);
  t1.vertex(cos(PI+HALF_PI) * 11.76, sin(PI+HALF_PI) * 11.76);
  t1.endShape(CLOSE);
  t2 = createShape();
  t2.beginShape();
  t2.fill(69,143,6);
//  t2.noStroke();
  t2.vertex(cos(0) * 19.02, sin(0) * 19.02);
  t2.vertex(cos(HALF_PI) * 6.18, sin(HALF_PI) * 6.18);
  t2.vertex(cos(PI) * 19.02, sin(PI) * 19.02);
  t2.vertex(cos(PI+HALF_PI) * 6.18, sin(PI+HALF_PI) * 6.18);
  t2.endShape(CLOSE);
}
