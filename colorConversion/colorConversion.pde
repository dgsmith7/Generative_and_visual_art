// https://www.rapidtables.com/convert/color/rgb-to-cmyk.html

import controlP5.*;

ControlP5 cp5;

float c = 50;
float m = 50;
float y = 50;
float k = 50;

float r = 50;
float g = 50;
float b = 50;

float h = 50;
float s = 50;
float br = 50;

void setup() {
  size(500, 400);
  noStroke();
  cp5 = new ControlP5(this);
  cp5.addSlider("c")
    .setPosition(50, 275)
    .setRange(0, 100)
    .setWidth(100)
//    .setValue(c);
    ;
  cp5.addSlider("m")
    .setPosition(50, 300)
    .setRange(0, 100)
    .setWidth(100)
//    .setValue(m);
    ;
  cp5.addSlider("y")
    .setPosition(50, 325)
    .setRange(0, 100)
    .setWidth(100)
//    .setValue(y);
    ;
  cp5.addSlider("k")
    .setPosition(50, 350)
    .setRange(0, 100)
    .setWidth(100)
//    .setValue(k);
    ;
  cp5.addSlider("r")
    .setPosition(200, 275)
    .setRange(0, 255)
    .setWidth(100)
//    .setValue(r);
    ;
  cp5.addSlider("g")
    .setPosition(200, 300)
    .setRange(0, 255)
    .setWidth(100)
//    .setValue(g);
    ;
  cp5.addSlider("b")
    .setPosition(200, 325)
    .setRange(0, 255)
    .setWidth(100)
//    .setValue(b);
    ;
  cp5.addSlider("h")
    .setPosition(350, 275)
    .setRange(0, 360)
    .setWidth(100)
//    .setValue(h);
    ;
  cp5.addSlider("s")
    .setPosition(350, 300)
    .setRange(0, 100)
    .setWidth(100)
//    .setValue(s);
    ;
  cp5.addSlider("br")
    .setPosition(350, 325)
    .setRange(0, 100)
    .setWidth(100)
//    .setValue(br);
    ;
   convertFromRGB();
}

void draw() {
  background(125);
  //fill(0);
  //text(r, 25, 15);
  //text(g, 50, 15);
  //text(b, 75, 15);
  fill(r, g, b);
  rect(50, 50, 100, 100);
  rect(200, 50, 100, 100);
  rect(350, 50, 100, 100);
  fill(0);
  cp5.get("c").setValue(c);
  cp5.get("m").setValue(m);
  cp5.getController("y").setValue(y);
  cp5.getController("k").setValue(k);
  cp5.getController("r").setValue(r);
  cp5.getController("g").setValue(g);
  cp5.getController("b").setValue(b);
  cp5.getController("h").setValue(h);
  cp5.getController("s").setValue(s);
  cp5.getController("br").setValue(br);
  showValues();
}

void c(float nc) {
  c = nc;
  convertFromCMYK();
  //cp5.getController("r").setValue(r);
  //cp5.getController("g").setValue(g);
  //cp5.getController("b").setValue(b);
  //cp5.getController("h").setValue(h);
  //cp5.getController("s").setValue(s);
  //cp5.getController("br").setValue(br);
}
void m(float nm) {
  m = nm;
  convertFromCMYK();
  //cp5.getController("r").setValue(r);
  //cp5.getController("g").setValue(g);
  //cp5.getController("b").setValue(b);
  //cp5.getController("h").setValue(h);
  //cp5.getController("s").setValue(s);
  //cp5.getController("br").setValue(br);
}
void y(float ny) {
  y = ny;
  convertFromCMYK();
  //cp5.getController("r").setValue(r);
  //cp5.getController("g").setValue(g);
  //cp5.getController("b").setValue(b);
  //cp5.getController("h").setValue(h);
  //cp5.getController("s").setValue(s);
  //cp5.getController("br").setValue(br);
}
void k(float nk) {
  k = nk;
  convertFromCMYK();
  //cp5.getController("r").setValue(r);
  //cp5.getController("g").setValue(g);
  //cp5.getController("b").setValue(b);
  //cp5.getController("h").setValue(h);
  //cp5.getController("s").setValue(s);
  //cp5.getController("br").setValue(br);
}
void r(float nr) {
  r = nr;
  convertFromRGB();
  //cp5.getController("c").setValue(c);
  //cp5.getController("m").setValue(m);
  //cp5.getController("y").setValue(y);
  //cp5.getController("k").setValue(k);
  //cp5.getController("h").setValue(h);
  //cp5.getController("s").setValue(s);
  //cp5.getController("br").setValue(br);
}
void g(float ng) {
  g = ng;
  convertFromRGB();
  //cp5.getController("c").setValue(c);
  //cp5.getController("m").setValue(m);
  //cp5.getController("y").setValue(y);
  //cp5.getController("k").setValue(k);
  //cp5.getController("h").setValue(h);
  //cp5.getController("s").setValue(s);
  //cp5.getController("br").setValue(br);
}
void b(float nb) {
  b = nb;
  convertFromRGB();
  //cp5.getController("c").setValue(c);
  //cp5.getController("m").setValue(m);
  //cp5.getController("y").setValue(y);
  //cp5.getController("k").setValue(k);
  //cp5.getController("h").setValue(h);
  //cp5.getController("s").setValue(s);
  //cp5.getController("br").setValue(br);
}
void h(float nh) {
  h = nh;
  convertFromHSB();
  //cp5.getController("c").setValue(c);
  //cp5.getController("m").setValue(m);
  //cp5.getController("y").setValue(y);
  //cp5.getController("k").setValue(k);
  //cp5.getController("r").setValue(r);
  //cp5.getController("g").setValue(g);
  //cp5.getController("b").setValue(b);
}
void s(float ns) {
  s = ns;
  convertFromHSB();
  //cp5.getController("c").setValue(c);
  //cp5.getController("m").setValue(m);
  //cp5.getController("y").setValue(y);
  //cp5.getController("k").setValue(k);
  //cp5.getController("r").setValue(r);
  //cp5.getController("g").setValue(g);
  //cp5.getController("b").setValue(b);
}
void br(float nbr) {
  br = nbr;
  convertFromHSB();
  //cp5.getController("c").setValue(c);
  //cp5.getController("m").setValue(m);
  //cp5.getController("y").setValue(y);
  //cp5.getController("k").setValue(k);
  //cp5.getController("r").setValue(r);
  //cp5.getController("g").setValue(g);
  //cp5.getController("b").setValue(b);
}

void convertFromCMYK() {
  r = 255 * (1 - c /100) * (1 - k / 100);
  g = 255 * (1 - m /100) * (1 - k / 100);
  b = 255 * (1 - y /100) * (1 - k / 100);
  //cp5.getController("r").update();
  //cp5.getController("g").update();
  //cp5.getController("b").update();
  colorMode(RGB, 255, 255, 255);
  color nc = color(r, g, b);
colorMode(HSB, 360, 100, 100);
  h = hue(nc);
  s = saturation(nc);
  br = brightness(nc);
  //cp5.getController("h").update();
  //cp5.getController("s").update();
  //cp5.getController("br").update();
  colorMode(RGB, 255, 255, 255);
}

void convertFromRGB() {
colorMode(RGB, 255, 255, 255);
  float rc = r / 255;
  float gc = g / 255;
  float bc = b / 255;
  k = 1 - max(rc, gc, bc);
  c = (1 - rc - k) / (1 - k) * 100;
  m = (1 - gc - k) / (1 - k) * 100;
  y = (1 - bc - k) / (1 - k) * 100;
  k = k * 100;
  //cp5.getController("c").update();
  //cp5.getController("m").update();
  //cp5.getController("y").update();
  //cp5.getController("k").update();
  color nc = color(r, g, b);
colorMode(HSB, 360, 100, 100);
  h = hue(nc);
  s = saturation(nc);
  br = brightness(nc);
  //cp5.getController("h").update();
  //cp5.getController("s").update();
  //cp5.getController("br").update();
  colorMode(RGB, 255, 255, 255);
}

void convertFromHSB() {
  colorMode(HSB, 360, 100, 100);
  color nc = color(h, s, br);
  colorMode(RGB, 255, 255, 255);
  r = red(nc);
  g = green(nc);
  b = blue(nc);
  //cp5.getController("r").update();
  //cp5.getController("g").update();
  //cp5.getController("b").update();
  float rc = r / 255;
  float gc = g / 255;
  float bc = b / 255;
  k = 1 - max(rc, gc, bc);
  c = (1 - rc - k) / (1 - k) * 100;
  m = (1 - gc - k) / (1 - k) * 100;
  y = (1 - bc - k) / (1 - k) * 100;
  k = k * 100;
  //cp5.getController("c").update();
  //cp5.getController("m").update();
  //cp5.getController("y").update();
  //cp5.getController("k").update();
}

void showValues() {
  text(c, 5, 35);
  text(m, 55, 35);
  text(y, 105, 35);
  text(k, 155, 35);
  text(r, 205, 200);
  text(g, 255, 200);
  text(b, 305, 200);
  text(h, 355, 35);
  text(s, 405, 35);
  text(br, 455, 35);
}
