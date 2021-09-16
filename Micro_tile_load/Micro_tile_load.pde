//

String [] fileName = {
  "BG1.png", "BG3.png", "BG3.png", "BL1.png", "BL3.png", "BL3.png", "Black.png"
};
int [] colorAverages = {
  131, 167, 145, 125, 104, 132, 57
}; 
int imageQuantity = 7;
PImage tiles[] = new PImage[imageQuantity];
PImage p;
color [][] pixArray;
boolean effectOn = false;
int blockSize =75;

void setup() {
  frame.setResizable(true);
    loadTiles ();

  p = loadImage("tbp.png");
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
  //  noLoop ();

}

void draw () {
    frame.setSize(p.width, p.height+22);
  p.updatePixels();
  image(p, 0, 0);
}

void keyPressed () {
  if (key == 'r') {  
    replaceWithTiles ();
    image(p, 0, 0);
  }
  if (key == 's') {
    save("Final.png");
  }
  if (key == ' ') {
    exit();
  }
}

void loadTiles () {
  int counter=0;
  int x =0;
  int y = 0;
  for (int i = 0; i<imageQuantity; i++) {
    tiles[i] = loadImage(fileName[i]);
    tiles[i].loadPixels();
    //    image(tiles[i], x, y);
    x +=75;  
    if (x == 300) {
      x = 0; 
      y +=75;
    }
    //    updatePixels ();
  }
}

void replaceWithTiles () {
  println("pixelating...");
  for (int x = 0; x<p.width/blockSize; x++) {
    for (int y = 0; y < p.height/blockSize; y++) {
      float avgR, avgG, avgB, avrg;
      avgR = 0;
      avgG = 0;
      avgB = 0;
      avrg=0;
      avgR=red(pixArray[x*75][y*75]);
      avgG=green(pixArray[x*75][y*75]);
      avgB=blue(pixArray[x*75][y*75]);
      avrg=int((avgR+avgG+avgB)/3);
      // determine closest tile
      int maxDiff=255;
      int diff = 0;
      int closestIndex = 0;
      int blackAmount = 0;
      for (int m = 0; m<imageQuantity; m++) {
        diff = int(abs(colorAverages[m]-avrg));
        if (diff < maxDiff) {
          maxDiff= diff; 
          closestIndex = m;
        }
      }
      if (avrg < 25) {closestIndex = 6;}
      if ((avrg >= 130)&&(avrg <=135)) {closestIndex = int(random(1,4));}
      if ((avrg >= 75)&&(avrg == 95)) {closestIndex = 4;}
      if ((avrg >= 96)&&(avrg == 125)) {closestIndex = 3;}
      if ((avrg >= 126)&&(avrg == 150)) {closestIndex = 5;}
      // reassign all pixels in block to average
      int pixCounter =0;
      for (int k = 0; k<blockSize; k++) {
        for (int l = 0; l < blockSize; l++) {
          (pixArray[((x*blockSize)+l)][((y*blockSize)+k)]) = tiles[closestIndex].pixels[pixCounter];
          pixCounter ++;
        } // end for l
      } // end for k
    } // end y
  } // end x
  // reload
  int counter = 0;
  for (int i = 0; i< p.height; i++) {
    for (int j = 0; j< p.width; j++) {
      p.pixels[counter] = pixArray [j][i];
      counter++;
    }
  }
  p.updatePixels();
  image(p, 0, 0);
}

