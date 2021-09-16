class node { 
  float x, y, z, cubeSize;
  color cubeColor;

  node (float x, float y, float z, color c, float s) {
    this.x=x;
    this.y=y;
    this.z=z;
    cubeColor = c;
    cubeSize = s;
  }

  void display () {
    stroke (outlineColor);
    fill (cubeColor);
    translate (x, y, z);
    box(cubeSize);
    translate (-x, -y, -z);
  }
}

