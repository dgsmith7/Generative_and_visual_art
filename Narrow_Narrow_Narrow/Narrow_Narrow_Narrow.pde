void setup() {
  size(800, 400);
  background(225);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  noLoop();
}

void draw() {
  fill(149, 99, 40);
  rect(100, 100, 150, 200);
  fill(160, 95, 35);
  rect(250, 100, 150, 200);
  fill(140, 90, 45);
  rect(400, 100, 150, 200);
  fill(170, 85, 40);
  rect(550, 100, 150, 200);
  fill(0);
  text("Analogous hue, narrow value, narrow saturation", 100, 325);
  save("Narrow_Hue_Narrow_Val_Narrow_Sat.png");  
}