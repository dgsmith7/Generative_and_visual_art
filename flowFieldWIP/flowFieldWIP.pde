int xDim = 144;
int yDim = 60;
PVector[][] grid = new PVector[yDim][xDim];
int blockSize = 10;
float noiseScale = 0.25;
Mover m1;

void setup(){
  size(1440, 600); //(xDim * blockSize, yDim * blockSize);
  initGrid();
  initMover();
//  noLoop();
}

void draw(){
  background(125);
  displayGrid();
  m1.display();
  int gridY = constrain(int(map(m1.posit.y, 0, height, 1, yDim - 1)), 0, yDim - 1);
  int gridX = constrain(int(map(m1.posit.x, 0, width, 1, xDim - 1)), 0, xDim - 1);
  m1.move(grid[gridY][gridX]);
}

void initGrid() {
  for (int j = 0; j < yDim; j++) {
    for (int i = 0; i < xDim; i++) {
      grid[j][i] = PVector.fromAngle(map(noise(i, j) * noiseScale, 0, 1* noiseScale, 0, TWO_PI));
      grid[j][i].setMag(blockSize);
    }
  }
}

void initMover() {
  m1 = new Mover(width/2, height/2, color(0, 0, 255), 10);
}

void displayGrid() {
  for (int j = 0; j < yDim; j++) {
    for (int i = 0; i < xDim; i++) {
      fill(255, 0, 0);
      noStroke();
      ellipse((i*blockSize) + (blockSize/2), (j * blockSize) + (blockSize/2), 3, 3);
      stroke(0);
      line((i*blockSize) + (blockSize/2), 
           (j * blockSize) + (blockSize/2), 
           (i * blockSize) + (blockSize/2) + (grid[j][i].x), 
           (j * blockSize) + (blockSize/2) + (grid[j][i].y));
    }
  }
}
