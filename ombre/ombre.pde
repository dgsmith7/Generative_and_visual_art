float arrayOne[] = new float[10000];
float tempArray[] = new float[2500];

void setup() {
  noLoop();
  initArrayOne();
  size(100, 100);
  background(100);
}

void draw() {
  fillScreen();
  reversePixels();
  fillScreen();
}

void initArrayOne() {
  for (int i = 0; i < 10000; i ++) {
    arrayOne[i] = map(i, 0, 10000, 0, 255);
  }
}

void fillScreen() {
  int x = 0;
  int y = 0;
  for (int i = 0; i < 10000; i ++) {
    stroke(50, 100, arrayOne[i]);
    point(x, y);
    print(x + " " + y + "   ");
    x++;
    if (x == 100) {
      x = 0;
      y++;
    }
  }
}

void reversePixels() {
  int x = 25; 
  int y = 25;
  for(int i = 0; i < 2500; i ++) {
    tempArray[i] = arrayOne[(y*100)+x];
    x++;
    if (x == 75) {
      x = 25;
      y++;
    }
  }
  
  x = 25; 
  y = 25;
  for(int i = 0; i < 2500; i ++) {
    arrayOne[(y*100)+x] = tempArray[2499 - i];
    x++;
    if (x == 75) {
      x = 25;
      y++;
    }
  }

}
