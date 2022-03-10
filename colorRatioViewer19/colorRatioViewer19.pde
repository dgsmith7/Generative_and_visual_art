import controlP5.*;

ControlP5 cp5;

color c1, c2, c3;
int c1hue, c1sat, c1brt, c1alph;
int c2hue, c2sat, c2brt, c2alph;
int c3hue, c3sat, c3brt, c3alph;

void setup() {
//  size(1050, 700);
  fullScreen();
  noStroke();
  cp5 = new ControlP5(this);
  setupColors();
  addSliders();
}

void draw() {
  background(125);
  c1 = color(c1hue, c1sat, c1brt, c1alph);
  fill(c1);
  rect(0, 0, width/3, height);
  c2 = color(c2hue, c2sat, c2brt, c2alph);
  fill(c2);
  rect(width/3, 0, width/3, height);
  c3 = color(c3hue, c3sat, c3brt, c3alph);
  fill(c3);
  rect((width/3) * 2, 0, width/3, height);
}

void setupColors() {
  colorMode(HSB, 360, 100, 100, 100);
  c1hue = 0;
  c1sat = 99;
  c1brt = 99;
  c1alph = 99;
  c2hue = 119;
  c2sat = 99; 
  c2brt = 99;
  c2alph = 99;
  c3hue = 239;
  c3sat = 99;
  c3brt = 99;
  c3alph = 99;
  c1 = color(c1hue, c1sat, c1brt, c1alph);
  c2 = color(c2hue, c2sat, c2brt, c2alph);
  c3 = color(c3hue, c3sat, c3brt, c3alph);
}

void addSliders() {
    cp5.addSlider("c1hue")
     .setPosition(50, 25)
     .setRange(0, 360)
     ;
    cp5.addSlider("c1sat")
     .setPosition(50, 50)
     .setRange(0, 100)
     ;
    cp5.addSlider("c1brt")
     .setPosition(50, 75)
     .setRange(0, 100)
     ;
    cp5.addSlider("c1alph")
     .setPosition(50, 100)
     .setRange(0, 100)
     ;
    cp5.addSlider("c2hue")
     .setPosition(width/3 + 50, 25)
     .setRange(0, 360)
     ;
    cp5.addSlider("c2sat")
     .setPosition(width/3 + 50, 50)
     .setRange(0, 100)
     ;
    cp5.addSlider("c2brt")
     .setPosition(width/3 + 50, 75)
     .setRange(0, 100)
     ;
    cp5.addSlider("c2alph")
     .setPosition(width/3 + 50, 100)
     .setRange(0, 100)
     ;
    cp5.addSlider("c3hue")
     .setPosition((width/3) * 2 + 50, 25)
     .setRange(0, 360)
     ;
    cp5.addSlider("c3sat")
     .setPosition((width/3) * 2 + 50, 50)
     .setRange(0, 100)
     ;
    cp5.addSlider("c3brt")
     .setPosition((width/3) * 2 + 50, 75)
     .setRange(0, 100)
     ;
    cp5.addSlider("c3alph")
     .setPosition((width/3) * 2 + 50, 100)
     .setRange(0, 100)
     ;
}
