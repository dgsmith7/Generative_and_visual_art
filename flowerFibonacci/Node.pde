class Node {

  float angle, radius;
  float x, y;
  float size;
  color c;

  Node() {
  }

  Node(float a) {
    this.angle = a;
    this.radius = .5 * sqrt(n);
    this.x = (width/2) + cos(radians(this.angle)) * radius;
    this.y = (height/2) + sin(radians(this.angle)) * radius;
    this.size = 5;
    this.c = color(0, 100, 100, 0);
  }

  Node(float a, color c) {
    this.angle = a;
    this.radius = .5 * sqrt(n);
    this.x = (width/2) + cos(radians(this.angle)) * radius;
    this.y = (height/2) + sin(radians(this.angle)) * radius;
    this.size = 5;//map(noise(noise2, noise2), 0, 1, 25, 35);//25;
    this.c = c;
  }

  void display() {
    fill(c);
    ellipse(x, y, this.size, this.size);
  }

  void displayHex() {
    fill(c, map(radius-(visRange-150), 0, 150, 255, 0));
    pushMatrix();
    translate(this.x, this.y);
    rotate(angle);
    beginShape();
    vertex(cos(radians(0)) * (this.size/2), sin(radians(0)) * (this.size/2));
    vertex(cos(radians(60)) * (this.size/2), sin(radians(60)) * (this.size/2));
    vertex(cos(radians(120)) * (this.size/2), sin(radians(120)) * (this.size/2));
    vertex(cos(radians(180)) * (this.size/2), sin(radians(180)) * (this.size/2));
    vertex(cos(radians(240)) * (this.size/2), sin(radians(240)) * (this.size/2));
    vertex(cos(radians(300)) * (this.size/2), sin(radians(300)) * (this.size/2));
    endShape(CLOSE);
    popMatrix();
  }

  void displayHeart() {
    pushMatrix();
    heart.disableStyle();
    fill(c);
    translate(this.x, this.y);
    rotate(atan2(this.y-height/2, this.x-width/2)+PI/2);
    scale(1.1);
    shape(heart, 0, 0, this.size, this.size);
    popMatrix();
  }

  void move() {
    this.size += .04;
    this.radius += .5;
    this.x = (width/2) + cos(radians(this.angle)) * radius;
    this.y = (height/2) + sin(radians(this.angle)) * radius;
  }
}
