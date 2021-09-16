import processing.sound.*;
SoundFile file;

int nSuns = 1250;
Sun[] allSuns = new Sun[nSuns];

void setup() {
  size(2000, 1000);
  noStroke();
  initSuns();
  file = new SoundFile(this, "sample.wav");
  file.play();
}

void draw() {
  background(125);
  for (int i = 0; i < nSuns; i ++) {
    allSuns[i].display();
    allSuns[i].move();
    allSuns[i].checkEdges();
  }
}

void initSuns() {
  for (int i = 0; i < nSuns; i ++) {
      allSuns[i] = new Sun();
  }
}
