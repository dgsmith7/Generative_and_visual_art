float x, y, z;
float radius = 1500;
float thetaStart = PI + HALF_PI;
float thetaWide = QUARTER_PI / 4;
float thetaEnd = thetaStart + thetaWide;
int numberOfTiles = 100;
Tile allTiles[];

void setup() {
  allTiles = new Tile[numberOfTiles];
  size(1200, 700, P3D);
  frameRate(60);
  noStroke();
  initTiles();
}

void draw() {
  background(25, 0, 0);
  for (int i = 0; i < numberOfTiles; i ++) {
    allTiles[i].display();
  }
  for (int i = 0; i < numberOfTiles; i ++) {
    allTiles[i].move();
  }
}

void initTiles() {
  for (int i = 0; i < numberOfTiles; i ++) {
    allTiles[i] = new Tile();
  }
}

void keyPressed() {
  for (int i = 0; i < numberOfTiles; i ++) {
    allTiles[i].move();
  }
}
