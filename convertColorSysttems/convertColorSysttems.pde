float r, g, b, c, m, y, k, h, s, br;
color nc;

void setup() {
  size(600, 400);
  noStroke();
  r = 255;
  g = 0;
  b = 0;
  c = 0;
  m = 100;
  y = 100;
  k = 0;
  h = 0;
  s = 100;
  br = 100;
  nc = color(r, g, b);
  textSize(20);
}

void draw() {
  colorMode(RGB, 255, 255, 255);
  background(125);
  nc = color(r, g, b);
  fill(nc);
  rect(50, 50, 200, 200);
  fill(0);
  text("RGB: " + r + " - " + g + " - " + b, 50, 300);
  text("CMYK: " + c + "  - " + m + " - " + y + " - " + k, 50, 325);
  text("HSB: " + h + " - " + s + " - " + br, 50, 350);
  text("Press R-newRGB C-newCMYK H-newHSB", 50, 375);
}

void newRGB() {
  r = random(255);
  g = random(255);
  b = random(255);
  nc = color(r, g, b);
  RGBtoCMYK();
  RGBtoHSB();
}

void newCMYK() {
  c = random(100);
  m = random(100);
  y = random(100);
  k = random(100);
  CMYKtoRGB();
  RGBtoHSB();
}

void newHSB() {
  h = random(360);
  s = random(100);
  br = random(100);
  HSBtoRGB();
  RGBtoCMYK();
}

void RGBtoCMYK() {
  colorMode(RGB, 255, 255, 255);
  float rc = r / 255;
  float gc = g / 255;
  float bc = b / 255;
  k = 1 - max(rc, gc, bc);
  c = (1 - rc - k) / (1 - k) * 100;
  m = (1 - gc - k) / (1 - k) * 100;
  y = (1 - bc - k) / (1 - k) * 100;
  k = k * 100;
}

void RGBtoHSB() {
  colorMode(HSB, 360, 100, 100);
  h = hue(nc);
  s = saturation(nc);
  br = brightness(nc);
  colorMode(RGB, 255, 255, 255);
}

void CMYKtoRGB() {
  r = 255 * (1 - c /100) * (1 - k / 100);
  g = 255 * (1 - m /100) * (1 - k / 100);
  b = 255 * (1 - y /100) * (1 - k / 100);
  colorMode(RGB, 255, 255, 255);
}

void HSBtoRGB() {
  colorMode(HSB, 360, 100, 100);
  color nc = color(h, s, br);
  colorMode(RGB, 255, 255, 255);
  r = red(nc);
  g = green(nc);
  b = blue(nc);
}

void keyPressed() {
  switch(key) {
    case 'r': newRGB();
              break;
    case 'c': newCMYK();
              break;
    case 'h': newHSB();
              break;
  }
}
