class Sun {
  float sunX;
  float sunY;
  float xSpd;
  float ySpd;
  float sunSize;
  color sunColor;
  
  Sun() {
  this.sunX = random(width);
  this.sunY = random(height);
  while (this.xSpd == 0) {
    this.xSpd = random(11) - 5;
  }
  while (this.ySpd == 0) {
    this.ySpd = random(11) - 5;
  }
  this.sunSize = 25;
  this.sunColor = color(random(255), random(255), random(255));
  }
  
  void display() {
    fill(#FEFF03, 125);
    ellipse(sunX, sunY + 2 * (sunSize / 5), sunSize, sunSize/5);
    ellipse(sunX, sunY + 4 * (sunSize / 5), sunSize, sunSize/5);
    fill(0, 125);
    ellipse(sunX, sunY + (sunSize / 5), sunSize, sunSize/5);
    ellipse(sunX, sunY + 3 * (sunSize / 5), sunSize, sunSize/5);
    ellipse(sunX, sunY + 5 * (sunSize / 5), sunSize, sunSize/5);
  }
  
  void move() {
    this.sunX += xSpd;
    this.sunY += ySpd;
  }
  
  void checkEdges() {
    if ((sunX < 0) || (sunX > width)) {
      this.xSpd *= -1;
    }
    if ((sunY < 0) || (sunY > height)) {
      this.ySpd *= -1;
    }
  }
}
