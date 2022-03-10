import processing.pdf.*;

int wide = 1050;
int high = 800;
int nShapes = (high/150)*(wide/150);
Shape allShapes[] = new Shape[nShapes];
int whichSave = 0;

void setup() {
  size(1050, 800);
//  size(1050, 800, PDF, "One.pdf");
  initShapes();
  noFill();
  noLoop();
}

void draw() {
  background(255);
  displayShapes();
//  exit();
}

void initShapes() {
  for (int i = 0; i < nShapes; i ++) {
    allShapes[i] = new Shape(new PVector(random(25) + (150 * (i % (wide/150))), 
                                         random(25) + (150 * floor(i/(wide/150))))); 
  }
}

void displayShapes() {
  for (int i = 0; i < nShapes; i ++) {
    stroke(random(100, 150));
    allShapes[i].display(); 
  }
}

void mouseClicked() {
  initShapes();
  redraw();
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}
