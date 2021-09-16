class EquiTri {

  float base;
  float xPosit;
  float yPosit;
  color c;
  boolean upSideDown;

  EquiTri(float base, float xPosit, float yPosit, color c, boolean upSideDown) {
    this.base = base;
    this.xPosit = xPosit;
    this.yPosit = yPosit;
    this.c = c;
    this.upSideDown = upSideDown;
  }

  void display() {
    noStroke();
    fill(c);
    if (upSideDown) {
      beginShape();
      vertex(xPosit, yPosit);
      vertex(xPosit + base, yPosit);
      vertex(xPosit + (base / 2), yPosit + ((base / 2) * 1.73205));
      endShape();
    } else {
      beginShape();
      vertex(xPosit, yPosit);
      vertex(xPosit + (base / 2), yPosit + ((base / 2) * 1.73205));
      vertex(xPosit - (base / 2), yPosit + ((base /2) * 1.73205));
      endShape();
    }
  }
}