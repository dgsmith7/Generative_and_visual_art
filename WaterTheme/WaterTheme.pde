import processing.pdf.*;

int fieldSize = 45;
int margin = int(.5 * fieldSize);

void setup() {
  size (1000, 500); //, PDF, "mainCabinet.pdf");
  background(#45DEDA);
  fill(#45D7E3);
  stroke(#5EE3FC);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  noLoop();
}

void draw() {
  background(#38958E);//(225);//(#45DEDA);
  drawRegions();
  for (int i = margin; i < width - margin; i = i + fieldSize) {
    for (int j = margin; j < height - margin; j = j + fieldSize) {
      if (random(10) < 3.2) {
        drawThree(i, j, fieldSize);
      }
    }
  }
  println("Finished.");
//  exit();
}

void drawRegions() {
  noiseDetail(5, .85);
  color c5 = color(#2B43D6, 125);
  color c4 = color(#2B87D6, 125);
  color c3 = color(#2BA1D6, 125);
  color c2 = color(#2BC3D6, 125);
  color c1 = color(#2BD6C9, 125);
  stroke(c1);
  noiseSeed(frameCount);
  for (int j = 0; j < width; j = j + 1) {
    line(j, 0, j, noise(j * .001) * 200 + (0 * (height/7)));
  }
  stroke(c2);
  noiseSeed(frameCount + 1);
  for (int j = 0; j < width; j = j + 1) {
    line(j, noise((j) * .001) * 200 + (.25 * (height/7)), j, noise(j * .001) * 200 + (3 * (height/7)));
  }
  stroke(c3);
  noiseSeed(frameCount + 2);
  for (int j = 0; j < width; j = j + 1) {
    line(j, noise((j) * .001) * 200 + (1.5 * (height/7)), j, noise(j * .001) * 200 + (4 * (height/7)));
  }
  stroke(c4);
  noiseSeed(frameCount + 3);
  for (int j = 0; j < width; j = j + 1) {
    line(j, noise((j) * .001) * 200 + (3 * (height/7)), j, noise(j * .001) * 200 + (4.25 * (height/7)));
  }
  stroke(c5);
  noiseSeed(frameCount + 4);
  for (int j = 0; j < width; j = j + 1) {
    line(j, noise((j) * .001) * 200 + (4 * (height/7)), j, noise(j * .001) * 200 + (5 * (height/7)));
  }
  noStroke();
}

void drawThree(float fieldX, float fieldY, float fieldSize) {
  float hueRange = 10;
  float hueFloor = 175;
  float satRange = 20;
  float satFloor = 30;
  float alphaRange = 125;
  float alphaFloor = 75;
  color c1 = color(random(hueRange) + hueFloor, random(satRange) + satFloor, 100, random(alphaRange) + alphaFloor);
  float x1 = fieldX + (random(.6) * fieldSize);
  float y1 = fieldY + random(.6) * fieldSize;
  float s1 = random(.8 * fieldSize) + (.2 * fieldSize);
  color c2 = color(random(hueRange) + hueFloor, random(satRange) + satFloor, 100, random(alphaRange) + alphaFloor);
  float x2 = fieldX + (random(.4) * fieldSize) + (.4 * fieldSize);
  float y2 = fieldY + (random(.4) * fieldSize) + (.2 * fieldSize);
  float s2 = random(.9 * fieldSize) + (.2 * fieldSize);
  color c3 = color(random(hueRange) + hueFloor, random(satRange) + satFloor, 100, random(alphaRange) + alphaFloor);
  float x3 = fieldX + (random(.4) * fieldSize) + (.1 * fieldSize);
  float y3 = fieldY + (random(.4) * fieldSize) + (.6 * fieldSize);
  float s3 = random(.5 * fieldSize) + (.2 * fieldSize);
  fill(c1);
  ellipse(x1, y1, s1, s1);

  color from = color(#00A1A5);//color(#4758A7, 125);
  color to = color(c1);//color(c1, 125);
  for (int k = 1; k <9; k ++) {
    color lc = lerpColor(from, to, 1/k);
    strokeWeight(1);
    stroke(lc); 
    noFill(); 
    arc(x1, y1, s1, s1, (3 * (PI/4)) - (k * (PI/16)), (3 * (PI/4)) + (k * (PI/16))); 
    noStroke();
  }
  //  stroke(#4758A7, 125); noFill(); arc(x1, y1, s1, s1, PI/5, PI+PI/5); noStroke();




  stroke(0, 0, 100);
  strokeWeight(s1*.15);
  arc(x1, y1, s1 * .7, s1 * .7, (3 * PI)/2 + (PI/5), TWO_PI - (PI/5));
  strokeWeight(1);
  noStroke();
  fill(c2);
  ellipse(x2, y2, s2, s2);
  to = color(c2);//color(c1, 125);
  for (int k = 1; k <9; k ++) {
    color lc = lerpColor(from, to, 1/k);
    strokeWeight(1);
    stroke(lc); 
    noFill(); 
    arc(x2, y2, s2, s2, (3 * (PI/4)) - (k * (PI/16)), (3 * (PI/4)) + (k * (PI/16))); 
    noStroke();
  }
  //  stroke(#4758A7, 125); noFill(); arc(x2, y2, s2, s2, PI/5, PI+PI/5); noStroke();
  stroke(0, 0, 100);
  strokeWeight(s2*.15);
  arc(x2, y2, s2 * .7, s2 * .7, (3 * PI)/2 + (PI/5), TWO_PI - (PI/5));
  strokeWeight(1);
  noStroke();
  fill(c3);
  ellipse(x3, y3, s3, s3);
  to = color(c3);//color(c1, 125);
  for (int k = 1; k <9; k ++) {
    color lc = lerpColor(from, to, 1/k);
    strokeWeight(1);
    stroke(lc); 
    noFill(); 
    arc(x3, y3, s3, s3, (3 * (PI/4)) - (k * (PI/16)), (3 * (PI/4)) + (k * (PI/16))); 
    noStroke();
  }
  //  stroke(#4758A7, 125); noFill(); arc(x3, y3, s3, s3, PI/5, PI+PI/5); noStroke();
  stroke(0, 0, 100);
  strokeWeight(s3*.15);
  arc(x3, y3, s3 * .7, s3 * .7, (3 * PI)/2 + (PI/5), TWO_PI - (PI/5));
  strokeWeight(1);
  noStroke();
}

void mouseClicked() {
  redraw();
}