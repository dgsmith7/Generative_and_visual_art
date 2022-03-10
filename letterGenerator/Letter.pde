class Letter {
  PVector position;
  float size;
  int nPoints;
  ArrayList<PVector> verticies = new ArrayList<PVector>();
  PShape form;
  
  Letter(float x, float y, float s) {
    position = new PVector(x, y);
    size = s;
    nPoints = int(random(9)) + 9;
    while (nPoints % 3 != 0) {
      nPoints = int(random(9)) + 9;
    }
    verticies = this.generateVerticies();
    form = buildForm();
  }
  
  ArrayList<PVector> generateVerticies() {
    int nSectors = int(360 / this.nPoints);
    ArrayList<PVector> newVertList = new ArrayList<PVector>();
    for (int i = 0; i < this.nPoints; i = i + 3) {
      float outerRadX = random(this.size/3) + (this.size/3);
      float outerRadY = random(this.size/2) + (this.size/3);
      float innerRadX = random(this.size/4);
      float innerRadY = random(this.size/3);
      newVertList.add(new PVector(this.position.x + (cos(radians(i * nSectors)) * outerRadX), 
                                  this.position.y + (sin(radians(i * nSectors)) * outerRadY)));
      newVertList.add(new PVector(this.position.x + (cos(radians((i+1) * nSectors)) * outerRadX), 
                                  this.position.y + (sin(radians((i+1) * nSectors)) * outerRadY)));
      newVertList.add(new PVector(this.position.x + (cos(radians((i+2) * nSectors)) * innerRadX), 
                                  this.position.y + (sin(radians((i+2) * nSectors)) * innerRadY)));
    }
    return newVertList;
  }
  
  PShape buildForm() {
    PShape p;
    p = createShape();
    p.beginShape();
    p.fill(random(255), random(255), random(255), 150);
    p.stroke(0);
    for (PVector n: this.verticies) {
      p.vertex(n.x, n.y);
    }
    p.endShape(CLOSE);
    return p;
  }
  
  void display(float x, float y) {
    shape(this.form, x ,y);
  }
}
