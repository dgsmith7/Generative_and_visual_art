class Node{
  
  int index;
  float x;
  float y;
  float z;
  color c;
  
  Node() {
    this.index = -1;
    this.x = 250;
    this.y = 250;
    this.z = 250;
    this.c = color(255,0 , 0);
  }
  
  Node(int i, float x, float y, float z) {
    this.index = i;
    this.x = x;
    this.y = y;
    this.z = z;
    this.c = color(0, 0, 255);
  }
  
  void display() {
    textSize(15);
    textMode(SHAPE);
    fill(c, 125);
    noStroke();
    pushMatrix();
    translate(x, y, z);
    sphere(5);
    fill(0, 255);
    text(index, 5, 5, 5);
    popMatrix();
    
  }
  
}