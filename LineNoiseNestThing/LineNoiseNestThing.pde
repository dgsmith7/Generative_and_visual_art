float cx = 250;
float cy = 250;
float cz = -250;
float noiseScale = 1;
float noiseX = random(100) - 50;
float noiseY = random(100) - 50;
float noiseA = random(100) - 50;
float w = random(450);
float h = random(450);
float rotAng = random(TWO_PI);
float strokeShade = 255;
int saveCounter = 0;

void setup() {
  size(500, 500);
  background(100);
  noFill();
}

void draw() {
  stroke(strokeShade);
  pushMatrix();
  translate(cx, cy);
  rotate(rotAng);
  ellipse(0, 0, w, h);
  w = w + noise(noiseX)*noiseScale;
  if (random(2) >= 1) {w *= -1;}
  noiseX ++;
  h = h + noise(noiseY)*noiseScale;
  if (random(2) >= 1) {h *= -1;}
  noiseY ++;
  rotAng = rotAng - noise(noiseA)*noiseScale;
  if (random(2) >= 1) {rotAng *= -1;}
  noiseA ++;
  strokeShade = strokeShade - noise(noiseA);
  popMatrix();
}

void keyPressed() {
  if ((key == 's') || (key == 'S')) {
    saveFrame("Image-" + saveCounter+".pdf");
    saveCounter ++;
  }
  if ((key == 'b') || (key == 'B')) {
    background(100);
  }
}
