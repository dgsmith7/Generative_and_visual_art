float outerX[] = new float[5];
float outerY[] = new float [5];

float innerX[] = new float[5];
float innerY[] = new float [5];

float outerSizeFactor = 100;
float innerSizeFactor = .38 * outerSizeFactor;
float originX = 250;
float originY = 250;

void setup () {
  size(500, 500);
  background(125);
  for (int i = 0; i < 5; i ++) {
    outerX[i] = originX + (outerSizeFactor * cos((1.5 * PI)+(i * 1.256636)));
    outerY[i] = originY + (outerSizeFactor * sin((1.5 * PI)+(i * 1.256636)));
    innerX[i] = originX + (innerSizeFactor * cos((.5 * PI)+(i * 1.256636)));
    innerY[i] = originY + (innerSizeFactor * sin((.5 * PI)+(i * 1.256636)));
  }
  stroke(10, 10, 10);
  strokeWeight(2);
  noLoop();
}

void draw () {
  for (int j = 0; j < 5; j ++) {
    point(outerX[j], outerY[j]);
    point(innerX[j], innerY[j]);
  }
//  stroke(255, 0 , 0);
  strokeWeight(1);
  int j;
  int k;
  for (int i = 0; i < 5; i ++) {
    j = i + 3;
    if (j > 4) {j = j - 5;}
    k = i + 1;
    if (k > 4) {k = 0;}
    line(outerX[i], outerY[i], innerX[j], innerY[j]);
    line(innerX[j], innerY[j], outerX[k], outerY[k]);
  }
}
