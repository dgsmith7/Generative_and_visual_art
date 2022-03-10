class Node {

  float latitude, longitude;
  float armLength;
  PVector position;
  color c;
  float opac;
  float size;
  int sector;

  Node () {
    this.latitude = int(random(360));
    this.longitude = int(random(180));
    this.armLength = random(width);
    position = computeSectorAndPosition(latitude, longitude, armLength);
    this.c = color(0);
    this.opac = 127;
    this.size = random(25, 75);
  }

  void display() {
    noStroke();
    fill(c, opac);
    pushMatrix();
    translate(position.x, position.y, position.z);
    box(size);
    popMatrix();
  }

  PVector computeSectorAndPosition (float latitude, float longitude, float armLength) {
    this.sector = (int(latitude>45) + 
                    int(latitude>90)+ 
                    int(latitude>135) +
                    int(latitude>180) + 
                    int(latitude>215) + 
                    int(latitude>270) +  
                    int(latitude>315) +
                    (int(longitude > 45) * 8) +
                    (int(longitude > 90) * 8) + 
                    (int(longitude > 135) * 8));
    return new PVector(armLength*sin(radians(longitude))*cos(radians(latitude)), 
      (armLength* sin(radians(longitude))*sin(radians(latitude))), 
      (armLength*cos(radians(longitude))));
  }
}
