class Shape {
  int nVert;
  PVector center;
  PVector allVert[];
  
  Shape() {
    this.nVert = 4;
    this.center = new PVector(width/2, height/2);
    this.allVert = new PVector[nVert];
    for (int i = 0; i < nVert; i++) {
      allVert[i] = new PVector((this.center.x + cos(radians(i*(360/nVert))) * random(50, 75)),
                               (this.center.y + sin(radians(i*(360/nVert))) * random(50, 75)));
    }
  }
  
  Shape(PVector c) {
    this.nVert = int(random(9, 21));
    while (this.nVert % 3 != 0) {
      this.nVert = int(random(9, 21));
    }
    this.center = c;
    this.allVert = new PVector[nVert];
    for (int i = 0; i < nVert; i++) {
      if (i%3 == 0) {
      this.allVert[i] = new PVector((this.center.x + cos(radians(i*(360/nVert))) * random(25, 35)),
                                    (this.center.y + sin(radians(i*(360/nVert))) * random(25, 35)));
      } else {
      this.allVert[i] = new PVector((this.center.x + cos(radians(i*(360/nVert))) * random(50, 75)),
                                    (this.center.y + sin(radians(i*(360/nVert))) * random(50, 75)));
      }
    }
  }
  
  void display() {
    beginShape();
      for (int i = 0; i < nVert; i ++) {
         vertex(this.allVert[i].x, this.allVert[i].y);
      }    
    endShape(CLOSE);
  }
}
