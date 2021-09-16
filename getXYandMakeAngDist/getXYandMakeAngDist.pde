PImage img;
float pX, pY;;

void setup() {
  size(365, 365);
  pX = width/2;
  pY = height/2;
  img = loadImage("Screen Shot 2021-08-22 at 11.19.50 AM.png");
  fill(255, 0, 0);
  noStroke();
}

void draw() {
  background(img);
  stroke(255, 0, 0);
  ellipse(pX, pY, 1, 1);
  String posit = "x:" + (pX-1) + "  y:" + pY;
  text(posit, 15, 15);
}

void keyPressed() {
  switch (keyCode) {
    case UP: pY--; break;
    case DOWN: pY++; break;
    case LEFT: pX--; break;
    case RIGHT: pX++; break;
    case ENTER: float angle = atan2((pX-1) - (width/2), pY - (height/2));
                float radius = dist((pX-1), pY, width/2, height/2);
                println(angle, radius); 
                break;
  }
}
