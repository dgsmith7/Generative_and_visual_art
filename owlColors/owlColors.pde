import processing.pdf.*;

color[] rgbs = {
  color(119, 117,  98),
  color(148, 164, 117),
  color(114, 114, 103),
  color( 81,  77,  72),
  color(151, 139, 134),
  color( 87, 117,  49),
  color(181, 179, 174),
  color( 48,  39,  38),
  color(187, 192, 189),
  color(233, 224, 224),
  color(146, 146, 146),
  color(117, 115, 113),
  color( 24,  18,  16),
  color(234,  87,  14),
  color(161,  51,  11),
  color( 92,  24,   8)
};

void setup() {
  size (525, 525, PDF, "owlColorGrid.pdf");
  background(255);
  noStroke();
  noLoop();
}

void draw() {
  int counter = 0;
  for (int i = 0;  i < 4; i++) {
    for (int j = 0; j < 4; j ++) {
      fill(rgbs[counter]);
      rect(25+ i*125, 25+ j*125, 100, 100);
      counter ++;
    }
  }
  exit();
}