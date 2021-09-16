void setup() {
  size(750, 350);
  background(200);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  noLoop();
}

void draw() {
// red
  fill(0, 99, 99);
  rect(50, 50, 50, 50);
  fill(0, 99, 50);
  rect(150, 50, 50, 50);
  fill(0);
  text("delta V, H + S constant", 25, 125);

  fill(0, 99, 99);
  rect(50, 150, 50, 50);
  fill(0, 40, 99);
  rect(150, 150, 50, 50);
  fill(0);
  text("delta S, H + V constant", 25, 225);

  fill(0, 99, 99);
  rect(50, 250, 50, 50);
  fill(180, 99, 99);
  rect(150, 250, 50, 50);
  fill(0);
  text("delta H, S + V constant", 25, 325);

// green
  fill(119, 99, 50);
  rect(300, 50, 50, 50);
  fill(119, 99, 80);
  rect(400, 50, 50, 50);

  fill(119, 99, 50);
  rect(300, 150, 50, 50);
  fill(119, 25, 50);
  rect(400, 150, 50, 50);

  fill(119, 99, 50);
  rect(300, 250, 50, 50);
  fill(299, 99, 50);
  rect(400, 250, 50, 50);
  
// blue
  fill(239, 99, 99);
  rect(550, 50, 50, 50);
  fill(239, 99, 50);
  rect(650, 50, 50, 50);

  fill(239, 99, 99);
  rect(550, 150, 50, 50);
  fill(239, 40, 99);
  rect(650, 150, 50, 50);

  fill(0, 99, 99);
  rect(550, 250, 50, 50);
  fill(180, 99, 99);
  rect(650, 250, 50, 50);
  
  save("HSV_shifts.png");
}