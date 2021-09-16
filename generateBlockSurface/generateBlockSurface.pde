void setup() {
  size(500, 500);
  background(125);
  noLoop();
}

void draw() {
  doLayer1();
  doLayer2();
  doLayer3();
  doLayer4();
  doLayer5();
}

void doLayer1() {
  stroke(0);
  noFill();
  beginShape();
  vertex(0, 0);
  vertex(0, width);
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  fill(90, 180, 200);
  beginShape();
  vertex(25, 25);
  vertex(width - 25, 25);
  vertex(height - 25, width - 25);
  vertex(25, width - 25);
  endShape(CLOSE);
}

void doLayer2() {
  fill(130, 180, 120);
  for (int i = 0; i < 15; i++) {
    nextShape(6, (random(width - 120) + 25), (random(height - 120) + 25));
  }
}

void doLayer3() {
}

void doLayer4() {
}

void doLayer5() {
}

void nextShape(int sides, float x, float y) {
  float x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, x8, y8, tw, th;
  float r;
  switch(sides) {
  case 4:
    x2 = x + random(50) + 20;
    y2 = y;
    x3 = x2;
    y3 = y + random(50) + 20;
    x4 = x;
    y4 = y3;
    beginShape();
    vertex(x, y);
    vertex(x2, y2);
    vertex(x3, y3);
    vertex(x4, y4);
    endShape(CLOSE);
    break;
  case 6:
    tw = random(50) + 40;
    th = random(50) + 40;
    x2 = x + tw;
    y2 = y;
    x3 = x2;
    y3 = y + th;
    x4 = x3 - (random(tw/4) + tw/4);
    y4 = y3;
    x5 = x4;
    y5 = y4 - (random(th/4) + th/4);
    x6 = x5 - (random(tw/4) + tw/4);
    y6 = y5;
    x7 = x6;
    y7 = y6 + (random(th/4) + th/4);
    x8 = x;
    y8 = y7;
    beginShape();
    vertex(x, y);
    vertex(x2, y2);
    vertex(x3, y3);
    vertex(x4, y4);
    vertex(x5, y5);
    vertex(x6, y6);
    vertex(x7, y7);
    vertex(x8, y8);
    endShape(CLOSE);
    break;
  case 8:
    break;
  }
}
