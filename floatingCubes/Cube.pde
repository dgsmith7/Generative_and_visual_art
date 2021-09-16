class Cube {  // class definition for Cube objects

  // properties of each Cube object
  color c;
  float x, y, z;
  float size;
  
  // default constructor
  Cube() {  
    this.c = color(0, 0, 255);
    this.x = 50.0;
    this.y = 50.0;
    this.z = 50.0; 
    this.size  = 50.0;
  }
  
  // overloaded constructor
  Cube(color c, float x, float y, float z, float size) {
    this.c = c;
    this.x = x;
    this.y = y;
    this.z = z;
    this.size = size;
  }

  // methods
  void display() {
    noStroke();
    fill(c);
    translate(x, y, -z);
    box(size);
    translate(-x, -y, z);
  }
  
  void changeColor() {
    this.c = color(random(255), random(255), random(255), 175);
  }
  
  void changeSize() {
     this.size = this.size * 1.1;
  }
}