PImage img;
//String fileName = "close-up soft edge.JPG";  // must be in "/data" 
//String fileName = "Screen Shot 2018-08-02 at 5.10.28 PM.png";  // must be in "/data" 
//String fileName = "Small Screen Shot 2018-08-02 at 5.10.28 PM.png";  // must be in "/data" 
String fileName = "Screen Shot 2018-07-08 at 1.03.35 PM.png";  // must be in "/data" 
//String fileName = "owl2.png";  // must be in "/data" 
ArrayList<Widget> allWidgets = new ArrayList<Widget>();
float cx, cy;
Widget w1;

void setup() {
  size(/*1202, 1800*/ /*844, 834 500, 494*/ 522, 494 /*344, 281*/);  // set to dimensions of image file
  background(125);
  noLoop();
  img = loadImage(fileName);
  background(img);
  cx = 7;
  cy = 7;
  initWidgets();
  w1 = new Widget(475, 775);
  noLoop();
}

void initWidgets() {
  for (int i = 7; i < width; i = i + 26) {
    for (int j = 0; j < height; j = j + 14) {
      Widget w = new Widget(i, j);
      allWidgets.add(w);
      Widget w1 = new Widget(i + 13, j + 7);
      allWidgets.add(w1);
    }
  }
}

void draw() {
  noStroke();
  for (Widget w : allWidgets) {
    w.display();
  }  
  println(allWidgets.size());
/*
  
  drawWidget(cx, cy);
//
  cx = cx + 13;
  cy = cy + 7;
  drawWidget(cx, cy);
  cx = cx - 13;
  cy = cy - 7;
//
  cy = cy - 14;
  drawWidget(cx, cy);
  cy = cy + 14;
//
  cx = cx - 13;
  cy = cy + 7;
  drawWidget(cx, cy);
  cx = cx + 13;
  cy = cy - 7;
//
  cy = cy + 14;
  drawWidget(cx, cy);
  cy = cy - 14;

}

void drawWidget(float x, float y) {
  stroke(255, 0, 0);
  drawTop(x, y - 4);
  stroke(0, 255, 0);
  drawLeft(x - 4, y + 2);
  stroke(0, 0, 255);
  drawRight(x + 4, y + 2);
}

void drawTop(float x, float y) { // addresses every pixel - use to avg rgb
  point(x - 5, y - 2);
  point(x - 4, y - 2);
  point(x - 3, y - 2);
//
  point(x + 3, y - 2);
  point(x + 4, y - 2);
  point(x + 5, y - 2);
//
  point(x - 7, y - 1);
  point(x - 6, y - 1);
  point(x - 5, y - 1);
  point(x - 4, y - 1);
  point(x - 3, y - 1);
  point(x - 2, y - 1);
  point(x - 1, y - 1);
//
  point(x + 1, y - 1);
  point(x + 2, y - 1);
  point(x + 3, y - 1);
  point(x + 4, y - 1);
  point(x + 5, y - 1);
  point(x + 6, y - 1);
  point(x + 7, y - 1);
//
  point(x - 8, y);
  point(x - 7, y);
  point(x - 6, y);
  point(x - 5, y);
  point(x - 4, y);
  point(x - 3, y);
  point(x - 2, y);
  point(x - 1, y);
  point(x, y);
  point(x + 1, y);
  point(x + 2, y);
  point(x + 3, y);
  point(x + 4, y);
  point(x + 5, y);
  point(x + 6, y);
  point(x + 7, y);
  point(x + 8, y);
//
  point(x - 6, y + 1);
  point(x - 5, y + 1);
  point(x - 4, y + 1);
  point(x - 3, y + 1);
  point(x - 2, y + 1);
  point(x - 1, y + 1);
  point(x, y + 1);
  point(x + 1, y + 1);
  point(x + 2, y + 1);
  point(x + 3, y + 1);
  point(x + 4, y + 1);
  point(x + 5, y + 1);
  point(x + 6, y + 1);
//
  point(x - 4, y + 2);
  point(x - 3, y + 2);
  point(x - 2, y + 2);
  point(x - 1, y + 2);
  point(x, y + 2);
  point(x + 1, y + 2);
  point(x + 2, y + 2);
  point(x + 3, y + 2);
  point(x + 4, y + 2);
//
  point(x - 2, y + 3);
  point(x - 1, y + 3);
  point(x, y + 3);
  point(x + 1, y + 3);
  point(x + 2, y + 3);
//
  point(x, y + 4);

}

void drawLeft(float x, float y) {
//
  point(x - 4, y - 6);
  point(x - 3, y - 6);
//
  point(x - 4, y - 5);
  point(x - 3, y - 5);
  point(x - 2, y - 5);
  point(x - 1, y - 5);
//
  point(x - 4, y - 4);
  point(x - 3, y - 4);
  point(x - 2, y - 4);
  point(x - 1, y - 4);
  point(x, y - 4);
  point(x + 1, y - 4);
//
  point(x - 4, y - 3);
  point(x - 3, y - 3);
  point(x - 2, y - 3);
  point(x - 1, y - 3);
  point(x, y - 3);
  point(x + 1, y - 3);
  point(x + 2, y - 3);
  point(x + 3, y - 3);
//
  point(x - 4, y - 2);
  point(x - 3, y - 2);
  point(x - 2, y - 2);
  point(x - 1, y - 2);
  point(x, y - 2);
  point(x + 1, y - 2);
  point(x + 2, y - 2);
  point(x + 3, y - 2);
  point(x + 4, y - 2);
//
  point(x - 3, y - 1);
  point(x - 2, y - 1);
  point(x - 1, y - 1);
  point(x, y - 1);
  point(x + 1, y - 1);
  point(x + 2, y - 1);
  point(x + 3, y - 1);
  point(x + 4, y - 1);
//
  point(x - 1, y);
  point(x, y);
  point(x + 1, y);
  point(x + 2, y);
  point(x + 3, y);
  point(x + 4, y);
//
  point(x, y + 1);
  point(x + 1, y + 1);
  point(x + 2, y + 1);
  point(x + 3, y + 1);
  point(x + 4, y + 1);
//
  point(x, y + 2);
  point(x + 1, y + 2);
  point(x + 2, y + 2);
  point(x + 3, y + 2);
  point(x + 4, y + 2);
//
  point(x, y + 3);
  point(x + 1, y + 3);
  point(x + 2, y + 3);
  point(x + 3, y + 3);
  point(x + 4, y + 3);
//
  point(x, y + 4);
  point(x + 1, y + 4);
  point(x + 2, y + 4);
  point(x + 3, y + 4);
  point(x + 4, y + 4);
//
  point(x, y + 5);
  point(x + 1, y + 5);
  point(x + 2, y + 5);
  point(x + 3, y + 5);
  point(x + 4, y + 5);
//
  point(x + 1, y + 6);
  point(x + 2, y + 6);
  point(x + 3, y + 6);
  point(x + 4, y + 6);
//
  point(x + 3, y + 7);
  point(x + 4, y + 7);
}

void drawRight(float x, float y) {
//
  point(x + 4, y - 6);
  point(x + 3, y - 6);
//
  point(x + 4, y - 5);
  point(x + 3, y - 5);
  point(x + 2, y - 5);
  point(x + 1, y - 5);
//
  point(x + 4, y - 4);
  point(x + 3, y - 4);
  point(x + 2, y - 4);
  point(x + 1, y - 4);
  point(x, y - 4);
  point(x - 1, y - 4);
//
  point(x + 4, y - 3);
  point(x + 3, y - 3);
  point(x + 2, y - 3);
  point(x + 1, y - 3);
  point(x, y - 3);
  point(x - 1, y - 3);
  point(x - 2, y - 3);
  point(x - 3, y - 3);
//
  point(x + 4, y - 2);
  point(x + 3, y - 2);
  point(x + 2, y - 2);
  point(x + 1, y - 2);
  point(x, y - 2);
  point(x - 1, y - 2);
  point(x - 2, y - 2);
  point(x - 3, y - 2);
  point(x - 4, y - 2);
//
  point(x + 3, y - 1);
  point(x + 2, y - 1);
  point(x + 1, y - 1);
  point(x, y - 1);
  point(x - 1, y - 1);
  point(x - 2, y - 1);
  point(x - 3, y - 1);
  point(x - 4, y - 1);
//
  point(x + 1, y);
  point(x, y);
  point(x - 1, y);
  point(x - 2, y);
  point(x - 3, y);
  point(x - 4, y);
//
  point(x, y + 1);
  point(x - 1, y + 1);
  point(x - 2, y + 1);
  point(x - 3, y + 1);
  point(x - 4, y + 1);
//
  point(x, y + 2);
  point(x - 1, y + 2);
  point(x - 2, y + 2);
  point(x - 3, y + 2);
  point(x - 4, y + 2);
//
  point(x, y + 3);
  point(x - 1, y + 3);
  point(x - 2, y + 3);
  point(x - 3, y + 3);
  point(x - 4, y + 3);
//
  point(x, y + 4);
  point(x - 1, y + 4);
  point(x - 2, y + 4);
  point(x - 3, y + 4);
  point(x - 4, y + 4);
//
  point(x, y + 5);
  point(x - 1, y + 5);
  point(x - 2, y + 5);
  point(x - 3, y + 5);
  point(x - 4, y + 5);
//
  point(x - 1, y + 6);
  point(x - 2, y + 6);
  point(x - 3, y + 6);
  point(x - 4, y + 6);
//
  point(x - 3, y + 7);
  point(x - 4, y + 7);
  
*/

}
