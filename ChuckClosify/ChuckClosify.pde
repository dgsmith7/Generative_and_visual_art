int diamondSize = 20;
float blobVariationRange = diamondSize / 15; 
float xPosit;
float yPosit;
color miniPalette[] = new color[4];
String fileName = "kate-moss.jpg";
PImage p;
color [][] pixArray;
int alpha = 150;

void setup () {
size (600, 720, P2D);
  loadImage ();
  noLoop ();
}

void draw () {
   for (int i = 0; i < (p.width- (p.width%diamondSize)); i += diamondSize) {
   for (int j = 0; j < (p.height- (p.height%diamondSize)); j += diamondSize) {
    xPosit = i;
    yPosit = j;
    getColors (xPosit, yPosit);
  paintDiamond (xPosit, yPosit);
  paintBlobs ();
  }
  }
  
   for (int i = (diamondSize/2); i < (p.width-(p.width%diamondSize)-(diamondSize/2)); i += diamondSize) {
   for (int j = (diamondSize/2); j < (p.height- (p.height%diamondSize)-(diamondSize/2)); j += diamondSize) {
    xPosit = i;
    yPosit = j;
    getColors (xPosit, yPosit);
  paintDiamond (xPosit, yPosit);
  paintBlobs ();
  }
  }
  
}

void paintDiamond (float x, float y) {
  stroke (miniPalette[0]);
  fill(miniPalette[0]);
  beginShape ();
  vertex (x + (diamondSize/2), y);
  vertex (x + diamondSize, y + (diamondSize/2));
  vertex (x + (diamondSize/2), y + diamondSize);
  vertex (x, y + (diamondSize/2));
  endShape (CLOSE);
}

void paintBlobs() {
  float blobSize;
  float randPointAlongArc1;
  float randPointAlongArc2;
  float originX;
  float originY;
  float endX;
  float endY;
  float topControl1X;
  float topControl1Y;
  float topControl2X;
  float topControl2Y; 
  float bottomControl1X;
  float bottomControl1Y;
  float bottomControl2X;
  float bottomControl2Y;
  int j = 0;

  for (float i = 3.5; i >= 0.5; i = i - 1.5) {
    // calculate blob dimensions
    blobSize = (diamondSize / 5) * (i);
    randPointAlongArc1 = random(blobVariationRange*-1, blobVariationRange);
    randPointAlongArc2 = random(blobVariationRange*-1, blobVariationRange);
    originX = xPosit + ((diamondSize - blobSize)/2);
    originY = yPosit + (diamondSize/2);
    endX = xPosit + ((diamondSize - blobSize)/2) + blobSize;
    endY = yPosit + (diamondSize/2);
    // calculate control points for top half of blob
    topControl1X = xPosit + ((diamondSize - blobSize)/2 + randPointAlongArc1);
    topControl1Y = yPosit + ((diamondSize - blobSize)/2) - randPointAlongArc2;
    topControl2X = xPosit + ((diamondSize - blobSize)/2) + blobSize - randPointAlongArc2;
    topControl2Y = yPosit + ((diamondSize - blobSize)/2) - randPointAlongArc1;
    //  calculate control points for bottom half of blob
    bottomControl1X =  xPosit + ((diamondSize - blobSize)/2 - randPointAlongArc1);
    bottomControl1Y =  yPosit + diamondSize - ((diamondSize - blobSize)/2);
    bottomControl2X =  xPosit + ((diamondSize - blobSize)/2) + blobSize + randPointAlongArc2;
    bottomControl2Y =  yPosit + diamondSize - ((diamondSize - blobSize)/2);
    // draw the blobs
    j += 1;
    stroke (miniPalette[j]);  
    fill (miniPalette[j]);  
    beginShape ();
    vertex (originX, originY);
    bezierVertex (topControl1X, topControl1Y, topControl2X, topControl2Y, endX, endY);
    endShape ();
    beginShape ();
    vertex (originX, originY);
    bezierVertex (bottomControl1X, bottomControl1Y, bottomControl2X, bottomControl2Y, endX, endY);
    endShape ();
  }
}

void getColors (float x, float y) { //looking at whle image and it needs to nly look at the one block size
  float totalRed = 0;
  float totalGreen = 0;
  float totalBlue = 0;
  float avgRed = 0;
  float avgGreen = 0;
  float avgBlue = 0;

      for (float k = 0; k<diamondSize; k++) {
        for (float l = 0; l < diamondSize; l++) {
          totalRed = totalRed + red(pixArray[int(k+x)][int(y+l)]);
          totalGreen = totalGreen + green(pixArray[int(k+x)][int(y+l)]);
          totalBlue = totalBlue + blue(pixArray[int(k+x)][int(y+l)]);
        }
      }
      avgRed = totalRed / (diamondSize*diamondSize);
      avgGreen = totalGreen / (diamondSize*diamondSize);
      avgBlue = totalBlue / (diamondSize*diamondSize);
  
miniPalette[1] = findLargest (avgRed, avgGreen, avgBlue);  // for large blob
miniPalette[2] = findMiddle (avgRed, avgGreen, avgBlue);  //  for med blob
miniPalette[3] = findSmallest (avgRed, avgGreen, avgBlue);  //  for small blob
miniPalette [0] = color (avgRed, avgGreen, avgBlue); // for diamond
}

color findLargest (float a, float b, float c) {
if ((a >= b ) && (a >= c)) {return color (a, b-25, c-25);}
else if ((b > a) && (b >= c)) {return color (a-25, b, c-25);}
else return color (a-25, b-25, c);
}

color findMiddle (float a, float b, float c) {
if ((a >= b ) && (a <= c)) {return color (a, b-25, c-25);}
else if ((b > a) && (b <= c)) {return color (a-25, b, c-25);}
else return color (a-25, b-25, c);
}

color findSmallest (float a, float b, float c) {
if ((a <= b ) && (a <= c)) {return color (a, b-25, c-25);}
else if ((b < a) && (b <= c)) {return color (a-25, b, c-25);}
else return color (a-25, b-25, c);
}

void loadImage () {
  //frame.setResizable(true);
  p = loadImage(fileName);
//  size(p.width, p.height, P2D);
  background(100);
  image(p, 600, 0);
  p.loadPixels();
  pixArray  =  new color[p.width][p.height];
  // load 2d array
  int counter = 0;
  for (int i = 0; i<p.height; i++) {
    for (int j = 0; j<p.width; j++) {
      pixArray [j][i] = p.pixels[counter];
      counter++;
    }
  }
}
