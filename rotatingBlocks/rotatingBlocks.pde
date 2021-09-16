import peasy.*;
PeasyCam cam;
int nBlocks = 25;
float yAng = 0;
float spreadAng = 13;
float[] lens = {100, 150, 200, 250, 300, 350, 350, 350, 350, 350, 350, 350, 350, 350, 350, 350, 350, 350, 350, 350, 300, 250, 200, 150, 100};


void setup(){
  size(500, 500, P3D);
    frameRate(60);
  cam = new PeasyCam(this, width/2, height/2, -600, 1250);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(2500);
  fill(#9A4CEA);
  lights();
}

void draw() {
  background(25);
  yAng += 0.1;
  for (int i = 0; i < nBlocks; i ++) {
    pushMatrix();
    translate(width/2, height/2 - (i*55) + 650, -width/2);
    rotateY(yAng);
    rotateY(radians(i * spreadAng));
    box(lens[i] /*- (i * 50)*/, 50, 50);
    popMatrix();
  }
  cam.beginHUD();
  text(spreadAng, 50, 50);
  cam.endHUD();
}

void keyPressed() {
  if (keyCode == UP) {
    spreadAng++;
  }
  if (keyCode == DOWN) {
    spreadAng--;
  }
}
