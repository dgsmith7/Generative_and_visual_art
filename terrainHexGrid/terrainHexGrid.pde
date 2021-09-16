//import peasy.*;
//PeasyCam cam;

float wide = 700;
float high = 500;
float size = 100;
float size2 = .86 * size;
int n = int(high / size2) + int(size2);
int n2 = int(wide / size) + int(size);
PVector[][] matrix = new PVector[n][n2];
PVector p;

void setup() {
  size(700, 500, P3D);  // must be set to same values as wide and high (above)
  frameRate(60);
  background(0);
  fill(255);
  stroke(255);
  setGridPoints();
  
  //cam = new PeasyCam(this, 500);
  //cam.setMinimumDistance(500);
  //cam.setMaximumDistance(2500);

}

void draw() {
  background(0);
//  displayGrid();
  displayGridFlat();
}

void setGridPoints() {
  for (int i = 0; i < n; i ++) {
    for (int j = 0; j < n2; j ++) {
      if (i % 2 == 0) {
        p = new PVector (j * size - size, i * size2);
      } else {
        p = new PVector(j * size + (size/2) - size, i * size2);
      }
      matrix[i][j] = p;
    }
  }
}

void displayGrid() {
  for (int i = 1; i < (n-1); i = i + 2) {
    for (int j = 1; j < (n2-1); j = j + 1) {
      line(matrix[i-1][j].x, matrix[i-1][j].y, matrix[i-1][j+1].x, matrix[i-1][j+1].y);
      line(matrix[i-1][j+1].x, matrix[i-1][j+1].y, matrix[i][j+1].x, matrix[i][j+1].y);
      line(matrix[i][j+1].x, matrix[i][j+1].y, matrix[i+1][j+1].x, matrix[i+1][j+1].y);
      line(matrix[i+1][j+1].x, matrix[i+1][j+1].y, matrix[i+1][j].x, matrix[i+1][j].y);
      line(matrix[i+1][j].x, matrix[i+1][j].y, matrix[i][j-1].x, matrix[i][j-1].y);
      line(matrix[i][j-1].x, matrix[i][j-1].y, matrix[i-1][j].x, matrix[i-1][j].y);
      line(matrix[i-1][j].x, matrix[i-1][j].y, matrix[i+1][j+1].x, matrix[i+1][j+1].y);
      line(matrix[i-1][j+1].x, matrix[i-1][j].y, matrix[i+1][j].x, matrix[i+1][j].y);
      line(matrix[i][j+1].x, matrix[i][j+1].y, matrix[i][j-1].x, matrix[i][j-1].y);
    }
  }
}

void displayGridFlat() {
  pushMatrix();
  translate(-wide*2, 0, -1500);
  for (int i = 1; i < (n-1); i = i + 2) {
    for (int j = 1; j < (n2-1); j = j + 1) {
      line(matrix[i-1][j].x, high, matrix[i-1][j].y, matrix[i-1][j+1].x, high, matrix[i-1][j+1].y);
      line(matrix[i-1][j+1].x, high, matrix[i-1][j+1].y, matrix[i][j+1].x, high, matrix[i][j+1].y);
      line(matrix[i][j+1].x, high, matrix[i][j+1].y, matrix[i+1][j+1].x, high, matrix[i+1][j+1].y);
      line(matrix[i+1][j+1].x, high, matrix[i+1][j+1].y, matrix[i+1][j].x, high, matrix[i+1][j].y);
      line(matrix[i+1][j].x, high, matrix[i+1][j].y, matrix[i][j-1].x, high, matrix[i][j-1].y);
      line(matrix[i][j-1].x, high, matrix[i][j-1].y, matrix[i-1][j].x, high, matrix[i-1][j].y);
      line(matrix[i-1][j].x, high, matrix[i-1][j].y, matrix[i+1][j+1].x, high, matrix[i+1][j+1].y);
      line(matrix[i-1][j+1].x, high, matrix[i-1][j].y, matrix[i+1][j].x, high, matrix[i+1][j].y);
      line(matrix[i][j+1].x, high, matrix[i][j+1].y, matrix[i][j-1].x, high, matrix[i][j-1].y);
    }
  }
  popMatrix();
}
