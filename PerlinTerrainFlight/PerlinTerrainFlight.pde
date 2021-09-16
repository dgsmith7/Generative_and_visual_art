float[][] gridY = new float[10][10];
float[] nextHorizon = new float[10];
float nFactorZ = 0.0;
float nFactorX = 0.0;
float nScaleZ = 0.005;
float nScaleX = 0.02;

void setup() {
  size(500, 500, P3D);
  background(125);
  stroke(25);
  strokeWeight(3);
  fill(25);
  initGridY();
}

void draw() {
  background(125);
  showGrid();
  //  computeNextHorizon();
  //  moveForwardOneClick();
  nFactorZ += nScaleZ;
}

void initGridY() {
  for (int x = 0; x < 10; x ++) {
    for (int z = 0; z < 10; z ++) {
      gridY[x][z] = 450;
    }
  }
}

void showGrid() {  // must fix this to show 10th lines x and z and to span entire screen
  /*
for (int x = 0; x < 10; x ++) {
   stroke(x*20);
   for (int z = 0; z < 10; z++) {      
   if (z == 9) {stroke(255,0,0);} else {stroke(x*20);}
   point((x * 50) + 25, gridY[x][z], -(z * 50));
   } 
   }
   */

  for (int x = 0; x < 9; x ++) {
    stroke(x*20);
    for (int z = 0; z < 9; z++) {      
      if (z == 9) {
        stroke(255, 0, 0);
        //        line((x * 50) + 25, gridY[x][z], -(z * 50), ((x+1) * 50) + 25, gridY[x+1][z], -(z * 50));
        line((x * 50) + 25, gridY[x][z], -((z) * 50), ((x) * 50) + 25, gridY[x][z+1], -((z+1) * 50));
      } else {
        stroke(x*20);
        line((x * 50) + 25, gridY[x][z], -(z * 50), ((x+1) * 50) + 25, gridY[x+1][z], -(z * 50));
        line((x * 50) + 25, gridY[x][z], -((z) * 50), ((x) * 50) + 25, gridY[x][z+1], -((z+1) * 50));
      }
    }
  }
}

void computeNextHorizon() {  // figure out scale to keep this thing based at 450 and to create valleys
// and later to make tunnels and drop tubes
  //float lastNoise = 450;
  for (int x = 0; x < 10; x ++) {
    //    if (x == 0) {lastNoise = noise(nFactor) + 450;} else {lastNoise = nextHorizon[x-1];}
    nextHorizon[x] = ((noise(nFactorX) * 450) + 150);
    nFactorX += nScaleX;
  }
  println(nextHorizon);
}

void keyPressed() {
  computeNextHorizon();
  moveForwardOneClick();
}

void moveForwardOneClick() {
  for (int x = 0; x < 10; x ++) {
    for (int z = 0; z < 9; z ++) {
      gridY[x][z] = gridY[x][z+1];
      if (z == 8) {
        gridY[x][z+1] = nextHorizon[x];
      }
    }
  }
}

