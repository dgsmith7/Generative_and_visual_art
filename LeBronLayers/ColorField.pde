class ColorField {
 
  float x;
  float y;
  float size;
  color c;
  
  ColorField(float x, float y, float size, color c) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.c = c;
  }
  
  void display() {
    fill(c);
    rect(x, y, size, size);
  }
  
}