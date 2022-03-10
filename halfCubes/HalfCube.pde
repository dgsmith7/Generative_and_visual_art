class HalfCube {
  PVector location;
  PVector rotation;
  PVector orientation;
  float scale;
  
  HalfCube() {
    this.location = new PVector(width/2, height/2, depth/2);
    this.rotation = new PVector(0.01, 0.01, 0.01);
    this.orientation = new PVector(rotation.x, rotation.y, rotation.z);
    this.scale = 10;
  }
  
  HalfCube(PVector location_, PVector rotation_, float scale_) {
    this.location = location_;
    this.rotation = rotation_;
    this.orientation = new PVector(rotation.x, rotation.y, rotation.z);
    this.scale = scale_/2;
  }
  
  void display() {
    fill(#4FAEE0);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y, location.z);
    rotateX(orientation.x);
    rotateY(orientation.y);
    rotateZ(orientation.z);
    beginShape();
    vertex(-scale, -scale, -scale);
    vertex(scale, -scale, -scale);
    vertex(scale, -scale, 0);
    vertex(-scale, -scale, 0);
    vertex(-scale, -scale, -scale);
    endShape();
    beginShape();
    vertex(-scale, -scale, -scale);
    vertex(-scale, scale, -scale);
    vertex(-scale, scale, scale);
    vertex(-scale, 0, scale);
    vertex(-scale, 0, 0);
    vertex(-scale, -scale, 0);
    endShape(CLOSE);
    beginShape();
    vertex(-scale, 0, 0);
    vertex(scale, 0, 0);
    vertex(scale, -scale, 0);
    vertex(-scale, -scale, 0);
    endShape(CLOSE);
    beginShape();
    vertex(scale, 0, 0);
    vertex(0, 0, 0);
    vertex(0, 0, -scale);
    vertex(scale, 0, -scale);
    endShape(CLOSE);
    beginShape();
    vertex(scale, -scale, -scale);
    vertex(scale, 0, -scale);
    vertex(scale, 0, 0);
    vertex(scale, -scale, 0);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0, -scale);
    vertex(0, scale, -scale);
    vertex(-scale, scale, -scale);
    vertex(-scale, -scale, -scale);
    vertex(scale, -scale, -scale);
    vertex(scale, 0, -scale);
    endShape(CLOSE);
    beginShape();
    vertex(0, scale, scale);
    vertex(-scale, scale, scale);
    vertex(-scale, scale, -scale);
    vertex(0, scale, -scale);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0, scale);
    vertex(0, 0, -scale);
    vertex(0, scale, -scale);
    vertex(0, scale, scale);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0, 0);
    vertex(0, 0, scale);
    vertex(-scale, 0, scale);
    vertex(-scale, 0, 0);
    endShape(CLOSE);
    beginShape();
    vertex(0, 0, scale);
    vertex(0, scale, scale);
    vertex(-scale, scale, scale);
    vertex(-scale, 0, scale);
    endShape(CLOSE);
    popMatrix();
  }
  
  void update() {
    orientation.x = orientation.x + rotation.x;
    if (orientation.x > TWO_PI) {orientation.x = 0;}
    if (orientation.x < 0) {orientation.x = TWO_PI;}
    orientation.y = orientation.y + rotation.y;
    if (orientation.y > TWO_PI) {orientation.y = 0;}
    if (orientation.y < 0) {orientation.y = TWO_PI;}
    orientation.z = orientation.z + rotation.z;
    if (orientation.z > TWO_PI) {orientation.z = 0;}
    if (orientation.z < 0) {orientation.z = TWO_PI;}
    
  }
}