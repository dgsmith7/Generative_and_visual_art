//  Changes result from ReactionDiffussion code into a crisper, black and white image

PImage img;

void setup() {
  size(1100, 1400);
  noLoop();
  img = loadImage("diffReact.png");
}

void draw() {
  image(img, 0, 0);
  loadPixels();
  for(int i = 0; i < 1540000; i ++) {
    if ((pixels[i] != color(0)) && 
        (pixels[i] != color(1)) && 
        (pixels[i] != color(2)) && 
        (pixels[i] != color(3)) && 
        (pixels[i] != color(4)) &&
        (pixels[i] != color(5)) &&
        (pixels[i] != color(6)) &&
        (pixels[i] != color(7)) &&
        (pixels[i] != color(8)) &&
        (pixels[i] != color(9)) &&
        (pixels[i] != color(10)) &&
        (pixels[i] != color(11)) &&
        (pixels[i] != color(12)) &&
        (pixels[i] != color(13)) &&
        (pixels[i] != color(14)) &&
        (pixels[i] != color(15))) {
      pixels[i] = color(255);
    } 
  }
  updatePixels();
  saveFrame("diffReactMod.png");
}
