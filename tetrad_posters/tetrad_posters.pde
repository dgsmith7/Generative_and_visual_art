/************************************
* Produces Josef Albers Tetrad Poster
* 
* By David G. Smith, March 2016
*******************************/

float bigSquareSize;
float smallSquareSize;
Color_Field[] allColorFields = new Color_Field[16];

void setup() {
  size(1000, 700);
  colorMode(HSB, 100);
  bigSquareSize = (((width / 2) - 25) / 2.5);
  smallSquareSize = bigSquareSize / 2;
  initGUIControls();
  initColorFields();
  println(cp5.getController("hue1Slider").getColor());
}

void draw() {
  background(40);
  populateColors();
  for (Color_Field i: allColorFields) {
    i.display();
  }
  cp5.getController("hue1Slider").setVisible(true);
  cp5.getController("hue2Slider").setVisible(true);
  cp5.getController("baseSaturationSlider").setVisible(true);
  cp5.getController("baseValueSlider").setVisible(true);
  saveFrame("frame-####.png");
}

void initColorFields() {
  // Left Side
// Big squares
  allColorFields[0] = new Color_Field(smallSquareSize, 50, bigSquareSize);  // upper left
  allColorFields[1] = new Color_Field(smallSquareSize, 50 + bigSquareSize, bigSquareSize);  // lower left
  allColorFields[2] = new Color_Field(smallSquareSize + bigSquareSize, 50, bigSquareSize);  // upper right
  allColorFields[3] = new Color_Field(smallSquareSize + bigSquareSize, 50 + bigSquareSize, bigSquareSize);  // lower right
// Small squares
  allColorFields[4] = new Color_Field(smallSquareSize + smallSquareSize, 50 + smallSquareSize, smallSquareSize); // upper left
  allColorFields[5] = new Color_Field(smallSquareSize + smallSquareSize, 50 + bigSquareSize, smallSquareSize); // lower left
  allColorFields[6] = new Color_Field(smallSquareSize + bigSquareSize, 50 + smallSquareSize, smallSquareSize); // upper right
  allColorFields[7] = new Color_Field(smallSquareSize + bigSquareSize, 50 + bigSquareSize, smallSquareSize); // lower right
// Right side
// Big squares
  allColorFields[8] = new Color_Field((width - (smallSquareSize + (2 * bigSquareSize))), 50, bigSquareSize);  // upper left
  allColorFields[9] = new Color_Field((width - (smallSquareSize + (2 * bigSquareSize))), 50 + bigSquareSize, bigSquareSize);  // lower left
  allColorFields[10] = new Color_Field((width - (smallSquareSize + (2 * bigSquareSize))) + bigSquareSize, 50, bigSquareSize);  // upperright
  allColorFields[11] = new Color_Field((width - (smallSquareSize + (2 * bigSquareSize))) + bigSquareSize, 50 + bigSquareSize, bigSquareSize);  // lower right
// Small squares
  allColorFields[12] = new Color_Field((width - (smallSquareSize + (2 * bigSquareSize))) + smallSquareSize, 50 + smallSquareSize, smallSquareSize); // upper left
  allColorFields[13] = new Color_Field((width - (smallSquareSize + (2 * bigSquareSize))) + smallSquareSize, 50 + bigSquareSize, smallSquareSize); // lower left
  allColorFields[14] = new Color_Field((width - (smallSquareSize + (2 * bigSquareSize))) + bigSquareSize, 50 + smallSquareSize, smallSquareSize); // upper right
  allColorFields[15] = new Color_Field((width - (smallSquareSize + (2 * bigSquareSize))) + bigSquareSize, 50 + bigSquareSize, smallSquareSize); // lower right
}

void populateColors() {
  float hue = cp5.getController("hue1Slider").getValue();
  float hue2 = cp5.getController("hue2Slider").getValue();
  float sat = cp5.getController("baseSaturationSlider").getValue();
  float val = cp5.getController("baseValueSlider").getValue();
  // Left Side
  // Large
  // Upper left
  allColorFields[0].c = color(hue, sat, val);
  // Lower left
  allColorFields[1].c = color(hue, sat * 0.85, val * 0.90);
  // Upper right
  allColorFields[2].c = color(hue, sat * 0.65, val * 0.80);
  // Lower right
  allColorFields[3].c = color(hue, sat * 0.45, val * 0.70);
  // Small
  // Upper left
  allColorFields[4].c = color(hue2, sat, val);
  // Lower left
  allColorFields[5].c = color(hue2, sat * 0.85, val * 0.90);
  // Upper right
  allColorFields[6].c = color(hue2, sat * 0.65, val * 0.80);
  // Lower right
  allColorFields[7].c = color(hue2, sat * 0.45, val * 0.70);
  // Right side
  // Large
  // Upper left
  allColorFields[8].c = allColorFields[4].c;
  // Lower left
  allColorFields[9].c = allColorFields[5].c;
  // Upper right
  allColorFields[10].c = allColorFields[6].c;
  // Lower right
  allColorFields[11].c = allColorFields[7].c;
  //Small
  // Upper left
  allColorFields[12].c = allColorFields[0].c;
  // Lower left
  allColorFields[13].c = allColorFields[1].c;
  // Upper right
  allColorFields[14].c = allColorFields[2].c;
  // Lower right
  allColorFields[15].c = allColorFields[3].c;
}

void keyPressed() {
  /****************
  cp5.getController("hue1Slider").setVisible(false);
  cp5.getController("hue2Slider").setVisible(false);
  cp5.getController("baseSaturationSlider").setVisible(false);
  cp5.getController("baseValueSlider").setVisible(false);
  save("Tetrad2.png");
  exit();
  *****************/
}