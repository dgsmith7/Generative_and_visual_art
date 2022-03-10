//  I want it to rotate in one place around center of 
// matrix in all axes or possibly just x and y controlled by arrows
// I want smoother surfaces

boolean rot = true;

node [][][] matrix = new node[4][4][4];
connector [][][] barsX = new connector[4][4][4];
connector [][][] barsY = new connector[4][4][4];
connector [][][] barsZ = new connector[4][4][4];

int nodeSize = 50;
int nodeInterval = 125;
connector c1;
int alpha = 250;
color nodeColor = color (70, 170, 170, alpha);
color connectorColor = color (70, 170, 170, alpha);
color outlineColor = color (70, 170, 170, alpha);
int matrixXLength = (nodeSize*4)+(nodeInterval*3);
int matrixYLength = (nodeSize*4)+(nodeInterval*3);
int matrixZLength = (nodeSize*4)+(nodeInterval*3);
int depth = matrixZLength+100;
int r=1;
int t=0;

int [][][] nodeOn = 
{
  {
    {
      1, 1, 1, 1
    }
    , 
    {
      1, 1, 1, 1
    }
    , 
    {
      1, 1, 1, 1
    }
    , 
    {
      1, 1, 1, 1
    }
  }
  , 
  {

    {
      1, 1, 1, 1
    }
    , 

    {
      1, 1, 0, 1
    }
    , 

    {
      1, 1, 1, 1
    }
    , 

    {
      1, 1, 0, 1
    }
  }
  , 
  {

    {
      1, 0, 1, 1
    }

    , 

    {
      1, 1, 1, 1
    }

    , 

    {
      1, 0, 1, 1
    }

    , 

    {
      1, 1, 1, 1
    }
  }
  , 
  {
    {
      1, 1, 1, 1
    }
    , 
    {
      1, 1, 1, 1
    }
    , 
    {
      1, 1, 1, 1
    }
    , 
    {
      1, 1, 1, 1
    }
  }
};

// Define which connectors are illuminated
// left wall front to back top to bottom moving right
// connectors aligned on z axis
int [][][] toggleBarsX = {
  {//left wall
    // value of last column irrelevant
    {//upper row top corner, middle top, back top 
      1, 1, 1, 9
    }//second row down
    , {
      0, 1, 1, 9
    }
    , {
      0, 0, 1, 9
    }
    , {
      0, 1, 1, 9
    }
  }
  , 
  // value of last column irrelevant
  {// next wall from left
    {
      0, 1, 0, 9
    }
    , {
      0, 0, 0, 9
    }
    , {
      0, 0, 0, 9
    }
    , {
      1, 0, 0, 9
    }
  }
  , 
  // value of last column irrelevant
  {
    {
      0, 0, 0, 9
    }
    , {
      0, 1, 0, 9
    }
    , {
      0, 0, 0, 9
    }
    , {
      1, 1, 1, 9
    }
  }
  , 
  // value of last column irrelevant
  {
    {
      1, 1, 0, 9
    }
    , {
      0, 0, 0, 9
    }
    , {
      1, 0, 0, 9
    }
    , {
      1, 1, 1, 9
    }
  }
};


// left wall upperleft to upperright top to bottom moving back
// connectors aligned on y axis
int [][][] toggleBarsY= {
  {//left wall
    {// first column: top left, middle, bottom, keeper
      1, 1, 1, 9
    }
    , {// second column back
      0, 1, 1, 9
    }
    , {//third back
      0, 0, 0, 9
    }
    , {
      0, 0, 0, 9
    }
  }
  , 
  {// next wall
    {
      1, 1, 0, 9
    }
    , {
      1, 1, 1, 9
    }
    , {
      0, 0, 0, 9
    }
    , {
      0, 0, 0, 9
    }
  }
  , 
  {
    {
      0, 1, 0, 9
    }
    , {
      0, 0, 0, 9
    }
    , {
      1, 0, 0, 9
    }
    , {
      0, 1, 0, 9
    }
  }
  , 
  {
    {
      0, 1, 0, 9
    }
    , {
      0, 1, 0, 9
    }
    , {
      1, 1, 0, 9
    }
    , {
      1, 1, 1, 9
    }
  }
};


// top wall left to right front to back moving down
// aligned on x axis
int [][][] toggleBarsZ= {
  {// top
    {// upper left corner, one to right, two to right
      0, 1, 1, 9
    }
    , {// step down one bar
      0, 0, 1, 9
    }
    , {
      0, 1, 0, 9
    }
    , {
      1, 0, 1, 9
    }
  }
  , 
  {// next wall back
    {
      0, 0, 0, 9
    }
    , {
      0, 0, 1, 9
    }
    , {
      0, 0, 0, 9
    }
    , {
      0, 0, 0, 9
    }
  }
  , 
  {
    {
      0, 1, 0, 9
    }
    , {
      0, 0, 0, 9
    }
    , {
      1, 1, 1, 9
    }
    , {
      0, 0, 0, 9
    }
  }
  , 
  {
    {
      1, 1, 1, 9
    }
    , {
      1, 1, 0, 9
    }
    , {
      1, 1, 0, 9
    }
    , {
      1, 1, 0, 9
    }
  }
};

void setup () {
  size (1280, 800, P3D);
  smooth();
  for (int i=0; i<4; i++) {
    for (int j=0; j<4; j++) {
      for (int k=0; k<4; k++) {
        matrix[i][j][k] = new node (((width/2)-(matrixXLength/2)+(i*(nodeSize+nodeInterval))), ((height/2)-(matrixYLength/2)+(j*(nodeSize+nodeInterval))), (-1*((depth/2)-(matrixZLength/2)+(k*(nodeSize+nodeInterval)))), nodeColor, nodeSize);
      }
    }
  }

  // loading connectors
  for (int i=0; i<4; i++) {
    for (int j=0; j<4; j++) {
      for (int k=0; k<4; k++) {
        if (toggleBarsX[i][j][k] == 1) {
          if (k<3) {
            barsX[i][j][k] = new connector (matrix[i][j][k].x, matrix[i][j][k].y, matrix[i][j][k].z, matrix[i][j][k+1].x, matrix[i][j][k+1].y, matrix[i][j][k+1].z);
          } else {
            barsX[i][j][k] = new connector (matrix[i][j][k].x, matrix[i][j][k].y, matrix[i][j][k].z, matrix[i][j][k].x, matrix[i][j][k].y, matrix[i][j][k].z);
          }
        }
        if (toggleBarsY[i][j][k] == 1) {
          if (k<3) {
            barsY[i][j][k] = new connector (matrix[i][k][j].x, matrix[i][k][j].y, matrix[i][k][j].z, matrix[i][k+1][j].x, matrix[i][k+1][j].y, matrix[i][k+1][j].z);
          } else {
            barsY[i][j][k] = new connector (matrix[i][k][j].x, matrix[i][k][j].y, matrix[i][k][j].z, matrix[i][k][j].x, matrix[i][k][j].y, matrix[i][k][j].z);
          }
        }
        if (toggleBarsZ[i][j][k] == 1) {
          if (k<3) {
            barsZ[i][j][k] = new connector (matrix[k][j][i].x, matrix[k][j][i].y, matrix[k][j][i].z, matrix[k+1][j][i].x, matrix[k+1][j][i].y, matrix[k+1][j][i].z);
          } else {
            barsZ[i][j][k] = new connector (matrix[k][j][i].x, matrix[k][j][i].y, matrix[k][j][i].z, matrix[k][j][i].x, matrix[k][j][i].y, matrix[k][j][i].z);
          }
        }
      }
    }
  }
   // noLoop ();
}

void draw () {
  background(110, 110, 110, r);
  //  ambient(250, 100, 100);
  ambient(175, 100, 50);
  //  ambientLight (40, 20, 40);
  //  ambientLight (20, 150, 80);
  lightSpecular(255, 215, 215);
  directionalLight(185, 195, 255, -1, 1.25, -1);
  shininess(255);//  pushMatrix ();
  translate (width/2, height/2, depth/2-550);
  rotateX(.002*r*PI);
  translate (-width/2, -height/2, -(depth/2-550));
  translate (width/2, height/2, depth/2-550);
  rotateY(.002*r*PI);
  translate (-width/2, -height/2, -(depth/2-550));
  translate (width/2, height/2, depth/2-550);
  rotateZ(.002*r*PI);
  translate (-width/2, -height/2, -(depth/2-550));
  displayStructure ();
  if (rot) r++;
}

void keyPressed () {
//exit();
//redraw();
rot = !rot;
}

void displayStructure () {
  for (int i=0; i<4; i++) {
    for (int j=0; j<4; j++) {
      for (int k=0; k<4; k++) {
        if (nodeOn[i][j][k] == 1) { 
          matrix[i][j][k].display ();
        }
        if (k < 3) {

          if (toggleBarsX[i][j][k] == 1) {
            barsX[i][j][k].display ();
          }
          if (toggleBarsY[i][j][k] == 1) {
            barsY[i][j][k].display ();
          }
          if (toggleBarsZ[i][j][k] == 1) {
            barsZ[i][j][k].display ();
          }
        }
      }
    }
  }
//  addSpheres();
}

void addSpheres () {
  fill(255, 255, 255);
  translate (width/2, height/2, depth/2-550);
  sphere (75);

  fill(120, 240, 230);
  translate (100, 100, 100);
  sphere (50);

  fill(120, 240, 230);
  translate (-275, -185, -125);
  sphere (50);

  fill(120, 240, 230);
  translate (300, -100, -150);
  sphere (50);

  fill(150);
  translate (-220, 325, 0);
  sphere (50);
}
