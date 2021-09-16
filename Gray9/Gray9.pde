void setup() {
  size(1000, 200);
  background(175);
  colorMode(RGB, 255, 255, 255);
  noStroke();
  noLoop();
}

void draw() {
  int f = 0;
  for (int i = 50; i < 950; i = i + 100) {
    fill(f);
    rect(i, 50, 100, 100);
    f = f + (255/9);
  }
  save("Gray9.png");
}