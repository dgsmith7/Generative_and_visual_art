/******************************
*  Demonstrates LeBron layer affect with transparent colors
*  David G. Smith - Mar 2016
******************************/

final int ALPH = 50;  // opacity of color (0 least - 255 most)
color[] colorSet = new color[4];
float fieldSize = 0;
ColorField[] allFields = new ColorField[4];
String[] colorNames = {"Cyan", "Magenta", "Yellow", "Black"};
int currentColorIndex = 0;

void setup () {
  size (800, 800);
  fieldSize = min(width, height) / 9;
  noLoop ();
  noStroke();
  initColorArray ();
  initFields();
} 

void draw () {
  for (int i = 0; i < 4; i ++) {
    for (int j = 0; j < i; j ++) {
      switchColors();
    }
    for (int k = 0; k < 4; k ++) {
      allFields[k].y = (i * (fieldSize * 2)) + fieldSize;
    }
    drawFirstLayer();
    switchColors();
    drawSecondLayer();
    switchColors();
    drawThirdLayer();
    switchColors();
    drawFourthLayer();
    switchColors();
  }
}

void initColorArray () { 
  colorSet[0] = color(0, 255, 255, ALPH);  // Cyan
  colorSet[1] = color(255, 0, 255, ALPH);  // Magenta
  colorSet[2] = color(255, 255, 0, ALPH);  // Yellow
  colorSet[3] = color(0, 0, 0, ALPH);  // Black
}

void initFields() {
  float x;
  float y;
  for (int i = 0; i < 4; i ++) {
    x = (i * (fieldSize * 2)) + fieldSize;
    y = fieldSize;
    allFields[i] = new ColorField(x, y, fieldSize, colorSet[currentColorIndex]);
  }
}

void drawFirstLayer() {
  for (int i = 0; i < 4; i++) {
      allFields[i].display();
      fill(25, 255);
      text(colorNames[currentColorIndex], allFields[i].x + 5, allFields[i].y + fieldSize - 5);
      fill(allFields[i].c);
  }
}

void drawSecondLayer() {
  for (int i = 1; i < 4; i++) {
      allFields[i].display();
      fill(25, 255);
      text(colorNames[currentColorIndex], allFields[i].x + 5, allFields[i].y + fieldSize - 20);
      fill(allFields[i].c);
  }
}

void drawThirdLayer() {
  for (int i = 2; i < 4; i++) {
      allFields[i].display();
      fill(25, 255);
      text(colorNames[currentColorIndex], allFields[i].x + 5, allFields[i].y + fieldSize - 35);
      fill(allFields[i].c);
  }  
}

void drawFourthLayer() {
  for (int i = 3; i < 4; i++) {
      allFields[i].display();
      fill(25, 255);
      text(colorNames[currentColorIndex], allFields[i].x + 5, allFields[i].y + fieldSize - 50);
      fill(allFields[i].c);
  }
}

void switchColors() {
  currentColorIndex = currentColorIndex + 1;
  if (currentColorIndex == 4) {
    currentColorIndex = 0;
  }
  for (int i = 0; i < 4; i ++) {
    allFields[i].c = colorSet[currentColorIndex];
  }
}