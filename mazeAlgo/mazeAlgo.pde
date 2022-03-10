int k = 0;

int mazeX = 7;
int mazeY = 7;
int playerX = 0;
int playerY = 0;
int playerOrientation = 2; //0-up 1-right 2-down 3-left
int[][] allBoxes = {{9, 7, 6, 6, 6, 5, 9},
                    {9, 1, 3, 7, 11, 12, 9},
                    {14, 6, 13, 8, 9, 1, 9},
                    {14, 6, 6, 4 ,9, 3, 9},
                    {9, 7, 6, 6, 13, 8, 9},
                    {1, 14, 6, 11, 6, 5, 9},
                    {2, 13, 4, 10, 4, 10, 8}};
int[][] allArcs = {{6, 6, 13, 14, 5, 13, 5},
                    {6, 8, 11, 6, 10, 5, 10},
                    {13, 3, 4, 6, 8, 9, 11},
                    {8, 7, 2, 6, 10, 7, 2},
                    {7, 8, 12, 5, 6, 6, 6},
                    {8, 3, 10, 9, 5, 13, 5},
                    {7, 2, 8, 14, 7, 6, 2},
                    {6, 13, 7, 4, 6, 6, 6}};
                    

void setup() {
  size(500, 500);
  background(100);
  noFill();
  noLoop();
//  initArcs(k);
  randArcs();
}

void draw() {
  background(100);
  displayArcMaze();
//  displayMaze();
//  displayPlayer(playerX, playerY);
}

void displayArcMaze() {
  int radius = 30;
  for (int i = 0; i < 7; i ++) { // rings inner to outer
    radius = radius + 20;
//    stroke(radius*2);
    for (int j = 0; j < 8; j ++) { // sections top right clockwise
      switch(allArcs[j][i]) { // top
        case 0:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6: 
        case 7: 
        case 11: //line(i * 50 + 100, j * 50 + 100, i * 50 + 149, j * 50 + 100);
                 arc(width/2, height/2, radius*2+39, radius*2+39, radians(j*45), radians((j*45)+45));
                 break;
        default: arc(width/2, height/2, radius*2+39, radius*2+39, radians(j*45), radians((j*45)+15));
                 arc(width/2, height/2, radius*2+39, radius*2+39, radians((j*45)+30), radians((j*45)+45));
                 break;
      }
      switch(allArcs[j][i]) { // right
        case 0:
        case 1:
        case 3:
        case 4:
        case 5:
        case 8: 
        case 9:
        case 12: //line(i * 50 + 149, j * 50 + 100, i * 50 + 149, j * 50 + 149);
                  line(width/2+cos(radians((j*45)+45))*radius, 
                       height/2+sin(radians((j*45)+45))*radius,
                       width/2+cos(radians((j*45)+45))*(radius+19),
                       height/2+sin(radians((j*45)+45))*(radius+19));
                 break;
      }
      switch(allArcs[j][i]) { // bottom
        case 0:
        case 1:
        case 2:
        case 4:
        case 6:
        case 8: 
        case 10: 
        case 13: //line(i * 50 + 149, j * 50 + 149, i * 50 + 100, j * 50 + 149);
                 arc(width/2, height/2, radius*2, radius*2, radians(j*45), radians((j*45)+45));
                 break;
        default: arc(width/2, height/2, radius*2, radius*2, radians(j*45), radians((j*45)+15));
                 arc(width/2, height/2, radius*2, radius*2, radians((j*45)+30), radians((j*45)+45));
                 break;
      }
      switch(allArcs[j][i]) { // left
        case 0:
        case 1:
        case 2:
        case 3:
        case 7:
        case 9: 
        case 10: 
        case 14: //line(i * 50 + 100, j * 50 + 149, i * 50 + 100, j * 50 + 100);
                  line(width/2+cos(radians(j*45))*radius, 
                       height/2+sin(radians(j*45))*radius,
                       width/2+cos(radians((j*45)))*(radius+19),
                       height/2+sin(radians((j*45)))*(radius+19));
                 break;
      }
      
    }
  }
}

void displayMaze() {
//testMaze with coordinates
/*
  for (int i = 0; i < mazeX; i ++) {
    for (int j = 0; j < mazeY; j++) {
      rect(i * 50 + 100, j * 50 + 100, 50, 50);
      text(i + " - " + j, i * 50 + 110, j * 50 + 110);
    }
  }
*/
  for (int i = 0; i < mazeX; i ++) {
    for (int j = 0; j < mazeY; j++) {
      switch(allBoxes[j][i]) { // top
        case 0:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6: 
        case 7: 
        case 11: line(i * 50 + 100, j * 50 + 100, i * 50 + 149, j * 50 + 100);
                 break;
      }
      switch(allBoxes[j][i]) { // right
        case 0:
        case 1:
        case 3:
        case 4:
        case 5:
        case 8: 
        case 9:
        case 12: line(i * 50 + 149, j * 50 + 100, i * 50 + 149, j * 50 + 149);
                 break;
      }
      switch(allBoxes[j][i]) { // bottom
        case 0:
        case 1:
        case 2:
        case 4:
        case 6:
        case 8: 
        case 10: 
        case 13: line(i * 50 + 149, j * 50 + 149, i * 50 + 100, j * 50 + 149);
                 break;
      }
      switch(allBoxes[j][i]) { // left
        case 0:
        case 1:
        case 2:
        case 3:
        case 7:
        case 9: 
        case 10: 
        case 14: line(i * 50 + 100, j * 50 + 149, i * 50 + 100, j * 50 + 100);
                 break;
      }
//            text(allBoxes[j][i], i * 50 + 110, j * 50 + 110);
    }
  }

}

void displayPlayer(int x, int y) {
  int newX = x * 50 + 120;
  int newY = y * 50 + 120;
  stroke(255);
  fill(255);
  beginShape();
    vertex(newX, newY);
    vertex(newX + 2, newY + 6);
    vertex(newX + 4, newY);
    vertex(newX + 2, newY + 2);
  endShape(CLOSE);
  noFill();
}

void initMaze(int which) {
   for (int i = 0; i < mazeX; i ++) {
    for (int j = 0; j < mazeY; j++) {
      allBoxes[i][j] = which;
    }
  }
}

void initArcs(int which) {
   for (int i = 0; i < 8; i ++) {
    for (int j = 0; j < 7; j++) {
      allArcs[i][j] = which;
    }
  }
}

void randArcs() {
   for (int i = 0; i < 8; i ++) {
    for (int j = 0; j < 7; j++) {
      allArcs[i][j] = int(random(16));
    }
  }
}

void keyPressed() {
  k = k + 1;
  initArcs(k);
  println(k);
  redraw();
}

/*non recursive
while still in maze {
check right side
if right side free move right and orient right break
else check front
     if front is free move forward break
     else check left
          if left is free move left and orient left break
          else move back orient back break
}

recursive
follow wall right() {
if still in maze = true {
check right
if right is free move right and orient right follow wall right}
else still in maze = false
}*/
