void setup() {
  //  size(600, 400);
  fullScreen();
  stroke(0);
  strokeWeight(2);
  noFill();
}

void draw() {
  background(255);
  drawCircle(width/2, height/2, width/2);
  noLoop();
  saveFrame("circleRecurs.png");
}

void drawCircle(float x, float y, float d) {
  ellipse(x, y, d, d);
  if (d > 20) {
    drawCircle(x + d * 0.5, y, d * 0.5);
    drawCircle(x - d * 0.5, y, d * 0.5);
  }
}
