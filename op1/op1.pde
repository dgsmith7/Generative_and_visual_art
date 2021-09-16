Widget w1;
Widget[] allWidgets = new Widget[100];

void setup() {
  size(700, 700);
  background(125);
  w1 = new Widget();
  w1.xPosit = 500;
  w1.yPosit = 500;
  initWidgets();
  noLoop();
}

void draw() {
//  w1.display();
 for (int i = 0; i < 100; i ++) {
   allWidgets[i].display();
 } 
//println("x = " + (0 + cos(radians(330)) * 100) + 
//        " y = " + (0 + sin(radians(330)) * 100));
//println("x = " + ((0 + cos(radians(330)) * 100) + (cos(radians(240)) * 50)) +
//        " y = " + ((0 + sin(radians(330)) * 100) + (sin(radians(240)) * 50)));
//println("x = " + (0 + cos(radians(270)) * 50) + 
//        " y = " + (0 + sin(radians(270)) * 50));
}

void initWidgets() {
  int counter = 0;
  color tc = color(#FF0000);
  color lc = color(#00FF00);
  color rc = color(#0000FF);
  for (int i = 0; i < 10; i ++) {
    for (int j = 0; j < 10; j ++) {
      allWidgets[counter] = new Widget(i * 45, j * 45 + ((i%2)*22), 45, tc, lc, rc);
      counter ++;
    }
  }
}