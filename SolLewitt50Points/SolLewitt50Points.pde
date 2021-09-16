  float [] pointsX = new float [50];
  float [] pointsY = new float [50];

void setup () {
  size (1250, 750);
  background(255);
  for (int i=0; i<50; i++) {
    pointsX[i] = random (50, 1201);
    pointsY[i] = random (50, 701);
  }
  noLoop();
}

void draw () {
 stroke (75);
  for (int i = 0; i<50; i++) {
  for (int j=0; j<50; j++) {
 line(pointsX[i], pointsY[i], pointsX[j], pointsY[j]);
  } 
}
 stroke (0);
 fill(0);
  for (int i = 0; i<50; i++) {
 ellipse(pointsX[i], pointsY[i], 5,5);
 }
}
