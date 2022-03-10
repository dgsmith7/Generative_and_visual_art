class Tile {

  float x;
  float y;
  float r;
  color c;
  float alt;
  
  Tile() {
    this.x = width/2;
    this.y = height/2;
    this.r = 25;
    this.c = color(255, 0, 0);
    this.alt = (sqrt(3)/2) * r;
  }
  
  Tile(float x, float y, float r, color c) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
    this.alt = (sqrt(3)/2) * r;
  }
  
  void display() {
//    noStroke();
    stroke(0);
    fill(this.c);
    beginShape();
    vertex(this.x, this.y - r);
    vertex(this.x + alt, this.y - (r/2));
    vertex(this.x + alt, this.y + (r/2));
    vertex(this.x, this.y + r);
    vertex(this.x - alt, this.y + (r/2));
    vertex(this.x - alt, this.y - (r/2));
    vertex(this.x, this.y - r);    
    endShape();
//    draw three lines
    line(this.x, this.y, this.x + alt, this.y - (r/2));
    line(this.x, this.y, this.x - alt, this.y - (r/2));
    line(this.x, this.y, this.x, this.y + r);
    
  }
  
  boolean isTouching(int checkX, int checkY) {
    if (dist(this.x, this.y, checkX, checkY) <= this.alt) {
      return true;
    }
    else {
      return false;
    }
  }
  
}