color c1 = color(255, 124, 0);
color c2 = color(169, 0, 255);
color temp;
float lerper = 0;

void setup() {
  size(500, 500);
  strokeWeight(1);
  noLoop();
}

void draw() {
  for (float i = 0; i < height; i = i + 1) {
    lerper = map(i, 0, height, 0, 1);
    temp = lerpColor(c1, c2, lerper);
    stroke(temp);
    line(0, i, width, i);
  }
}
