// Rotating and moving mandala
// David G. Smith - Art and Code - 8 SEP 14

PFont f;

void setup () {
  size(700, 700);
  background(100);
  noFill ();
// set up to displey text
  f = createFont("Arial", 16, true);
  draw();
}

// rotate the star, move the star in a circle, and await keystroke
void draw () {
  background(100);
  textFont(f);
  fill (255);
  textAlign(CENTER);
  text("Strike a key to exit.", width/2, 675);
  noFill ();
  drawStar(rotDeg, positX, positY);  
  rotDeg++;
  positX=int(125*(cos(radians(trackCounter))));
  positY=int(125*(sin(radians(trackCounter))));
  if ((rotDeg%2)==0) {
    trackCounter ++;
  }
  if (trackCounter == 360) {
    trackCounter=0;
  }
  if (rotDeg==360) {
    rotDeg=0;
  }
  if (keyPressed == true) {
    exit();
  }
}

// Assign random values for coloring
float colorFactorOne = random (0, 255);
float colorFactorTwo = random (0, 255);
float colorFactorThree = random (0, 255);
// Generate random number of arms for star between 3 and 17
float arms = round(random(7, 17));
// Initialize coordinates and counters for movement and rotation
int rotDeg = 0;
int positX = 0;
int positY = 0;
int trackCounter = 0;
// Assign width of star legs
int sWidth = 350;

// draw at a given coordinate
void drawStar(int rotVal, int x, int y) {
  for (float i=0; i<=arms; i=i+1) {
    pushMatrix();
    translate((width/2)+x,(height/2)+y);
    rotate((TWO_PI/arms)*i+radians(rotVal));
    drawArm();
    popMatrix();
    pushMatrix();
    translate ((width/2)+x,(height/2)+y);
    rotate((TWO_PI/arms)*i+radians(rotVal));
    drawSmallArm();
    popMatrix();
  }
}

// draw a big arms
void drawArm() {
  stroke(colorFactorOne, colorFactorTwo, colorFactorThree);
  fill (colorFactorTwo, colorFactorThree, colorFactorOne);
  for (float k=0; k<90; k=k+7) {
    ellipse ((sWidth/4), 0, sWidth/4+k, (360/arms/2));
  }
}

// draw a small arm
void drawSmallArm() {
  float x1 =(sWidth/4*cos((0.5*(TWO_PI/arms))));
  float y1 = (sWidth/4*sin((0.5*(TWO_PI/arms))));
  stroke(colorFactorThree, colorFactorOne, colorFactorTwo);
  noFill ();
  for (float j=0; j<30; j=j+7) {
    bezier (x1, -y1, j, 0, j, 5, x1, y1);
  }
}

