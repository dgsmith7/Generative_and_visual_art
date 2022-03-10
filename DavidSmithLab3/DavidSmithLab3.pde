void setup () {
  size(500, 500);
  background(colorOfBackground);
  noFill ();
// Repeat this loop for each arm of the star
  for (float i=0; i<=arms; i=i+1) {
    pushMatrix();
    translate(width/2, height/2);
    rotate((TWO_PI/arms)*i);
    drawArm();
    popMatrix();
    pushMatrix();
    translate (width/2, height/2);
    rotate(((TWO_PI/arms)*i));
    drawSmallArm();
    popMatrix();
  }
}

// Assign random values for coloring, ensuring background does not match star
float colorOfBackground = random (0, 125);
float colorOfBigArms = random (126, 255);
float colorOfSmallArms = random (126, 255);
// Generate random number of arms for star between 3 and 17
float arms = round(random(3, 17));

void drawArm() {
  stroke(colorOfBigArms, 50, colorOfBigArms-125);
  fill (200, 0, 100);
  for (float k=0; k<90; k=k+7) {
  ellipse ((width/4), 0, width/4+k, (360/arms/2));
  }
}

void drawSmallArm() {
  float x1 =(width/4*cos((0.5*(TWO_PI/arms))));
  float y1 = (width/4*sin((0.5*(TWO_PI/arms))));
  stroke(colorOfSmallArms, 100, colorOfSmallArms-125);
  noFill ();
  for (float j=0; j<30; j=j+7) {
  bezier (x1, -y1, j, 0, j, 5, x1, y1);
  }
}

