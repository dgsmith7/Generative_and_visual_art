float oneInch = 800/22;  // for 800 pixel screen and 22" paper
float circumf = 0;
float probBottom = .61;  // probability closed bottom is drawn
float probSide = .35;  // probabaility closed side wall is drawn
int incr = 0;
float starter = random(360);
int printCounter = 0;

void setup() {
  size (800, 800);
  noFill();
  noLoop();
}

void draw() {
  background(255);
  for (int i = 2; i < 19; i ++) { // number of rings spaced at 1/2 inch apart
    starter = random(15);  // make it so not all arc start at the 90
    stroke(0);
    //    ellipse(width/2, height/2, (i+1)*oneInch, (i+1)*oneInch); // draws full rings
    //    stroke(255, 0, 0);
    circumf = int(PI*(i+1));
    incr = int(360/circumf);  // ensures interval for each tile is evenly spaced around ring at appx one inch
    while (360%incr != 0) {
      incr = incr + 1;
    }
    for (float j = 0; j < 360; j = j + /*int(360/circumf)*/incr) {  // appx one tile each inch on circumf or ring
      //      ellipse((width/2)+cos(radians(j+starter))*(((i+1)*oneInch)/2), (height/2)+sin(radians(j+starter))*(((i+1)*oneInch)/2), 5, 5);
      if ((random(1) + probBottom) > 1) {  // draws bottom edge full 
        arc(width/2, height/2, (i+1)*oneInch, (i+1)*oneInch, 
          radians(j+starter), radians(j+starter+incr));
      } else {  // draws bottom egde with gap
        arc(width/2, height/2, (i+1)*oneInch, (i+1)*oneInch, 
          radians(j+starter), radians(j+starter+(incr/3)));
        arc(width/2, height/2, (i+1)*oneInch, (i+1)*oneInch, 
          radians(j+starter+((incr/3)*2)), radians(j+starter+incr));
      }
      if ((i < 18) && (random(1) + probSide) > 1) {  // draws side wall (or not)
        line((width/2)+cos(radians(j+starter))*(((i+1)*oneInch)/2), 
          (height/2)+sin(radians(j+starter))*(((i+1)*oneInch)/2), 
          (width/2)+cos(radians(j+starter))*(((i+2)*oneInch)/2), 
          (height/2)+sin(radians(j+starter))*(((i+2)*oneInch)/2));
      }
    }
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("print" + printCounter + ".pdf");
    printCounter++;
  }
  redraw();
}
