// best with images < 1001x1001 pixels, should be jpg 
// mouse click changes image
// keystroke changes effect

String [] fileName = {
  "baconSlice.png"
};
int imageQuantity = 1;
int whichFile = 0; //int(random(0, imageQuantity));
PImage p;
color [][] pixArray;
boolean effectOn = false;
int blockSize = 10;

// for Chuck Close project
int zeroCount = 0;
int oneCount = 0;
int twoCount = 0;
int threeCount = 0;
int fourCount=0;
int lineCount = 0;
//

void setup() {
  size(1624, 795);
//  frame.setResizable(true);
  p = loadImage(fileName[whichFile]);
//  size(p.width, p.height);
  image(p, 0, 0);
  p.loadPixels();
  pixArray  =  new color [p.width][p.height];
  // load 2d array
  int counter = 0;
  for (int i = 0; i<p.height; i++) {
    for (int j = 0; j<p.width; j++) {
      pixArray [j][i] = p.pixels[counter];
      counter++;
    }
  }
  noLoop();
}

void draw() {
//  frame.setSize(p.width,p.height);
  p.updatePixels();
pixelate();
  image(p, 0, 0);
  
  textSize(120);
  fill(130, 20, 20);
  text("1000010", 100, 120);
  text("1000010", 100, 240);
  text("1000011", 100, 360);
  
    save("Pixels.png");
}

void keyPressed () {

  if (key == 's') {save("test.png");}
  //grayPixelate ();
  //  switchImage ();
}

void mouseClicked () {
  int currentFile = whichFile;
  while (currentFile == whichFile) {whichFile = int(random(0, imageQuantity));}
  p = loadImage(fileName[whichFile]);
  p.loadPixels();
  image(p, 0, 0);
  pixArray  =  new color [p.width][p.height];
  // load 2d array
  int counter = 0;
  for (int i = 0; i<p.height; i++) {
    for (int j = 0; j<p.width; j++) {
      pixArray [j][i] = p.pixels[counter];
      counter++;
    }
  }
  effectOn = false;
}

void switchImage () {
  if (effectOn == true) {
    p = loadImage(fileName[whichFile]);
    p.loadPixels ();
    p.updatePixels();
    image(p, 0, 0);
      // load 2d array
  int counter = 0;
  for (int i = 0; i<p.height; i++) {
    for (int j = 0; j<p.width; j++) {
      pixArray [j][i] = p.pixels[counter];
      counter++;
    }
  }

  } 
  if (effectOn == false) {
    int whichEffect = int(random(0, 3));
    if (whichEffect == 0) {
      pixelate ();
    }
    if (whichEffect == 1) {
      grayPixelate ();
    }
    if (whichEffect == 2) {
      colorShift ();
    }
  }
  effectOn = !(effectOn);
}

void pixelate() {  // average pixel blocks equal to blocksize set at top
  float totR, totG, totB, avgR, avgG, avgB;
  for (int i = 0; i< (p.height- (p.height%blockSize)); i= i+blockSize) {
    for (int j = 0; j< (p.width- (p.width%blockSize)); j=j+blockSize) {
      totR = 0;
      totG = 0;
      totB = 0;
      avgR = 0;
      avgG = 0;
      avgB = 0;
      // find out average color componenets of block
      for (int k = 0; k<blockSize; k++) {
        for (int l = 0; l < blockSize; l++) {
          totR=totR+red(pixArray[j+l][i+k]);
          totG=totG+green(pixArray[j+l][i+k]);
          totB=totB+blue(pixArray[j+l][i+k]);
        }
      }
      avgR = totR / (blockSize*blockSize);
      avgG = totG / (blockSize*blockSize);
      avgB = totB / (blockSize*blockSize);
      
      
      if ((avgR == 125) && (avgG == 125) && (avgB == 125)) {
        avgR = 250;
        avgG = 255;
        avgB = 10;
      } 
      
      
      
      // reassign all pixels in block to average
      for (int k = 0; k<blockSize; k++) {
        for (int l = 0; l < blockSize; l++) {
          (pixArray[j+l][i+k]) = color(avgR, avgG, avgB);
        }
      }
    }
  }
  //redraw
  int counter = 0;
  for (int i = 0; i< p.height; i++) {
    for (int j = 0; j< p.width; j++) {
      p.pixels[counter] = pixArray [j][i];
      counter++;
    }
  }

  counter = 0;
  for (int i = 0; i< p.height; i++) {
    for (int j = 0; j< p.width; j++) {
      p.pixels[counter] = pixArray [j][i];
      counter++;
    }
  }

}

void grayPixelate () {
  float totR, totG, totB, avgR, avgG, avgB;
  for (int i = 0; i< (p.height- (p.height%blockSize)); i= i+blockSize) {
    for (int j = 0; j< (p.width- (p.width%blockSize)); j=j+blockSize) {
      totR = 0;
      totG = 0;
      totB = 0;
      avgR = 0;
      avgG = 0;
      avgB = 0;
      // find out average color componenets of block
      for (int k = 0; k<blockSize; k++) {
        for (int l = 0; l < blockSize; l++) {
          totR=totR+red(pixArray[j+l][i+k]);
          totG=totG+green(pixArray[j+l][i+k]);
          totB=totB+blue(pixArray[j+l][i+k]);
        }
      }
      avgR = totR / (blockSize*blockSize);
      avgG = totG / (blockSize*blockSize);
      avgB = totB / (blockSize*blockSize);
      // reassign all pixels in block to average
      for (int k = 0; k<blockSize; k++) {
        for (int l = 0; l < blockSize; l++) {
          (pixArray[j+l][i+k]) = color(decideGray((avgR+avgG+avgB)/3));
//          (pixArray[j+l][i+k]) = color((avgR+avgG+avgB)/3);
        }
      }
    }
  }
  //redraw
  int counter = 0;
  for (int i = 0; i< p.height; i++) {
    for (int j = 0; j< p.width; j++) {
      p.pixels[counter] = pixArray [j][i];
      counter++;
    }
  }

  counter = 0;
  for (int i = 0; i< p.height; i++) {
    for (int j = 0; j< p.width; j++) {
      p.pixels[counter] = pixArray [j][i];
      counter++;
    }
  }

}

float decideGray(float x) {  // used for Chuck Close project
if ((x >= 0) && (x < 36/*51*/)) {zeroCount += 1; return 0;}//0.0;}
if (x >= 36/*51*/ && x < 72/*102*/) {oneCount += 1; return 54.0;}
if (x >= 72/*102*/ && x < 108/*153*/) {twoCount += 1; return 90.0;}
if (x >= 108/*153*/ && x < 144/*204*/) {threeCount += 1; return 126.0;}
if (x >= 144/*204*/ && x < 180/*256*/) {fourCount += 1; return 162.0;}
if (x >= 180 && x < 216) {return 196;}
if (x >= 216 && x < 256) {return 244;}
else {println("nogo - "+x); return 0;}

}

void colorShift () {
  for (int i = 0; i< p.height; i++) {
    for (int j = 0; j< p.width; j++) {
      pixArray[j][i] = color(255-red(pixArray[j][i]), 255-green(pixArray[j][i]), 255-blue(pixArray[j][i]));
    }
  }
  //redraw
  int counter = 0;
  for (int i = 0; i< p.height; i++) {
    for (int j = 0; j< p.width; j++) {
      p.pixels[counter] = pixArray [j][i];
      counter++;
    }
  }
  
    counter = 0;
  for (int i = 0; i< p.height; i++) {
    for (int j = 0; j< p.width; j++) {
      p.pixels[counter] = pixArray [j][i];
      counter++;
/*  for (int i = 0; i< (p.height- (p.height%blockSize)); i++) {
    for (int j = 0; j< (p.width- (p.width%blockSize)); j++) {
      p.pixels[counter] = pixArray [j][i];
      counter++;
*/
}
  }

}
