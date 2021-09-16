class Hex {
  PShape h;
  float s;
  PVector center;
  int index;
  
  Hex() {
    center = new PVector(width/2, height/2);
    s = 25;
    h = createShape();
    buildShape();
    index = 0;
  }

  Hex(float x, float y, int i) {
    center = new PVector(x, y);
    s = 20;
    h = createShape();
    buildShape();
    index = i;
  }
  
  void buildShape() {
    h.beginShape();
    h.noFill();
    h.stroke(#00FF4A);
    for (int i = 0; i < 360; i = i + 60) {
      h.vertex(center.x + cos(radians(i)) * s, center.y + sin(radians(i)) * s);
    }
    h.endShape(CLOSE);
  }
  
  void display() {
    shape(h);
    fill(#00FF4A);
//    text(index, center.x, center.y);
    noFill();
  }
  
  
}
