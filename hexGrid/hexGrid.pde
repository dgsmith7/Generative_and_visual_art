Hex[][] allCells;
int w, h;

void setup() {
  size(510, 489);
  w = floor(width/30) + 1;
  h = floor(height/18) + 1;
  allCells = new Hex[h][w];
  initCells();
  noLoop();
  //h1 = new Hex(100, 100, 1);//top left
  //h2 = new Hex(160, 100, 2);//next on same level - add 60 to x
  //h3 = new Hex(100, 135, 3);//below top left - add 35 to y
  //h4 = new Hex(130, 118, 4);//staggered down and right - 30 to x, 18 to y
  //h5 = new Hex(130, 153, 5);//next down staggered
}

void draw() {
  background(0);
  displayCells();
  saveFrame("hexGrid.png");
  exit();
}

void initCells() {
  int count = 0;
  for (int i = 0; i < w; i ++) {
    for (int j = 0; j < h; j ++) {
      allCells[j][i] = new Hex(i * 30, j * 35 + ((i % 2)*17.5), count);
      count ++;
    }
  }
}

void displayCells() {
  for (int i = 0; i < w; i ++) {
    for (int j = 0; j < h; j ++) {
      allCells[j][i].display();
    }
  }
}
