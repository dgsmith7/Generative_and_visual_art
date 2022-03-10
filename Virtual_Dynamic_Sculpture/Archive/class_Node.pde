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

//noStroke ();

    fill (cubeColor);
    translate (x, y, z);
    box(cubeSize-5);
 //   sphere(cubeSize-10);
    translate (-x, -y, -z);
  }
}

