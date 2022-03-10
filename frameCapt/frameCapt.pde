import processing.video.*;

Movie m1;

float adv = 0.333333;

PImage[] frames = new PImage[60];

int where = 0;

void setup() {
  frameRate(24);
  size(1920, 1080);
  m1 = new Movie(this, "IMG_4554.m4v");
  m1.frameRate(24);
  m1.stop();
  m1.play();
}

void draw() {
    image(m1, 0, 0);  
    saveFrame();
    if (m1.time() >= m1.duration()) {
      exit();
    }
}

void movieEvent(Movie m) {
  m.read();
}
