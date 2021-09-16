class Blip {
  float x, y, diam;
  color c;
  
  Blip() {
    this.x = 75;
    this.y = 75;
    this.diam = 250;
    this.c = color(255, 0 , 0);
  }
  
  Blip(float x, float y, float d, color c) {
    this.x = x;
    this.y = y;
    this.diam = d;
    this.c = c;
  }
  
  void setX(float x) {
    this.x = x;
  }

  void setY(float y) {
    this.y = y;
  }

  void setDiam(float d) {
    this.diam = d;
  }
  
  void setColor(color c) {
    this.c = c;
  }

  void display() {
    noStroke();
    fill(c);
    ellipse(x, y, diam, diam);
  }
}