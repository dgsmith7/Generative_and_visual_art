class Stick {
  PVector posit;
  color c;
  float stickLen = blockSize + 20;
  
  Stick() {
    this.posit = new PVector(width/2, height/2);
    this.c = color(#BB03FF);
  }
  
  Stick(float x, float y) {
    this.posit = new PVector(x, y);
    this.c = color(#BB03FF);
  }
  
  void display() {
    stroke(this.c);
    float deltaX = mouseX - posit.x;
    float deltaY = mouseY - posit.y;
    float theta = atan2(deltaY, deltaX);
    line(posit.x, 
         posit.y, 
         posit.x + cos(theta) * stickLen, 
         posit.y + sin(theta) * stickLen);
  }
}
