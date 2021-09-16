class Widget {
  
  PVector Posit;
  color c;
  
  Widget() {
    this.Posit = new PVector(0, 0);
    this.c = color(0);
  }
  
  void display() {
    PVector v1, v2, v3, v4, v5;
    v1 = new PVector(Posit.x + cos(radians(210)) * 50, Posit.y + sin(radians(210)) * 50);
    v2 = new PVector(v1.x + cos(radians(330)) * 25, v1.y + sin(radians(330)) * 25);
    v3 = new PVector(v2.x + cos(radians(30)) * 25, v2.y + sin (radians(30)) * 25);
    v4 = new PVector(v3.x + cos(radians(330)) * 25, v3.y + sin(radians(330)) * 25);
    v5 = new PVector(v4.x + cos(radians(30)) * 25, v4.y + sin(radians(30)) * 25);
//    noStroke();
//  fill(c);
noFill();
    beginShape();
    vertex(Posit.x, Posit.y);
    vertex(v1.x, v1.y);
    vertex(v2.x, v2.y);
    vertex(v3.x, v3.y);
    vertex(v4.x, v4.y);
    vertex(v5.x, v5.y);
    endShape(CLOSE);
    
  }
}