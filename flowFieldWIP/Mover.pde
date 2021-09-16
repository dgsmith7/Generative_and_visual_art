class Mover {
  PVector posit, speed;
  color clr;
  float syze;
  
  Mover(float x, float y, color c, float s) {
    this.posit = new PVector (x, y);
    this.speed = new PVector(0, 0);
    this.clr = c;
    this.syze = s;
  }
  
  void move(PVector s) {
    this.speed = s.copy();
    this.posit.add(speed);
    this.posit.add(speed);
    this.posit.add(speed);
    if (posit.x <= 0) {
      posit.x = width - blockSize;
    }
    if (posit.x >= width) {
      posit.x = 0 + blockSize;
    }
    if (posit.y <= 0) {
      posit.y = height - blockSize;
    }
    if (posit.y <= height) {
      posit.y = 0 + blockSize;
    }
  }
  
  void display() {
    fill(clr);
    ellipse(posit.x, posit.y, syze, syze);
  }
}
