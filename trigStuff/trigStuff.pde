float unit = 150;
float index;

void setup() {
  size(700, 700);
  noStroke();
//  noLoop();
}

void draw() {
  background(0);
  index = map(mouseX, 0, width, 0, 360);
  for (int i = 0; i < 360; i ++) {
    fill(255, 0 , 0);
    ellipse(width/2 + cos(radians(i)) * unit, 100+i, 3, 3);
    text("cos", 50, 65);
    fill(255);
    ellipse(width/2 + cos(radians(index)) * unit, 100+index, 10, 10);
    fill(0, 255, 0);
    ellipse(width/2 + sin(radians(i)) * unit, 100+i, 3, 3);
    text("sin", 50, 80);
    fill(255);
    ellipse(width/2 + sin(radians(index)) * unit, 100+index, 10, 10);
    fill(0, 0, 255);
    ellipse(width/2 + tan(radians(i)) * unit, 100+i, 3, 3);
    text("tan", 50, 95);
    fill(255);
    ellipse(width/2 + tan(radians(index)) * unit, 100+index, 10, 10);
    fill(128, 0 , 0);
    ellipse(width/2 + acos(radians(i)) * unit, 100+i, 3, 3);
    text("arccos", 50, 110);
    fill(255);
    ellipse(width/2 + acos(radians(index)) * unit, 100+index, 10, 10);
    fill(0, 128, 0);
    ellipse(width/2 + asin(radians(i)) * unit, 100+i, 3, 3);
    text("arcsin", 50, 125);
    fill(255);
    ellipse(width/2 + asin(radians(index)) * unit, 100+index, 10, 10);
    fill(0, 0, 128);
    ellipse(width/2 + atan(radians(i)) * unit, 100+i, 3, 3);
    text("arctan", 50, 140);
    fill(255);
    ellipse(width/2 + atan(radians(index)) * unit, 100+index, 10, 10);
    text(index, 50, 50);
}
//  printTable();
}

void printTable() {
  float i;
  for (int j = 0; j < 360; j++) {
    i = radians(j);
    println(j, cos(i), acos(i), sin(i), asin(i), tan(i), atan(i));
  }
}
