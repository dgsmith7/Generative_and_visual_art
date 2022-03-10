class Color_Field {
  
  float x;
  float y;
  float size; 
  color c;
  
  Color_Field(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.c = color(125);
  }
  
  void display() {
    noStroke();
    fill(c);
    rect(x, y, size, size);
  }
  
}