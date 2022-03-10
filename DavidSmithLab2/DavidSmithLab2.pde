// Draws Birthday Picture 1 by Herbert Bayer
// By David G. Smith

void setup() {
  size (620, 620);
  background (255);

// Sets up multidimensional arrays for colors, sizes and positions of shapes

int [][] colorScheme = {{0, 1, 2, 1, 0, 3},
                          {3, 0, 1, 2, 1, 0},
                          {0, 1, 2, 1, 0, 3},
                          {3, 0, 1, 2, 1, 0},
                          {0, 1, 2, 1, 0, 3},
                          {3, 0, 1 ,2 ,1, 0}};
float [][] circleSize = {{30, 30, 30, 30, 30, 30},
                         {30, 60, 60, 60, 60, 30}, 
                         {30, 60, 80, 80, 60 ,30}, 
                         {30, 60, 80, 80, 60, 30}, 
                         {30, 60, 60, 60, 60, 30}, 
                         {30, 30, 30, 30, 30, 30}};
float [][] circlePositionX = {{35, 15, 15, 35, 15 ,65}, 
                              {15, 50, 70, 70, 50, 85}, 
                              {65, 30, 40, 40, 70, 85}, 
                              {85, 70, 60, 60, 50, 65}, 
                              {85, 70, 50, 70, 70, 85}, 
                              {65, 15, 15, 15, 85, 85}};
float [][] circlePositionY = {{15, 35, 15, 15, 65, 15}, 
                              {15, 70, 30, 70, 30, 15}, 
                              {15, 50, 40, 60, 30, 35},   
                              {15, 70, 40, 60, 30, 15}, 
                              {15, 70, 30, 70, 50, 15}, 
                              {15, 65, 35, 15, 15, 35}};
float [][] circle2PositionX = {{85, 85, 85, 65, 85, 15}, 
                               {85, 0, 0, 0, 0, 35}, 
                               {35, 0, 0, 0, 0, 15}, 
                               {35, 0, 0, 0, 0, 35}, 
                               {15, 0, 0 ,0, 0, 35}, 
                               {35, 85, 85, 65, 15, 15}};
float [][] circle2PositionY = {{85, 85, 35, 85, 35, 85}, 
                               {65, 0, 0, 0, 0, 85}, 
                               {85, 0, 0, 0, 0, 85}, 
                               {85, 0, 0, 0, 0, 85}, 
                               {65, 0, 0, 0, 0, 85}, 
                               {85, 85, 65, 85, 65, 85}};

noStroke();

// Steps through each square on 6x6 grid

for (int row=0; row<6; row++) {
  for (int col=0; col<6; col++) {
    
// Colors the square the proper background color
    
    if (colorScheme[col][row]==0) {
        fill(250, 30, 40);
    }
    if (colorScheme[col][row]==1) {
        fill(150, 20, 30);
    }
    if (colorScheme[col][row]==2) {
        fill (60, 20, 120);
     }
    if (colorScheme[col][row]==3) {
        fill(200, 160, 80);
    }
    rect ((row*100+10), (col*100+10), 100, 100);
    
// Draws and colors a circle in proper position in most recent square
    
    if (colorScheme[col][row]==0) {
        fill(50, 150, 180);
    }
    if (colorScheme[col][row]==1) {
        fill(50, 180, 130);
    }
    if (colorScheme[col][row]==2) {
        fill(200, 160, 80);
    }
    if (colorScheme[col][row]==3) {
        fill(50, 110, 130);
    }
    ellipse(((row*100+10)+circlePositionX[col][row]), ((col*100+10)+circlePositionY[col][row]), circleSize[col][row], circleSize[col][row]);
 
// Draws second circle in proper position if needed 
 
    if ((row==0) || (row==5) || (col==0) || (col==5)) {
      ellipse(((row*100+10)+circle2PositionX[col][row]), ((col*100+10)+circle2PositionY[col][row]), circleSize[col][row], circleSize[col][row]);;
    }
  }
  }
}




