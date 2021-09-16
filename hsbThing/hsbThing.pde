int h = 180;
int s = 50;
int b = 50;

void setup () {
  size(500, 650);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  textSize(35);
}

void draw() {
  background(0, 0, 58);
  fill(h, 50, 50);
  rect(50, 50, 100, 100);
  fill(180, s, 50);
  rect(200, 50, 100, 100);
  fill(180, 50, b);
  rect(350, 50, 100, 100);
  fill(0, 0, 58);
  text(h, 60, 90);
  text("hue", 60, 130);
  text(s, 210, 90);
  text("sat", 210, 130);
  text(b, 360, 90);
  text("brt", 360, 130);
  if ((mouseY > 50)  && (mouseY < 150)) {
    if ((50 < mouseX) && (mouseX < 150)) {
      h = int(map(mouseX, 50, 150, 0, 360));
    }
    if ((210 < mouseX) && (mouseX < 310)) {
      s = int(map(mouseX, 200, 300, 0, 100));
    }
    if ((350 < mouseX) && (mouseX < 450)) {
      b = int(map(mouseX, 350, 450, 0, 100));
    }
  }
  fill(h, s, b);
  rect(50, 200, 400, 400);
}
