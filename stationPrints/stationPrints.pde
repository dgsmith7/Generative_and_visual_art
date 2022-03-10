float xRand = 375;
float yRand = 375;
float zRand = -375;
float lastX = 375;
float lastY = 375;
float lastZ = -375;
float blackShade = 10;
int numPoints = 150;
int alphaVal = 125;
int seq = 1;
String fileName = "";


void setup() {
  size(750, 750, P3D);
  frameRate(60);
  background(180, 220, 220, 254);
  noLoop();
}

void draw() {
    background(180, 220, 220, 254);
  lights();
  for (int i = 0; i < numPoints; i ++) {
    lastX = xRand;
    lastY = yRand;
    lastZ = zRand;
    xRand = random(width - 20) + 10;
    yRand = random(height - 20) + 10;
    zRand = (random(height - 20) + 10) * -1;
    blackShade = map(-zRand, 0, height, 150, 200);
    stroke(blackShade, blackShade, blackShade, alphaVal);
    fill(blackShade, blackShade, blackShade, alphaVal);
    strokeWeight(1);
    translate(lastX, lastY, lastZ);
    sphere(13);
    translate(-lastX, -lastY, -lastZ);
//    stroke(blackShade, blackShade, blackShade, alphaVal);
    stroke(100, 160, 160, 100);
    strokeWeight(3);
    if (i < (numPoints-1)) {
      line(lastX, lastY, lastZ, xRand, yRand, zRand);
    }
  }
  saveFrame("print-#####.png");
}

void keyPressed() {
    redraw();
}
