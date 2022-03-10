class Particle {
  int x;
  int y;
  int index;
  int r;
  int g;
  int b;
  color c;
  
  Particle() {}
  
  Particle(int index, int x, int y, color c) {
    this.x = x * 2;
    this.y = y * 2;
    this.index = index;
    this.c = c;
    this.r = round(red(c));
    this.g = round(green(g));
    this.b = round(blue(c));
  }
  
  void display() {
     noStroke();
     fill(c);
     ellipse(x, y, 3, 3);
  }
}
