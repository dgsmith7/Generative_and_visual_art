import processing.svg.*;

PImage img;

void setup() {
  size(500, 500, SVG, "bbcLogo.svg");
  img = loadImage("bbcLogo.png");
}

void draw() {
  image(img, 0 , 0);
  exit();
}
