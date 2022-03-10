import controlP5.*;

ControlP5 cp5;

int box1Hue = 359;
int box1Sat = 99;
int box1Brt = 99;
int box2Hue = 0;
int box2Sat = 0;
int box2Brt = 0;
float cx, cy;

void setup() {
  size(600, 600);
  background(100);
  noStroke();
  cp5 = new ControlP5(this);
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  cx = width /2;
  cy = height /2;

  cp5.addSlider("OuterHue")
    .setPosition(100, 425)
    .setSize(100, 25)
    .setValue(180)
    .setRange(0, 360);

  cp5.addSlider("OuterSaturation")
    .setPosition(100, 475)
    .setSize(100, 25)
    .setValue(50)
    .setRange(0, 100);

  cp5.addSlider("OuterBrightness")
    .setPosition(100, 525)
    .setSize(100, 25)
    .setValue(50)
    .setRange(0, 100);   

  cp5.addSlider("InnerHue")
    .setPosition(350, 425)
    .setSize(100, 25)
    .setValue(180)
    .setRange(0, 360);

  cp5.addSlider("InnerSaturation")
    .setPosition(350, 475)
    .setSize(100, 25)
    .setValue(50)
    .setRange(0, 100);

  cp5.addSlider("InnerBrightness")
    .setPosition(350, 525)
    .setSize(100, 25)
    .setValue(50)
    .setRange(0, 100);
}

void draw() {
  fill(box1Hue, box1Sat, box1Brt);
  rect(cx, cy, 200, 200);
  fill(box2Hue, box2Sat, box2Brt);
  rect(cx, cy, 100, 100);
  fill((box1Hue + box2Hue)/2, (box1Sat + box2Sat)/2, (box1Brt + box2Brt)/2);
  rect(400, 50, 50, 50);
  mixBox(400, 100, color(box1Hue, box1Sat, box1Brt), color(box2Hue, box2Sat, box2Brt));
}

void OuterHue (int theHue) {
  box1Hue = theHue;
}

void OuterSaturation (int theSat) {
  box1Sat = theSat;
}

void OuterBrightness (int theBrt) {
  box1Brt = theBrt;
}

void InnerHue (int theHue) {
  box2Hue = theHue;
}

void InnerSaturation (int theSat) {
  box2Sat = theSat;
}

void InnerBrightness (int theBrt) {
  box2Brt = theBrt;
}

void mixBox(float x, float y, color c1, color c2) {
  stroke(c1);
  for (int i = 0; i < 50; i = i + 2) {
    for (int j = 0; j < 50; j = j + 2) {
        stroke(c1);
        point(x + i, y + j);
        point(x + i + 1, y + j + 1);
        stroke(c2);
        point(x + i + 1, y + j);
        point(x + i, y + j + 1);
      } 
    }
    noStroke();
}
  
