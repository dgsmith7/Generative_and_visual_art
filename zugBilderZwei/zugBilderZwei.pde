// Peasy cam stuff
//import peasy.*;PeasyCam cam;//float radius = 50;

import processing.pdf.*;

//           0  1  2  3  4   5   6   7   8   9   10  11
int[] c1s = {2, 2, 2, 3, 4,  5,  6,  7,  10, 11, 15, 16};
int[] c2s = {6, 6, 7, 5, 10, 11, 10, 11, 16, 13, 6,  12};
int[] c3s = {5, 9, 4, 6, 7,  11, 3,  11, 16, 11, 3,  8};
int counter = 0;
float lineWeight = 1;
float lineSpread = 0.4; // best between .1 and 1
color colorStart;
color colorEnd;
color bgc1;
color bgc2;
float alpha = 125.0;

int c1 = c1s[counter];
int c2 = c2s[counter];
int c3 = c3s[counter];

float newX, newY, newZ;
float lastX, lastY, lastZ;

float rFactor = 0;

void setup() {
  size(2400, 2400, P3D);
  frameRate(60);
//	size(600, 933, P3D);  //3' x 4'6" 
	//  size(3600, 5600, P3D);
	colorMode(HSB, 360, 100, 100);
	colorStart = color(187,94,60);
	colorEnd = color(183,46,74);
  bgc1 = color(24,47,92);
	bgc2 = color(24,84,88);
//	stroke(225, 100, 100, 125);
	lastX = (width/2) + ((width/4) * (cos(radians(0)) + (cos(radians(0)) / 2) + (sin(radians(0)) / 3)));  
	lastY = (height/2) + ((height/4) * (sin(radians(0)) + (sin(radians(0)) / 2) + (cos(radians(0)) / 3)));  
	lastZ = -(height/2) - ((height/4) * (cos(radians(0)) + (sin(radians(0)) / 2) + (cos(radians(0)) / 3))); 
    smooth();
// more peasy cam stuff  
//cam = new PeasyCam(this, 500);cam.setMinimumDistance(50);cam.setMaximumDistance(1000);
noLoop();
}

void draw() {
	beginRaw(PDF, "MBFS_FG"+c1+"-"+c2+"-"+c3+".pdf");
//	background(0, 0, 100, 255);
//background(11,49,8);
	displayBG();
	strokeWeight(lineWeight);
	for (float rFactor = 0; rFactor < 25; rFactor = rFactor +  lineSpread) {
  		pushMatrix();
		translate((width/4.5/*3.6*/), -(height/5/*9.3*/) + (rFactor*(height/65/*56*/)));
		rotate(radians(rFactor));
//		stroke(map(rFactor, 0, 25, colorStart, colorEnd), 100, 100, alpha);
		color temp = lerpColor(colorStart, colorEnd, rFactor/25);
		stroke(temp);
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


	// solid
	//stroke(bgc1);
	//strokeWeight(2);
 // 	for (float i = 0; i < height; i = i + .1) {
 // 		line(0, i, width,i);
 // 	}
 // 	for (float i = 0; i < width; i = i + .1) {
 // 		line(i, 0, i, height);
	//}

}

//void keyPressed() {
//	saveFrame("frame"+c1+"_"+c2+"_"+c3+".png");
//	println("frame"+c1+"_"+c2+"_"+c3+".png");
//}
