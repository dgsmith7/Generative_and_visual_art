// Peasy cam stuff
import peasy.*;
PeasyCam cam;
float radius = 50;

int[] c1s = {2, 2, 2, 3, 4, 5, 6, 7, 10, 11, 15, 16};
int[] c2s = {6, 6, 7, 5, 10, 11, 10, 11, 16, 13, 6, 12};
int[] c3s = {5, 9, 4, 6, 7, 11, 3, 11, 16, 11, 3, 8};

int c1 = 0;
int c2 = 0;
int c3 = 0;

int counter1 = 0;
int counter2 = 0;
int counter3 = 0;

float newX, newY, newZ;
float lastX, lastY, lastZ;

void setup() {
  size(770, 550, P3D);
  noStroke();
  strokeWeight(1);
  noFill();
  lastX = cos(radians(0)) + (cos(radians(0)) / 2) + (sin(radians(0)) / 3); 
  lastY = sin(radians(0)) + (sin(radians(0)) / 2) + (cos(radians(0)) / 3); 
  lastZ = 0;
  // more peasy cam stuff  
  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(1500);
  //    noLoop();
}

void draw() {
  
  ambientLight(100, 100, 100);
//    ambientLight (40, 20, 40);
////  ambientLight (20, 150, 80);
//  lightSpecular(255, 215, 215);
  directionalLight(185, 195, 255, -1, 1.25, -1);
//  ambient(50);//  pushMatrix ();

  c1 = c1s[counter1];
  c2 = c2s[counter2];
  c3 = c3s[counter3];


  //  fill(0);
  //  fill(#253BF5);
  //  println(c1 + " " + c2 + " " + c3);
  background(255);
  //  noFill();
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
  for (float i = 0; i < 360; i = i + .05) {
    //    stroke(map(c1, 0, 16, 0, 255), map(c2, 0, 16, 0, 255), map(c3, 0, 16, 0, 255));
    noStroke();//    stroke(c1, c2, c3);
    //stroke(#5C1AD8);
    //    ellipse(lastX, lastY, 5, 5);
    pushMatrix();
    //    translate(width/2 + lastX, height / 2 + lastY, -250 + lastZ);
    translate(lastX, lastY, lastZ);
    box(5);
    popMatrix();




    newX = 100 * (cos(radians(c1 * i)) + (cos(radians(c2 * i)) / 2) + (sin(radians(c3 * i)) / 3)); 
    newY = 100 * (sin(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3)); 
    if (i < 180) {
      newZ = i;
    } else {
      newZ = 360 -i;
    }
    newZ = 100 * (cos(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3)); 


fill(255, 0, 0);
//    fill(map(c1, 0, 16, 0, 255), map(c2, 0, 16, 0, 255), map(c3, 0, 16, 0, 255));
    //noStroke();//    stroke(c1, c2, c3);
    //    ellipse(newX, newY, 13, 13);
    pushMatrix();
    //    translate(width/2 + newX, height / 2 + newY, -250 + newZ);
    translate(newX, newY, newZ);
    box(5);
    popMatrix();
    lastX = newX; 
    lastY = newY;
    lastZ = newZ;
  }


/*
  int inc = 11;
  c1 = c1s[counter+inc];
  c2 = c2s[counter+inc];
  c3 = c3s[counter+inc];

  for (float i = 0; i < 360; i = i + .1) {

    noStroke();
    pushMatrix();
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

    fill(255, 0, 0, 127);
    pushMatrix();
    translate(newX, newY, newZ);
    box(10);
    popMatrix();
    lastX = newX; 
    lastY = newY;
    lastZ = newZ;
  }
  */
}


void keyPressed() {
//    saveFrame("lit2"+c1+"_"+c2+"_"+c3+".png");
    println("lit2"+c1+"_"+c2+"_"+c3+".png");
    counter1++; counter2++; counter3++;
    if (counter1 > 11) {
      exit();
    }
    //if (counter1 > 12) {
    //  counter1 = 0;
    //  counter2++;
    //}
    //if (counter2 > 12) {
    //  counter2 = 0;
    //  counter3 ++;
    //}
    //if (counter3 > 12) {
    //  exit();//c3 = 0;
    //}
    redraw();
}
