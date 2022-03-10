class Arm {
  PVector anchor;
  float size;
  PVector end;
  float theta;
  
  Arm(PVector _anchor, float _size, float _theta) {
    this.anchor = _anchor;
    this.size = _size;
    this.end = new PVector(_anchor.x + cos(_theta) * _size, _anchor.y + sin(_theta) * _size);
    this.theta = _theta;
  }

  void computeEnd() {
    this.end.x = this.anchor.x + cos(theta) * this.size;
    this.end.y = this.anchor.y + sin(theta) * this.size;
  }

  void display() {
    this.computeEnd();
    noStroke();
    stroke(#5281A5);
    strokeWeight(3);
    line(this.anchor.x, this.anchor.y, this.end.x, this.end.y);
    fill(#55D8F7);
    ellipse(this.anchor.x, this.anchor.y, 5, 5);
    ellipse(this.end.x, this.end.y, 5, 5);
    fill(255, 0, 0);
    if (this.mouseIsOverEnd()) {
      ellipse(this.end.x, this.end.y, 7, 7);
    }
    noFill();
    noStroke();
    strokeWeight(1);
  }
  
  boolean mouseIsOverEnd() {
    if (dist(mouseX, mouseY, this.end.x, this.end.y) < 10) {
      return true;
    } else {
      return false;
    }    
  }
  
  void adjust() {
    this.theta = atan2(mouseY - this.anchor.y, mouseX - this.anchor.x);
  }

}
