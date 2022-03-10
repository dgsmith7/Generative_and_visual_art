int nPoints = 50;
float multFactor = 0;
float incFactor = 0.01;
PVector[] station = new PVector[nPoints];
PVector[] destStation = new PVector[nPoints];

void setup() {
  //  fullScreen();
  size(1000, 800);
  //  size(1920, 1080);
  initStations();
  stroke(#B17ED3);
  textSize(32);
  //  frameRate(10);
  colorMode(HSB, nPoints, 100, 100);
  strokeWeight(7);
}

void draw() {
  background(0, 0, 39);
  //  text(multFactor, 10, 35);
  for (int i = 0; i < nPoints; i ++) {
    int dest = int((i * multFactor) % nPoints);
    //    int dest = int((i * multFactor * multFactor) % nPoints);
    stroke(dest, 100, 100, 100);
    //  line(station[i].x, station[i].y, destStation[dest].x, destStation[dest].y);
    line(station[i].x, station[i].y, station[dest].x, station[dest].y);
  }
  multFactor = multFactor + incFactor;
  if (multFactor == 200) {
    multFactor = 0;
  }
  //    stroke(multFactor, 100, 100);
}

void initStations() {
  float angFactor = 360.0/nPoints;
  println(angFactor);
  for (int i = 0; i < nPoints; i ++) {
    station[i] = new PVector((width/2 + cos(radians(angFactor * i)) * ((width/2)*.75)), 
      (height/2 + sin(radians(angFactor * i)) * ((width/2)*.75)));
    destStation[i] = new PVector((width/2 + cos(radians(angFactor * i)) * width), 
      (height/2 + sin(radians(angFactor * i)) * width));
  }
}

void keyPressed() {
  if (keyCode == UP) {
    multFactor = multFactor + incFactor;
  }
  if (keyCode == DOWN) {
    multFactor = multFactor - incFactor;
  }
}

void mouseClicked() {
  multFactor = round(map(mouseX, 0, width, 0, 200)*100)/100;
}
