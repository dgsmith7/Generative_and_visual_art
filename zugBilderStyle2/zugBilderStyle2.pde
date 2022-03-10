// Peasy cam stuff
//import peasy.*;PeasyCam cam;
//float radius = 50;

import processing.svg.*;

//          30  1  2  3  4   5   6   7   8   9   10  11  12  13  14   15  16  17  18  19  20  21 22  23  24   25  26  27  28  29  
int[] c1s = {2, 2, 2, 3, 4, 5,  6,  7,  10, 11,  15, 16, 4,  10, 8,   9,  9,  13, 7,  11, 5,  6, 12, 15, 8,   14, 8,  11, 15, 11};
int[] c2s = {6, 6, 7, 5, 10,11, 10, 11, 16, 13,  6,  12, 14, 13, 15,  1,  1,  16, 16, 9,  2,  6, 11, 2,  4,   6,  14, 16, 13, 14};
int[] c3s = {5, 9, 4, 6, 7, 11, 3,  11, 16, 11,  3,  8,  3,  5,  12,  2,  14, 9,  16, 1,  10, 4, 2,  3,  13,  9,  14, 14, 14, 4};

void setColors() {  //  0                1                   2                     3                  4                  5                    6                  7                    8                 9                       10                  11               12               13             14                 15               16             17              18            19              20              21              22               23              24             25                26              27           28             29            
  color[] b1 = {color(24, 47, 92),  color(255, 49, 8),  color(26, 80, 95),  color(6, 75, 99),   color(11, 67, 45),  color(32, 32, 85),  color(214, 56, 42), color(178, 43, 65), color(190, 99, 51), color(221, 23, 16), color(193, 69, 34), color(194, 19, 31), color(#011f4b), color(#4a4e4d), color(#2a4d69),  color(#ee4035), color(#96ceb4), color(#e1e1d7), color(#f2e9d8), color(#13142d), color(#ae5959), color(#1f333c), color(#edbd0d), color(#c7dae3), color(#303956), color(#ebf4f6), color(#d67b54), color(#c50a72), color(#f5eace), color(#479ad8)};
  color[] b2 = {color(24, 84, 88),  color(255, 49, 8),  color(44, 79, 95),  color(6, 75, 99),   color(186, 15, 19), color(25, 93, 75),  color(200, 77, 72), color(186, 71, 51), color(190, 99, 51), color(221, 23, 16), color(215, 72, 21), color(194, 19, 31), color(#03396c), color(#0e9aa7), color(#4b86b4),  color(#f37736), color(#ffeead), color(#9bc6c9), color(#f9ce71), color(#47406f), color(#b27e5b), color(#7a341b), color(#c4c4c4), color(#414860), color(#8b9dc3), color(#bdeaee), color(#53947e), color(#490042), color(#f3b722), color(#467d98)};
  color[] c1 = {color(183, 46, 74), color(282, 71, 78), color(214, 24, 55), color(221, 59, 14), color(204, 26, 76), color(195, 90, 41), color(32, 8, 94),   color(0, 0, 99),    color(187, 42, 74), color(179, 9, 73),  color(3, 69, 95),   color(39, 59, 85),  color(#005b96), color(#3da4ab), color(#adcbe3),  color(#077615), color(#ff6f69), color(#6bb099), color(#eb6d3d), color(#97a1d0), color(#8aa579), color(#680711), color(#c48a3a), color(#852b14), color(#cccccc), color(#76b4bd), color(#104F90), color(#253e2f), color(#b4d3ca), color(#7c4b4b)};
  color[] c2 = {color(187, 94, 60), color(252, 89, 95), color(34, 22, 85),  color(6, 28, 66),   color(199, 61, 52), color(59, 16, 28),  color(12, 51, 92),  color(186, 71, 51), color(14, 26, 99 ), color(354, 81, 62), color(17, 20, 45),  color(190, 52, 59), color(#6497b1), color(#f6cd61), color(#e7eff6),  color(#199367), color(#ffcc5c), color(#227481), color(#7cd0c0), color(#b2263b), color(#6bc9c7), color(#bb996b), color(#930000), color(#9f5636), color(#6b787e), color(#58668b), color(#c7a495), color(#470727), color(#1E7657), color(#563c3c)};
  /*trial
   b1[11] = color(170,60,73);
   b2[11] = color(201,6,45);
   c1[11] = color(330,43,92);
   c2[11] = color(185,27,82);
   */
  /* office
   b1[10] = color(0, 0, 75);
   b2[10] = color(0, 0, 75);
   c1[10] = color(31, 78, 99);
   c2[10] = color(97, 11, 97);
   */
  bgc1s = b1;
  bgc2s = b2;
  css = c1;
  ces = c2;
}

color[] bgc1s = new color[12];
color[] bgc2s = new color[12];
color[] css = new color[12];
color[] ces = new color[12];

int counter = 0;

float lineWeight = 0.1;
float lineSpread = 0.2; // best between .1 and 1
color colorStart;
color colorEnd;
color bgc1;
color bgc2;
float alpha = 175.0;

int co1 = c1s[counter];
int co2 = c2s[counter];
int co3 = c3s[counter];

int lineCounter = 0;

float newX, newY, newZ;
float lastX, lastY, lastZ;

float rFactor = 0;
//PGraphics svg;

void setup() {
  size(1024, 1024, P3D);
//  size(600, 933, P3D);  //3' x 4'6"
  //  size(3600, 5600, P3D);
  colorMode(HSB, 360, 100, 100);

  setColors();
  color[] b1 = {color(24, 47, 92),  color(255, 49, 8),  color(26, 80, 95),  color(6, 75, 99),   color(11, 67, 45),  color(32, 32, 85),  color(214, 56, 42), color(178, 43, 65), color(190, 99, 51), color(221, 23, 16), color(193, 69, 34), color(194, 19, 31), color(#011f4b), color(#4a4e4d), color(#2a4d69),  color(#ee4035), color(#96ceb4), color(#e1e1d7), color(#f2e9d8), color(#13142d), color(#ae5959), color(#1f333c), color(#edbd0d), color(#c7dae3), color(#303956), color(#ebf4f6), color(#d67b54), color(#c50a72), color(#f5eace), color(#479ad8)};
  color[] b2 = {color(24, 84, 88),  color(255, 49, 8),  color(44, 79, 95),  color(6, 75, 99),   color(186, 15, 19), color(25, 93, 75),  color(200, 77, 72), color(186, 71, 51), color(190, 99, 51), color(221, 23, 16), color(215, 72, 21), color(194, 19, 31), color(#03396c), color(#0e9aa7), color(#4b86b4),  color(#f37736), color(#ffeead), color(#9bc6c9), color(#f9ce71), color(#47406f), color(#b27e5b), color(#7a341b), color(#c4c4c4), color(#414860), color(#8b9dc3), color(#bdeaee), color(#53947e), color(#490042), color(#f3b722), color(#467d98)};
  color[] c1 = {color(183, 46, 74), color(282, 71, 78), color(214, 24, 55), color(221, 59, 14), color(204, 26, 76), color(195, 90, 41), color(32, 8, 94),   color(0, 0, 99),    color(187, 42, 74), color(179, 9, 73),  color(3, 69, 95),   color(39, 59, 85),  color(#005b96), color(#3da4ab), color(#adcbe3),  color(#077615), color(#ff6f69), color(#6bb099), color(#eb6d3d), color(#97a1d0), color(#8aa579), color(#680711), color(#c48a3a), color(#852b14), color(#cccccc), color(#76b4bd), color(#104F90), color(#253e2f), color(#b4d3ca), color(#7c4b4b)};
  color[] c2 = {color(187, 94, 60), color(252, 89, 95), color(34, 22, 85),  color(6, 28, 66),   color(199, 61, 52), color(59, 16, 28),  color(12, 51, 92),  color(186, 71, 51), color(14, 26, 99 ), color(354, 81, 62), color(17, 20, 45),  color(190, 52, 59), color(#6497b1), color(#f6cd61), color(#e7eff6),  color(#199367), color(#ffcc5c), color(#227481), color(#7cd0c0), color(#b2263b), color(#6bc9c7), color(#bb996b), color(#930000), color(#9f5636), color(#6b787e), color(#58668b), color(#c7a495), color(#470727), color(#1E7657), color(#563c3c)};


  colorStart = css[counter];
  colorEnd = ces[counter];
  
  bgc1 = bgc1s[counter];
  bgc2 = bgc2s[counter];
  //	stroke(225, 100, 100, 125);
  lastX = (width/2) + ((width/4) * (cos(radians(0)) + (cos(radians(0)) / 2) + (sin(radians(0)) / 3)));
  lastY = (height/2) + ((height/4) * (sin(radians(0)) + (sin(radians(0)) / 2) + (cos(radians(0)) / 3)));
  lastZ = -(height/2) - ((height/4) * (cos(radians(0)) + (sin(radians(0)) / 2) + (cos(radians(0)) / 3)));
//  smooth();
  // more peasy cam stuff
  //cam = new PeasyCam(this, 500);cam.setMinimumDistance(50);cam.setMaximumDistance(1000);
//  noLoop();
}

void draw() {
  beginRaw(SVG, counter+".svg");
//  smooth();
  //	background(0, 0, 100, 255);
  //  background(125);
  displayBG();

  //  strokeWeight(1);
  //for (float i = 0; i < height; i = i + .1) {
  //  float lerper = map(i, 0, height, 0, 1);
  //  color temp = lerpColor(bgc1, bgc2, lerper);
  //  stroke(temp);
  //  line(0, i, width, i);
  //}

  
  strokeWeight(lineWeight);


  lineCounter = 0;

  for (float rFactor = 0; rFactor < 25; rFactor = rFactor +  lineSpread) {
    pushMatrix();
//    translate((width/3.6), -(height/9.3) + (rFactor*(height/56)));
    translate((width/4.5/*3.6*/), -(height/5/*9.3*/) + (rFactor*(height/65/*56*/)));
    rotate(radians(rFactor));
    //		stroke(map(rFactor, 0, 25, colorStart, colorEnd), 100, 100, alpha);
    //		color temp = lerpColor(colorStart, colorEnd, rFactor/25);

    color temp;
    float a1 = map(rFactor, 0, 25, 150, 255);
    float a2 = map((25 - rFactor), 0, 25, 150, 255);
    if (lineCounter % 2 == 0) {
      stroke(color(hue(colorStart), saturation(colorStart), brightness(colorStart), a1));
    } else {
      stroke(color(hue(colorEnd), saturation(colorEnd), brightness(colorEnd), a2));
    }
    lineCounter++;

    //stroke(color(0));
    lastX = (width/2) + ((width/4) * (cos(radians(0)) + (cos(radians(0)) / 2) + (sin(radians(0)) / 3)));
    lastY = (height/2) + ((height/4) * (sin(radians(0)) + (sin(radians(0)) / 2) + (cos(radians(0)) / 3)));
    lastZ = -(height/2) - ((height/4) * (cos(radians(0)) + (sin(radians(0)) / 2) + (cos(radians(0)) / 3)));
    for (float i = 0; i < 361; i = i + 0.5) {
      if ((i%2) == 0) {
        newX = (width/2) + ((width/4) * (cos(radians(co1 * i)) + (cos(radians(co2 * i)) / 2) + (sin(radians(co3 * i)) / 3)));
        newY = (height/2) + ((height/4) * (sin(radians(co1 * i)) + (sin(radians(co2 * i)) / 2) + (cos(radians(co3 * i)) / 3)));
        newZ = -(height/2) - ((height/4) * (cos(radians(co1 * i)) + (sin(radians(co2 * i)) / 2) + (cos(radians(co3 * i)) / 3)));
      } else {
        newX = (width/2) + ((width/4) * (cos(radians(co1 * i)) + (cos(radians(co2 * i)) / 2) + (sin(radians(co3 * i)) / 3)));
        newY = (height/2) + ((height/4) * (sin(radians(co1 * i)) + (sin(radians(co2 * i)) / 2) + (cos(radians(co3 * i)) / 3)));
        newZ = -(height/2) - ((height/4) * (cos(radians(co1 * i)) + (sin(radians(co2 * i)) / 2) + (cos(radians(co3 * i)) / 3)));
      }
      line(lastX, lastY+50, lastZ, newX, newY+50, newZ);
      lastX = newX;
      lastY = newY;
      lastZ = newZ;
    }
    popMatrix();
  }
  endRaw();

  exit();
}

void displayBG() {
  // 2-color lerp
  strokeWeight(1);
  for (float i = 0; i < height; i = i + .1) {
    float lerper = map(i, 0, height, 0, 1);
    color temp = lerpColor(bgc1, bgc2, lerper);
    stroke(temp);
    line(0, i, width, i);
  }


  /*	// solid
   	stroke(bgc1);
   	strokeWeight(2);
   	for (float i = 0; i < height; i = i + .1) {
   		line(0, i, width,i);
   	}
   	for (float i = 0; i < width; i = i + .1) {
   		line(i, 0, i, height);
   	}
   */
}


//void keyPressed() {
////  saveFrame("frame"+c1+"_"+c2+"_"+c3+".png");
////  println("frame"+c1+"_"+c2+"_"+c3+".png");
//}
