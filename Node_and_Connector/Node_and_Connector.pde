node [][][] matrix = new node[4][4][4];
//connector [][][] bars = new connector[4][4][3];
int nodeSize = 35;
int nodeInterval = 150;
connector c1;
int alpha = 150;
color nodeColor = color (70, 170, 170, alpha);
color connectorColor = color (70, 170, 170, alpha);
color outlineColor = color (50, 50, 150, alpha);
int matrixXLength = (nodeSize*4)+(nodeInterval*3);
int matrixYLength = (nodeSize*4)+(nodeInterval*3);
int matrixZLength = (nodeSize*4)+(nodeInterval*3);
int depth = matrixZLength+100;

void setup () {
  size (1500, 1500, P3D);
  smooth();
  for (int i=0; i<4; i++) {
    for (int j=0; j<4; j++) {
      for (int k=0; k<4; k++) {
        matrix[i][j][k] = new node (((width/2)-(matrixXLength/2)+(i*(nodeSize+nodeInterval))), ((height/2)-(matrixYLength/2)+(j*(nodeSize+nodeInterval))), (-1*((depth/2)-(matrixZLength/2)+(k*(nodeSize+nodeInterval)))), nodeColor, nodeSize);
      }
    }
  }
  noLoop ();
  c1 = new connector (matrix[2][2][2].x, matrix[2][2][2].y, matrix[2][2][2].z, matrix[3][2][2].x, matrix[3][2][2].y, matrix[3][2][2].z );
}

void draw () {
  background(25);
  stroke (255, 0, 0);

  rotateX(-1*PI/8);
  rotateY(-1*PI/8);
  rotateZ(PI/8);


  for (int i=0; i<4; i++) {
    for (int j=0; j<4; j++) {
      for (int k=0; k<4; k++) {
        matrix[i][j][k].display ();
//        connector[i][j][k].display();
      }
    }
  }
  c1.display();
}