import controlP5.*;

ControlP5 cp5;
int myColor = color(0,0,0);
int c1Hue = 100;
int c1Sat = 100;
int c1Brt = 100;
int c2Hue = 100;
int c2Sat = 100;
int c2Brt = 100;
int c3Hue = 100;
int c3Sat = 100;
int c3Brt = 100;

void setup() {
  size(900,500);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  cp5 = new ControlP5(this);
  cp5.addSlider("c1Hue")
     .setPosition(100,400)
     .setRange(0,360)
     ;
  cp5.addSlider("c1Sat")
     .setPosition(100,425)
     .setRange(0,100)
     ;
  cp5.addSlider("c1Brt")
     .setPosition(100,450)
     .setRange(0,100)
     ;
  cp5.addSlider("c2Hue")
     .setPosition(400,400)
     .setRange(0,360)
     ;
  cp5.addSlider("c2Sat")
     .setPosition(400,425)
     .setRange(0,100)
     ;
  cp5.addSlider("c2Brt")
     .setPosition(400,450)
     .setRange(0,100)
     ;
  cp5.addSlider("c3Hue")
     .setPosition(700,400)
     .setRange(0,360)
     ;
  cp5.addSlider("c3Sat")
     .setPosition(700,425)
     .setRange(0,100)
     ;
  cp5.addSlider("c3Brt")
     .setPosition(700,450)
     .setRange(0,100)
     ;
}

void draw() {
  background(125);
  fill(c1Hue, c1Sat, c1Brt);
  rect(0,0,300,375);  
  fill(c2Hue, c2Sat, c2Brt);
  rect(300,0,300,375);  
  fill(c3Hue, c3Sat, c3Brt);
  rect(600,0,300,375);  
}

void sliderValue(float theColor) {
  myColor = color(theColor);
  println("a slider event. setting background to "+theColor);
}
