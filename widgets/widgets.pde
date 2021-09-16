Widget w1, w2, w3, w4, w5, w6;
ArrayList<Widget> allWidgets = new ArrayList<Widget>();

void setup() {
  size(1200, 700);
  background(255);
  w1 = new Widget();
  w2 = new Widget();
  w3 = new Widget();
  w4 = new Widget();
  w5 = new Widget();
  w6 = new Widget();
  initWidgets();
  noLoop();
}

void draw() {
  int widgetIndex = 0;
  //displayWidget(w1, 250, 250);
  //displayWidget(w2, 314, 213);
  //displayWidget(w3, 378, 250);
  //displayWidget(w4, 442, 213);
  //displayWidget(w5, 314, 288);
  //displayWidget(w6, 442, 288);
  //// step 128 in x, step 75 in y 
  //displayWidget(w1,  0, 0);
  //displayWidget(w2, 64, -37);
  //displayWidget(w3, 128, 0);
  //displayWidget(w4, 192, -37);
  //displayWidget(w5, 64, 38);
  //displayWidget(w6, 192, 38);
  for (float x = 0; x < width + 50; x = x + 128) {
    for (float y = 0; y < height + 25; y = y + 75) {
      Widget w = allWidgets.get(widgetIndex);
      displayWidget(w, x, y);
      widgetIndex++;
    }
  }
  for (float x = 64; x < width + 50; x = x + 128) {
    for (float y = -37; y < height + 25; y = y + 75) {
      Widget w = allWidgets.get(widgetIndex);
      displayWidget(w, x, y);
      widgetIndex++;
    }
  }  
  saveFrame("widgetPage.png");
}

void initWidgets() {
  for (float x = 0; x < width + 50; x = x + 128) {
    for (float y = 0; y < height + 25; y = y + 75) {
      allWidgets.add(new Widget());
    }
  }
  for (float x = 64; x < width + 50; x = x + 128) {
    for (float y = -37; y < height + 25; y = y + 75) {
      allWidgets.add(new Widget());
    }
  }
}

void displayWidget(Widget w, float x, float y) {
  pushMatrix();
  translate(x, y);
  w.c = color(25, 100, 100);
  w.display();
  rotate(radians(120));
  w.c = color(0, 255, 0);
  w.display();
  rotate(radians(120));
  w.c = color(0, 0, 255);
  w.display();
  popMatrix();
}

void mouseClicked() {
  print(mouseX + "  " + mouseY);
}
