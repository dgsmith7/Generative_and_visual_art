class Particle {
  float latitude;
  float longitude;
  float trackLength;
  float incFactor;
  float currentRadius;
  color c;
    
  Particle() {
    this.latitude = random(360);
    this.longitude = random(180);
    this.trackLength = noise(latitude, longitude) * 250 + 100; //random(250);
    this.incFactor = this.trackLength / 100;
    this.currentRadius = where * incFactor;
    if (this.longitude < 90) {
      this.c = color(latitude/2, map(longitude, 0, 90, 0, 180), longitude);
    }
    else {
      this.c = color(latitude/2, map(longitude, 90, 180, 180, 0), longitude);
    }
  }
  
  void display() {
    noStroke();
    fill(this.c);
    pushMatrix();
    translate((currentRadius*sin(radians(longitude))*cos(radians(latitude))), 
                     (currentRadius* sin(radians(longitude))*sin(radians(latitude))), 
                     (currentRadius*cos(radians(longitude))));
    sphere(2);
    popMatrix();
      line (0, 0, 0, (currentRadius*sin(radians(longitude))*cos(radians(latitude))), 
                     (currentRadius* sin(radians(longitude))*sin(radians(latitude))), 
                     (currentRadius*cos(radians(longitude))));
  } 
  
  void move() {
    currentRadius = where * incFactor;
    currentRadius = constrain(currentRadius, 0, trackLength);
  }
}
