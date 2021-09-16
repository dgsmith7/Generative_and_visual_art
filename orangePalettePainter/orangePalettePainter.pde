int n = 44;
Shape[] shapes = new Shape[n];

void setup() {
  size(315, 315);
  background(100);
  for (int i = 0; i < n; i ++) {
    shapes[i] = new Shape(i);
    print(shapes[i].which + " ");
  }
  noLoop();
}

void draw() {
  for (int i = 0; i < n; i ++) {
    pushMatrix();
    translate(i%7 * 45, floor(i/7)*45);
    strokeWeight(1/15);
    scale(15);
    shapes[i].display();
    popMatrix();
  }
}
