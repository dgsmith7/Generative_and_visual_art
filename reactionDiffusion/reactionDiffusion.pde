import processing.pdf.*; 
PVector[][] cells;
PVector[][] newCells;
int w, h;

// diffussion-reaction equation factors
float diffA = 1.0;
float diffB = 0.5;
float feedRate = .0545;
float killRate = .062;

// laplacian factors
float diag = .05;
float adj = 0.2;
int dropsPerTwoFifty = 25;
  float resultant;

void setup() {
  size(1100, 1400, P2D);
  //size(1920, 1080, P2D);
  //fullScreen(P2D);
  colorMode(HSB, 360, 100, 100);
  w = width;
  h = height;
  cells = new PVector[h][w];
  newCells = new PVector[h][w];
  seedCells();
}

void draw() {
  computeNextGen();
  background(175, 255, 255);
  displayCells();
  swap();
//  saveFrame("aquaCoral-####.png");
if (frameCount % 50 == 0) {
  println(frameCount);
}
if (frameCount == 6000) {
  saveFrame("diffReact.png");
  exit();
}

}

void seedCells() {
  //fill all with A
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j ++) {
      cells[j][i] = new PVector(1, 0);
      newCells[j][i] = new PVector(1, 0);
    }
  }
  //seed with B
  //for (int i = (width/2) - 5; i < (width/2) + 5; i++) {
  //  for (int j = (height/2) - 5; j < (height/2) + 5; j ++) {
  //    cells[j][i].y = 1;
  //  }
  //} 
  // drop in chem B in 10 x 10 pixel squares randomly at density per 250 px sqr
  int density = floor((width*height) / 62500) * dropsPerTwoFifty;
  for (int i = 0; i < density; i++) {
    int h = floor(random(height-10));
    int w = floor(random(width-10));
    for (int j = 0; j < 10; j++) {
      for (int k = 0; k < 10; k++) {
        cells[h+j][w+k].y = 1;
      }
    }
  }
// seed an oval of B
  //for (int i = 0; i < 360; i += 5) {
  //  int h = floor(height/2 + sin(radians(i)) * height/3);
  //  int w = floor(width/2 + cos(radians(i)) * width/3);
  //  for (int j = 0; j < 10; j++) {
  //    for (int k = 0; k < 10; k++) {
  //      cells[h+j][w+k].y = 1;
  //    }
  //  }
  //}
}

void computeNextGen() {
  for (int i = 1; i < width - 1; i++) {
    for (int j = 1; j < height - 1; j ++) {
      float valA = cells[j][i].x + 
        (diffA * laplacianA(j, i)) -
        (cells[j][i].x * cells[j][i].y * cells[j][i].y) + //reaction rate
        (feedRate * (1 - cells[j][i].x));
      float valB = cells[j][i].y + 
        (diffB * laplacianB(j, i)) +
        (cells[j][i].x * cells[j][i].y * cells[j][i].y) - //reaction rate
        ((killRate + feedRate) * cells[j][i].y);
      newCells[j][i].x = constrain(valA, 0, 1); 
      newCells[j][i].y = constrain(valB, 0, 1);
    }
  }
}

float laplacianA(int x, int y) {
  return 
    cells[x-1][y-1].x * diag + 
    cells[x][y-1].x * adj + 
    cells[x+1][y-1].x * diag + 
    cells[x-1][y].x * adj + 
    cells[x][y].x * -1.0 + 
    cells[x+1][y].x * adj + 
    cells[x-1][y+1].x * diag + 
    cells[x][y+1].x * adj + 
    cells[x+1][y+1].x * diag;
}

float laplacianB(int x, int y) {
  return 
    cells[x-1][y-1].y * diag + 
    cells[x][y-1].y * adj + 
    cells[x+1][y-1].y * diag + 
    cells[x-1][y].y * adj + 
    cells[x][y].y * -1.0 + 
    cells[x+1][y].y * adj + 
    cells[x-1][y+1].y * diag + 
    cells[x][y+1].y * adj + 
    cells[x+1][y+1].y * diag;
}

void displayCells() {
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j ++) {
      resultant = (newCells[j][i].x - newCells[j][i].y) * 255;
      stroke(constrain(resultant, -0, 255));
      //stroke(map(resultant, -255, 255, 150, 190), 50, 75);
      //if (resultant >= 140 && resultant < 190)  {
      //      stroke(30, 100, 100);
      //    }
      point(i, j);
    }
  }
}

void swap() {
  PVector[][] temp = new PVector[h][w];
  arrayCopy(cells, temp);
  arrayCopy(newCells, cells);
  arrayCopy(temp, newCells);
}

void mouseClicked() {
  println(hue(get(mouseX, mouseY)) + " " + saturation(get(mouseX, mouseY)) + " " + brightness(get(mouseX, mouseY)));
}
