int slant=0;


void setup () {
  size (700,700);
  background (10, 130, 190);
  strokeWeight(5);
}

void draw () {
  background (10, 130, 190);
  for (int i = 0; i<width; i+=15) {
    stroke (0);
//    line (0,i, i,height);
    stroke (160, 10, 190);
    line(i,0, i, width);
  }
  for (int i = 0; i<width; i+=15) {

    stroke (130, 130, 130);
    line ( 0,i-slant, width, i+slant);
  }
}

void keyPressed () {
  if (key == 's') {slant+=5;}
  if (key == 'a') {slant-=5;}
}
