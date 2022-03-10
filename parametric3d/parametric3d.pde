// Peasy cam stuff
import peasy.*;
PeasyCam cam;
float radius = 50;

int[] c1s = {2, 2, 2, 3, 4, 5, 6, 7, 10, 11, 15, 16};
int[] c2s = {6, 6, 7, 5, 10, 11, 10, 11, 16, 13, 6, 12};
int[] c3s = {5, 9, 4, 6, 7, 11, 3, 11, 16, 11, 3, 8};

int c1 = 2;
int c2 = 6;
int c3 = 5;

int counter = 0;

float newX, newY, newZ;
float lastX, lastY, lastZ;

void setup() {
  size(700, 500, P3D);
  frameRate(60);
  noStroke();
  strokeWeight(1);
  noFill();
  lastX = cos(radians(0)) + (cos(radians(0)) / 2) + (sin(radians(0)) / 3); 
  lastY = sin(radians(0)) + (sin(radians(0)) / 2) + (cos(radians(0)) / 3); 
  lastZ = 0;
  // more peasy cam stuff  
  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(500);
  cam.setMaximumDistance(1000);
  //    noLoop();
}

void draw() {
  c1 = c1s[counter];
  c2 = c2s[counter];
  c3 = c3s[counter];


  fill(0);
  //  fill(#253BF5);
  //  println(c1 + " " + c2 + " " + c3);
  background(255);
  noFill();
  //stroke(c1, c2, c3);
  //fill(c1,c2,c3);
  //pushMatrix();
  //translate(-width/2, -height/2);
  //rect(0, 0, width, height);
  //popMatrix();
  //fill(0);
//  fill(map(c1, 0, 16, 0, 255), map(c2, 0, 16, 0, 255), map(c3, 0, 16, 0, 255));
  //  pushMatrix();
  //  translate(width/2, height/2);
  for (float i = 0; i < 360; i = i + .1) {
//    stroke(map(c1, 0, 16, 0, 255), map(c2, 0, 16, 0, 255), map(c3, 0, 16, 0, 255));
noStroke();//    stroke(c1, c2, c3);
    //stroke(#5C1AD8);
    //    ellipse(lastX, lastY, 5, 5);
    pushMatrix();
    //    translate(width/2 + lastX, height / 2 + lastY, -250 + lastZ);
    translate(lastX, lastY, lastZ);
    box(10);
    popMatrix();




    newX = 100 * (cos(radians(c1 * i)) + (cos(radians(c2 * i)) / 2) + (sin(radians(c3 * i)) / 3)); 
    newY = 100 * (sin(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3)); 
    if (i < 180) {
      newZ = i;
    } else {
      newZ = 360 -i;
    }
    newZ = 100 * (cos(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3)); 



    fill(map(c1, 0, 16, 0, 255), map(c2, 0, 16, 0, 255), map(c3, 0, 16, 0, 255));
//noStroke();//    stroke(c1, c2, c3);
    //    ellipse(newX, newY, 13, 13);
    pushMatrix();
    //    translate(width/2 + newX, height / 2 + newY, -250 + newZ);
    translate(newX, newY, newZ);
    box(25);
    popMatrix();
    lastX = newX; 
    lastY = newY;
    lastZ = newZ;
  }
  //     saveFrame("fiveBySevenBW"+c1+"_"+c2+"_"+c3+".png");
  //println("fiveBySevenBW"+c1+"_"+c2+"_"+c3+".png");
  /*
  c1++;
   if (c1 > 16) {
   c1 = 0;
   c2++;
   }
   if (c2 > 16) {
   c2 = 0;
   c3 ++;
   }
   if (c3 > 16) {
   //    c3 = 0;
   exit();
   }
   */
  //redraw();
  //counter ++;
  //if (counter == 12) {exit();}
}


void keyPressed() {
  //  saveFrame("frame"+c1+"_"+c2+"_"+c3+".png");
  //  println("frame"+c1+"_"+c2+"_"+c3+".png");
  //  c1++;
  //  if (c1 > 16) {
  //    c1 = 0;
  //    c2++;
  //  }
  //  if (c2 > 16) {
  //    c2 = 0;
  //    c3 ++;
  //  }
  //  if (c3 > 16) {
  //    c3 = 0;
  //  }
  //  redraw();
}
