class Tile {
  int value; 
  PShape lines;

  Tile(PShape p, int v) {
    this.lines = p;
    this.value = v;
  }

  void display(float xPosit, float yPosit) {
    shape(this.lines, xPosit, yPosit);
  }
  
}
