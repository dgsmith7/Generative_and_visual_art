// Peasy cam stuff
//import peasy.*;PeasyCam cam;//float radius = 50;

import processing.pdf.*;

//           0  1  2  3  4   5   6   7   8   9   10  11
int[] c1s = {2, 2, 2, 3, 4,  5,  6,  7,  10, 11, 15, 16};
int[] c2s = {6, 6, 7, 5, 10, 11, 10, 11, 16, 13, 6,  12};
int[] c3s = {5, 9, 4, 6, 7,  11, 3,  11, 16, 11, 3,  8};
 
void setColors() {  //  0                1                2                 3             4                  5                    6               7                 8                 9               10                  11
	color[] b1 = {color(24,47,92), color(255,49,8), color(26,80,95), color(6,75,99), color(11,67,45), color(32,32,85), color(214,56,42), color(178,43,65), color(190,99,51), color(221,23,16), color(193,69,34), color(194,19,31)};   
	color[] b2 = {color(24,84,88), color(255,49,8), color(44,79,95), color(6,75,99), color(186,15,19), color(25,42,69), color(200,77,72), color(186,71,51), color(190,99,51), color(221,23,16), color(215,72,21), color(194,19,31)};
	color[] c1 = {color(183,46,74), color(282,71,78), color(214,24,55), color(221,59,14), color(204,26,76), color(195,13,43), color(32,8,94), color(0, 0, 99), color(187,42,74), color(179,9,73), color(3,69,95), color(39,59,85)};
	color[] c2 = {color(187,94,60), color(252,89,95), color(34,22,85), color(6,28,66), color(199,61,52), color(59,6,79), color(12,51,92), color(186,71,51), color(14,26,99 ), color(354,81,62), color(17,20,45), color(190,52,59)};
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
int counter = 10;
float lineWeight = 0.1;
float lineSpread = 0.2; // best between .1 and 1
color colorStart;
color colorEnd;
color bgc1;
color bgc2;
float alpha = 125.0;

int c1 = c1s[counter];
int c2 = c2s[counter];
int c3 = c3s[counter];

int lineCounter = 0;

float newX, newY, newZ;
float lastX, lastY, lastZ;

float rFactor = 0;

void setup() {
	size(600, 933, P3D);  //3' x 4'6" 
	//  size(3600, 5600, P3D);
	colorMode(HSB, 360, 100, 100);

setColors();


	colorStart = css[counter];
	colorEnd = ces[counter];;
	bgc1 = bgc1s[counter];
	bgc2 = bgc2s[counter];
//	stroke(225, 100, 100, 125);
	lastX = (width/2) + ((width/4) * (cos(radians(0)) + (cos(radians(0)) / 2) + (sin(radians(0)) / 3)));  
	lastY = (height/2) + ((height/4) * (sin(radians(0)) + (sin(radians(0)) / 2) + (cos(radians(0)) / 3)));  
	lastZ = -(height/2) - ((height/4) * (cos(radians(0)) + (sin(radians(0)) / 2) + (cos(radians(0)) / 3))); 
    smooth();
// more peasy cam stuff  
//cam = new PeasyCam(this, 500);cam.setMinimumDistance(50);cam.setMaximumDistance(1000);
//noLoop();
}

void draw() {
	beginRaw(PDF, "trial2parmetric"+c1+"-"+c2+"-"+c3+".pdf");
//	background(0, 0, 100, 255);
//background(125);
	displayBG();
	strokeWeight(lineWeight);


lineCounter = 0;

	for (float rFactor = 0; rFactor < 25; rFactor = rFactor +  lineSpread) {
		pushMatrix();
		translate((width/3.6), -(height/9.3) + (rFactor*(height/56)));
		rotate(radians(rFactor));
//		stroke(map(rFactor, 0, 25, colorStart, colorEnd), 100, 100, alpha);
//		color temp = lerpColor(colorStart, colorEnd, rFactor/25);

color temp;
  float a1 = map(rFactor, 0, 25, 50, 255);
  float a2 = map((25 - rFactor), 0, 25, 50, 255);
if (lineCounter % 2 == 0) {
		stroke(color(hue(colorStart), saturation(colorStart), brightness(colorStart), a1));
} 
else {
		stroke(color(hue(colorEnd), saturation(colorEnd), brightness(colorEnd), a2));
}
lineCounter++;

//stroke(color(0));
		lastX = (width/2) + ((width/4) * (cos(radians(0)) + (cos(radians(0)) / 2) + (sin(radians(0)) / 3)));  
		lastY = (height/2) + ((height/4) * (sin(radians(0)) + (sin(radians(0)) / 2) + (cos(radians(0)) / 3)));  
		lastZ = -(height/2) - ((height/4) * (cos(radians(0)) + (sin(radians(0)) / 2) + (cos(radians(0)) / 3))); 
		for (float i = 0; i < 361; i = i + .1) {
			if ((i%2) == 0) {
				newX = (width/2) + ((width/4) * (cos(radians(c1 * i)) + (cos(radians(c2 * i)) / 2) + (sin(radians(c3 * i)) / 3))); 
				newY = (height/2) + ((height/4) * (sin(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
				newZ = -(height/2) - ((height/4) * (cos(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
			}
			else {
				newX = (width/2) + ((width/4) * (cos(radians(c1 * i)) + (cos(radians(c2 * i)) / 2) + (sin(radians(c3 * i)) / 3))); 
				newY = (height/2) + ((height/4) * (sin(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
				newZ = -(height/2) - ((height/4) * (cos(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3)));
			}
			line(lastX, lastY, lastZ, newX, newY, newZ);
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


void keyPressed() {
	saveFrame("frame"+c1+"_"+c2+"_"+c3+".png");
	println("frame"+c1+"_"+c2+"_"+c3+".png");
}