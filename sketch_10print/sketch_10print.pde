float x = 0;
float y = 0;
float spacing = 25;

void setup() {
  size(1100, 1400);
  background(255);
}

void draw() {
  stroke(0);
  if (random(1) < 0.5) {
    line(x, y, x + spacing, y + spacing);
  } else {
    line(x, y + spacing, x + spacing, y);
  }
  x = x + spacing;
  if (x > width) {
    x = 0; 
    y = y + spacing;
    if (y > height) {
      saveFrame("10print.png");
      exit();
    }
  }
}
