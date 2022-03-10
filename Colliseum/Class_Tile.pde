class Tile {
  
  float x;
  float y;
  float z = 0;
  float h;
  float thetaStart;
  float thetaWide;
  float thetaEnd;
  float radius;
  float speed; 
  color c;
  
  Tile () {
    this.x = random(width / 2);
    this.y = random(height * 3) - height;
    this.z = 0;
    this.h = random(100) + 50;
    this.radius = random(30) + 1500;
    this.thetaStart = random(TWO_PI);
    this.thetaWide = random(QUARTER_PI / 2) + (QUARTER_PI / 3);
    this.thetaEnd = this.thetaStart + this.thetaWide;
    this.speed = random(0.02) - 0.01;
    this.c = color(random(255), random(255), random(255), 100);
  }
  
  void display() {
    float gap = 0.01;
    noStroke();
    fill(this.c);
    beginShape();
    vertex(this.x + cos(this.thetaStart) * this.radius, this.y , this.z + sin(this.thetaStart) * this.radius);
    for (float i = thetaStart; i < thetaEnd; i = i + gap) {
      vertex(this.x + cos(i) * this.radius, this.y, this.z + sin(i) * this.radius);
    }
    vertex(this.x + cos(this.thetaEnd) * this.radius, this.y, this.z + sin(this.thetaEnd) * this.radius);
    
    vertex(this.x + cos(this.thetaEnd) * this.radius, this.y + this.h, this.z + sin(this.thetaEnd) * this.radius);
    for (float i = thetaEnd; i > thetaStart; i = i - gap) {
      vertex(this.x + cos(i) * this.radius, this.y + this.h, this.z + sin(i) * this.radius);
    }
    vertex(this.x + cos(this.thetaStart) * this.radius, this.y + this.h, this.z + sin(this.thetaStart) * this.radius);
    endShape();
  }
  
  void move() {
    this.thetaStart = this.thetaStart + this.speed;
    this.thetaEnd = this.thetaStart + this.thetaWide;
  }
  
}

