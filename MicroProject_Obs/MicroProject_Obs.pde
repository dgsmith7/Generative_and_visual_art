// best with images < 1001x1001 pixels, should be jpg 
// mouse click changes image
// keystroke changes effect

String [] fileName = {
  "The Butterfly.png"
};
int imageQuantity = 1;
int whichFile = int(random(0, imageQuantity));
PImage p;
color [][] pixArray;
boolean effectOn = false;
int blockSize =75;
int whichEffect=0;

void setup() {
  frame.setResizable(true);
  p = loadImage(fileName[whichFile]);
  size(p.width, p.height);
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
//    println(counter);
  }
//  noLoop();
}

void draw() {
  frame.setSize(p.width,p.height+22);
  p.updatePixels();
  image(p, 0, 0);
//  pixelate();
//p.updatePixels();
}

void keyPressed () {
  if (key == 'p') {whichEffect = 0;}
  if (key == 'g') {whichEffect = 1;}
  if (key == 'c') {whichEffect = 2;}
  if (key == 's') {save("tbp2.png");}
  switchImage ();
}

void mouseClicked () {
exit();
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
println("in");
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
//    println(counter);
  }

  counter = 0;
  for (int i = 0; i< p.height; i++) {
    for (int j = 0; j< p.width; j++) {
      p.pixels[counter] = pixArray [j][i];
      counter++;
    }
  }
  
  println("completed pixelation");
p.updatePixels();
image(p,0,0);
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
          (pixArray[j+l][i+k]) = color((avgR+avgG+avgB)/3);
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

