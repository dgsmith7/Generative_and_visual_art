class Widget {
  float xPosit, yPosit;
  float unitSize;
  color topColor, leftColor, rightColor;
  
  Widget() {
    this.xPosit = 500;
    this.yPosit = 500;
    this.unitSize = 150;
    this.topColor = color (#FF0000);
    this.leftColor = color (#00FF00);
    this.rightColor = color (#0000FF);
  }
  
  Widget(float x, float y, float us, color tc, color lc, color rc) {
    this.xPosit = x;
    this.yPosit = y;
    this.unitSize = us;
    this.topColor = tc;
    this.leftColor = lc;
    this.rightColor = rc;
  }
  
  void display() {
    noStroke();
    fill(this.topColor);
    beginShape();
    vertex(this.xPosit, this.yPosit);
    vertex(this.xPosit + .7 * this.unitSize,
           this.yPosit  -.4 * this.unitSize);
    vertex(this.xPosit + .35 * this.unitSize,
           this.yPosit - .6 * this.unitSize);
    vertex(this.xPosit, 
           this.yPosit - .4 * this.unitSize);
    vertex(this.xPosit - .35 * this.unitSize,
           this.yPosit - .6 * this.unitSize);
    vertex(this.xPosit - .7 * this.unitSize,
           this.yPosit - .4 * this.unitSize);
    endShape(CLOSE);
    
    fill(this.leftColor);
    beginShape();
    vertex(this.xPosit, this.yPosit);
    vertex(this.xPosit + .7 * this.unitSize,
           this.yPosit  -.4 * this.unitSize);
    vertex(this.xPosit + .7 * this.unitSize,
           this.yPosit);
    vertex(this.xPosit + .35 * this.unitSize, 
           this.yPosit + .2 * this.unitSize);
    vertex(this.xPosit + .35 * this.unitSize,
           this.yPosit + .6 * this.unitSize);
    vertex(this.xPosit,
           this.yPosit + .8 * this.unitSize);
    endShape(CLOSE); 
    
    fill(this.rightColor);
    beginShape();
    vertex(this.xPosit, this.yPosit);
    vertex(this.xPosit - .7 * this.unitSize,
           this.yPosit - .4 * this.unitSize);
    vertex(this.xPosit - .7 * this.unitSize,
           this.yPosit);
    vertex(this.xPosit - .35 * this.unitSize, 
           this.yPosit + .2 * this.unitSize);
    vertex(this.xPosit - .35 * this.unitSize,
           this.yPosit + .6 * this.unitSize);
    vertex(this.xPosit,
           this.yPosit + .8 * this.unitSize);
    endShape(CLOSE);       
  }
}