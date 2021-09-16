float[] intervals = {20, 11.25, 8.18, 6.206};
boolean white = true;

void setup() {
  size(800, 800);
  noFill();
}

void draw() {
  background(125);
  for (int j = 0; j < 4; j ++) {
    if (j % 2 == 0) {
      stroke(255);
    } else {
      stroke(0);
    }
    white = !white;
    for (float i = 0; i < 360; i = i + intervals[j]) {
      if (white) {
        stroke(255);
        white = false;
      } else {
        stroke(0);
        white = true;
      }      
      float x = width/2 + cos(radians(i)) * (125 + (j*50));
      float y = height/2 + sin(radians(i)) * (125 + (j*50));
      pushMatrix();
      translate(x, y);
      if (j % 2 == 0) {
        rotate(radians(-15));
      } else {
        rotate(radians(15));
      }
      rotate(radians(i));
      rect(0, 0, 25, 25);
      popMatrix();
    }
  }
}
