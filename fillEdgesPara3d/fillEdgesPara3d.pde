String fN = "i1x1526y1096.png";
PImage p;
float bgc=255;

void setup () {
  size(1526, 1096);
  p = loadImage(fN);
  background(p);
  loadPixels();
  noLoop();
}

void draw() {
  for (int j = 0; j < 5; j ++) {
    for (int i = 0; i < (width*height - width); i ++) {
      if ((pixels[i] == color(bgc)) && (pixels[i+1] != color(bgc))) {
        pixels[i] = color(0);
      }
      if ((pixels[i] != color(bgc)) && (pixels[i+1] == color(bgc))) {
        pixels[i] = color(0);
      }
      if ((pixels[i] == color(bgc)) && (pixels[i+width] != color(bgc))) {
        pixels[i] = color(0);
      }
      if ((pixels[i] != color(bgc)) && (pixels[i+width] == color(bgc))) {
        pixels[i] = color(0);
      }
    }
    updatePixels();
  }
}
