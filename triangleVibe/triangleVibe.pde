
final float DPI = 75;
final float BASE = 2.25 * DPI;
final float HIGH = (BASE / 2) * 1.73025;
final float ALPH = 255;
ArrayList<EquiTri> triangles = new ArrayList<EquiTri> ();
color[] palette = new color[6];

void setup() {
  size(4500, 4500);
  background(125);
  initPalette();
  initShapes();
  noLoop();
}

void draw() {
  for (int i = 0; i < triangles.size(); i ++) {
    triangles.get(i).display();
  }
  save("trianglesBlack.png");
}

void initPalette() {
/*
// Approximation of Riley Frost's Original
  palette[0] = color(220, 170, 175, ALPH);
  palette[1] = color(110, 200, 180, ALPH);
  palette[2] = color(180, 200, 200, ALPH);
  palette[3] = color(225, 110, 90, ALPH);
  palette[4] = color(165, 130, 170, ALPH);
  palette[5] = color(225, 210, 155, ALPH);
// Blues and Oranges
  palette[0] = color(75, 135, 255, ALPH);
  palette[1] = color(75, 200, 255, ALPH);
  palette[2] = color(75, 230, 255, ALPH);
  palette[3] = color(255, 166, 0, ALPH);
  palette[4] = color(255, 205, 0, ALPH);
  palette[5] = color(255, 130, 0, ALPH);
// Grays
  palette[0] = color(50, 50, 50, ALPH);
  palette[1] = color(75, 75, 75, ALPH);
  palette[2] = color(100, 100, 100, ALPH);
  palette[3] = color(125, 125, 125, ALPH);
  palette[4] = color(150, 150, 150, ALPH);
  palette[5] = color(175, 175, 175, ALPH);
  */
// Blacks
  palette[0] = color(10, 10, 10, ALPH);
  palette[1] = color(20, 20, 20, ALPH);
  palette[2] = color(30, 30, 30, ALPH);
  palette[3] = color(40, 40, 40, ALPH);
  palette[4] = color(50, 50, 50, ALPH);
  palette[5] = color(60, 60, 60, ALPH);
  /*
//  Tropical Water
  palette[0] = color(91, 228, 229, ALPH);
  palette[1] = color(84, 212, 210, ALPH);
  palette[2] = color(83, 197, 192, ALPH);
  palette[3] = color(116, 223, 217, ALPH);
  palette[4] = color(139, 240, 234, ALPH);
  palette[5] = color(134, 212, 203, ALPH);
// Zugspitze
  palette[0] = color(38, 55, 82, ALPH);
  palette[1] = color(60, 86, 120, ALPH);
  palette[2] = color(120, 159, 194, ALPH);
  palette[3] = color(134, 104, 83, ALPH);
  palette[4] = color(97, 69, 51, ALPH);
  palette[5] = color(129, 123, 122, ALPH);

// Colors from H65 collage
  palette[0] = color(43, 76, 98, ALPH);
  palette[1] = color(68, 85, 77, ALPH);
  palette[2] = color(206, 19, 28, ALPH);
  palette[3] = color(109, 114, 99, ALPH);
  palette[4] = color(99, 116, 117, ALPH);
  palette[5] = color(116, 148, 140, ALPH);
  */
}

void initShapes() {
  int which = 0;
  float x = 0;
  float y = 0;
  boolean evenRow = false;
  color c = palette[int(random(6))];
  for (float j = 0; j < height + BASE; j = j + HIGH) {
    for (float k = (0 - (BASE)); k < (width + (BASE / 3)); k = k + (BASE)) {
      x = k;
      if (evenRow == true) {
        x = x + (BASE / 2);
      }
      y = j;
      c = palette[int(random(6))];
      while (adjacentSame(which, c)) {
        c = palette[int(random(6))];
      }
      triangles.add(new EquiTri(BASE, x, y, c, false));   
      which = which + 1;
      c = palette[int(random(6))];
      while (adjacentSame(which, c)) {
        c = palette[int(random(6))];
      }
      triangles.add(new EquiTri(BASE, x, y, c, true));
      which = which + 1;
    }
    evenRow = !(evenRow);
  }
}

boolean adjacentSame(float which, color c) {   
  float acrossCount = (int((width + (2 * BASE)) / BASE)) * 2;
  boolean flag = false;
  if (which >= 1) {
    if ((triangles.get(int((which - 1))).c == c)) {
      flag = true;
    }
  }
  if (which >= acrossCount) {
    if ((triangles.get(int((which - (acrossCount)))).c == c)) {
      flag = true;
    }
  }
  if (which >= acrossCount - 1) {
    if ((triangles.get(int((which - (acrossCount - 1)))).c == c)) {
      flag = true;
    }
  }
  if (which >= acrossCount + 1) {
    if ((triangles.get(int((which - (acrossCount + 1)))).c == c)) {
      flag = true;
    }
  }
  return flag;
}
