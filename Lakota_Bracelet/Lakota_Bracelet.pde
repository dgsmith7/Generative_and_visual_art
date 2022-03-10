int alpha = 225;
color[] palette = {
  color(255, 0, 0, alpha), color(255, 128, 0, alpha), color(255, 255, 0, alpha), color(0, 255, 255, alpha), color(0, 0, 0, alpha)
};
//    red 0                      orange 1                     yellow 2                     turq 3                  black 4

int[][] pattern = {
 {4,4,4,4,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,4,4,4,4,4,4,4,4,0,0,0,0,0,4,4,4},
 {4,4,4,4,4,1,1,1,4,4,4,4,4,4,4,4,1,1,1,4,4,4,4,4,3,4,4,4,4,1,1,1,4,4,4,2},
 {4,4,4,4,4,4,2,4,4,0,0,0,0,0,4,4,4,2,4,4,4,4,4,3,0,3,4,4,4,4,2,4,4,4,2,3},
 {4,3,4,4,4,4,4,4,4,0,3,3,3,0,4,4,4,4,4,4,4,4,3,0,1,0,3,4,4,4,4,4,4,4,2,3},
 {4,0,3,4,4,4,4,0,0,0,3,2,3,0,0,0,0,4,4,4,4,3,0,1,2,1,0,3,4,4,4,4,4,2,2,3},
 {4,1,0,3,4,4,4,0,3,3,3,2,3,3,3,3,0,4,4,4,3,0,1,2,4,2,1,0,3,4,4,4,2,3,3,3},
 {4,2,1,0,3,4,4,0,3,2,2,2,2,2,2,3,0,4,4,3,0,1,2,4,4,4,2,1,0,3,4,4,2,3,3,3}
 };
 
float blockW, blockH, offsetX, offsetY;                   

void setup() {
  size (1200, 180);
  blockW = ceil(width / 72);
  blockH = ceil(height / 13);
  offsetX = (width - (72*blockW))/2;
  offsetY = (height - (13*blockH))/2;
  noStroke();
}

void draw() {
  background(0);
  for (int i = 0; i < 13; i ++) {
    for (int j = 0; j < 73; j ++) {
      if ((i <= 6) && (j <= 35)) {
        fill(palette[pattern[i][j]]);
        rect(offsetX + j * blockW, offsetY + (i * blockH), blockW, blockH);
      }
      if ((i > 6) && (j <= 35)) {
        fill(palette[pattern[12 - i][j]]);
        rect(offsetX + j * blockW, offsetY + (i * blockH), blockW, blockH);
      }
      if ((i <= 6) && (j > 36)) {
        fill(palette[pattern[i][72 - j]]);
        rect(offsetX + ((j - 1) * blockW), offsetY + (i * blockH), blockW, blockH);
      }
      if ((i > 6) && (j > 36)) {
        fill(palette[pattern[12 - i][72 - j]]);
        rect(offsetX + ((j - 1) * blockW), offsetY + (i * blockH), blockW, blockH);
      }
    }
  }
}

