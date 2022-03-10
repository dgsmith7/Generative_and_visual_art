int xBlocks;
int yBlocks;
int blockSize = 25;

Stick[][] allSticks;

void setup() {
  fullScreen();
  xBlocks = int(width / blockSize);
  yBlocks = int(height / blockSize);
  println(xBlocks, yBlocks);
  allSticks = new Stick[yBlocks][xBlocks];
  initSticks();
}

void draw() {
  background(125);
  displaySticks();
}

void initSticks() {
  for (int i = 0; i < xBlocks; i ++) {
    for (int j = 0; j < yBlocks; j ++) {
      allSticks[j][i] = new Stick(i * blockSize, j * blockSize);
//      println(j, i);
    }
  }
}

void displaySticks() {
  for (int i = 0; i < xBlocks; i ++) {
    for (int j = 0; j < yBlocks; j ++) {
      allSticks[j][i].display();
    }
  }
}
