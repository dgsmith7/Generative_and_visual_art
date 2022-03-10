void setup() {
  size(800, 400);
  background(225);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  noLoop();
}

void draw() {
  fill(0, 99, 30);
  rect(100, 100, 150, 200);
  fill(60, 70, 45);
  rect(250, 100, 150, 200);
  fill(120, 40, 75);
  rect(400, 100, 150, 200);
  fill(239, 25, 99);
  rect(550, 100, 150, 200);
  fill(0);
  text("Broad hue, broad value, broad saturation", 100, 325);
  save("Broad_Hue_Broad_Val_Broad_Sat.png");  
}