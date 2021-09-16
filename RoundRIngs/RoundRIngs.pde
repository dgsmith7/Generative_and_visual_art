int c = 0;

void setup() {
  size(500, 500); 
  background(125);
  noLoop();
  noFill();
}

void draw() {
//  background(125);
  for (int i = 4; i < 23; i ++) {
    c = round(PI * i);
    println("C - " + c);
    for (int j = 0; j < c; j ++) {
      print(" j - " + j);
      stroke(c*10,c * 3, c * 7);
      arc(width/2, height/2, width/23 * i, height/23 * i, (TWO_PI / j)*j, (TWO_PI / j) * (j+1));
    }
  }
}
