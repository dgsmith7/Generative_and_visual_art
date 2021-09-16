class Shape {
  int which;
  color[] colors = new color[4];
  
  Shape(int w) {
//    which = int(random(n));
    which = w;
    this.chooseColors();
  }
  
  void display() {
    switch(which) {
      case 0: fill(colors[0]);
              stroke(colors[0]);
              beginShape();
              vertex(0, 0);
              vertex(0, 1);
              vertex(1, 0);
              endShape(CLOSE);
              fill(colors[1]);
              stroke(colors[1]);
              beginShape();
              vertex(1, 0);
              vertex(3, 0);
              vertex(0, 3);
              vertex(0, 1);
              endShape(CLOSE);
              fill(colors[2]);
              stroke(colors[2]);
              beginShape();
              vertex(3, 0);
              vertex(3, 3);
              vertex(0, 3);
              endShape(CLOSE);
              break;
      case 1: fill(colors[0]);
              stroke(colors[0]);
              beginShape();
              vertex(0, 0);
              vertex(3, 0);
              vertex(0, 3);
              endShape(CLOSE);
              fill(colors[1]);
              stroke(colors[1]);
              beginShape();
              vertex(3, 0);
              vertex(3, 2);
              vertex(2, 3);
              vertex(0, 3);
              endShape(CLOSE);
              fill(colors[2]);
              stroke(colors[2]);
              beginShape();
              vertex(3, 2);
              vertex(3, 3);
              vertex(2, 3);
              endShape(CLOSE);
              break;
      case 2: fill(colors[0]);
              stroke(colors[0]);
              beginShape();
              vertex(0, 0);
              vertex(3, 0);
              vertex(3, 3);
              endShape(CLOSE);
              fill(colors[1]);
              stroke(colors[1]);
              beginShape();
              vertex(0, 0);
              vertex(3, 3);
              vertex(1, 3);
              vertex(0, 2);
              endShape(CLOSE);
              fill(colors[2]);
              stroke(colors[2]);
              beginShape();
              vertex(0, 2);
              vertex(1, 3);
              vertex(0, 3);
              endShape(CLOSE);
              break;
      case 3: fill(colors[0]);
              stroke(colors[0]);
              beginShape();
              vertex(0, 0);
              vertex(3, 3);
              vertex(0, 3);
              endShape(CLOSE);
              fill(colors[1]);
              stroke(colors[1]);
              beginShape();
              vertex(0, 0);
              vertex(2, 0);
              vertex(3, 1);
              vertex(3, 3);
              endShape(CLOSE);
              fill(colors[2]);
              stroke(colors[2]);
              beginShape();
              vertex(2, 0);
              vertex(3, 0);
              vertex(3, 1);
              endShape(CLOSE);
              break;
      case 4: fill(colors[0]);
              stroke(colors[0]);
              beginShape();
              vertex(0, 2);
              vertex(1, 3);
              vertex(0, 3);
              endShape(CLOSE);
              fill(colors[1]);
              stroke(colors[1]);
              beginShape();
              vertex(0, 2);
              vertex(0, 0);
              vertex(2, 0);
              vertex(3, 1);
              vertex(3, 3);
              vertex(1, 3);
              endShape(CLOSE);
              fill(colors[2]);
              stroke(colors[2]);
              beginShape();
              vertex(2, 0);
              vertex(3, 0);
              vertex(3, 1);
              endShape(CLOSE);
              break;
      case 5:fill(colors[0]);
              stroke(colors[0]);
              beginShape();
              vertex(0, 1);
              vertex(2, 3);
              vertex(0, 3);
              endShape(CLOSE);
              fill(colors[1]);
              stroke(colors[1]);
              beginShape();
              vertex(0, 1);
              vertex(0, 0);
              vertex(3, 0);
              vertex(3, 3);
              vertex(2, 3);
              endShape(CLOSE);
              break;
      case 6:fill(colors[0]);
              stroke(colors[0]);
              beginShape();
              vertex(0, 0);
              vertex(0, 2);
              vertex(2, 0);
              endShape(CLOSE);
              fill(colors[1]);
              stroke(colors[1]);
              beginShape();
              vertex(2, 0);
              vertex(3, 0);
              vertex(3, 3);
              vertex(0, 3);
              vertex(0, 2);
              endShape(CLOSE);
              break;
      case 7:fill(colors[0]);
              stroke(colors[0]);
              beginShape();
              vertex(0, 0);
              vertex(0, 1);
              vertex(1, 0);
              endShape(CLOSE);
              fill(colors[1]);
              stroke(colors[1]);
              beginShape();
              vertex(1, 0);
              vertex(3, 0);
              vertex(3, 2);
              vertex(2, 3);
              vertex(0, 3);
              vertex(0, 1);
              endShape(CLOSE);
              fill(colors[2]);
              stroke(colors[2]);
              beginShape();
              vertex(3, 2);
              vertex(3, 3);
              vertex(2, 3);
              endShape(CLOSE);
              break;
      case 8:fill(colors[0]);
              stroke(colors[0]);
              beginShape();
              vertex(0, 0);
              vertex(0, 1);
              vertex(1, 0);
              endShape(CLOSE);
              fill(colors[1]);
              stroke(colors[1]);
              beginShape();
              vertex(0, 1);
              vertex(1, 0);
              vertex(3, 0);
              vertex(0, 3);
              endShape(CLOSE);
              fill(colors[2]);
              stroke(colors[2]);
              beginShape();
              vertex(3, 0);
              vertex(3, 2);
              vertex(2, 3);
              vertex(0, 3);
              endShape(CLOSE);
              fill(colors[3]);
              stroke(colors[3]);
              beginShape();
              vertex(3, 2);
              vertex(3, 3);
              vertex(2, 3);
              endShape(CLOSE);              break;
      case 9:fill(colors[0]);
              stroke(colors[0]);
              beginShape();
              vertex(0, 0);
              vertex(2, 0);
              vertex(3, 1);
              vertex(3, 3);
              endShape(CLOSE);
              fill(colors[1]);
              stroke(colors[1]);
              beginShape();
              vertex(2, 0);
              vertex(3, 0);
              vertex(3, 1);
              endShape(CLOSE);
              fill(colors[2]);
              stroke(colors[2]);
              beginShape();
              vertex(0, 0);
              vertex(3, 3);
              vertex(1, 3);
              vertex(0, 2);
              endShape(CLOSE);
              fill(colors[3]);
              stroke(colors[3]);
              beginShape();
              vertex(0, 2);
              vertex(1, 3);
              vertex(0, 3);
              endShape(CLOSE);
              break;
      case 10:fill(colors[0]);
              stroke(colors[0]);
              beginShape();
              vertex(0, 0);
              vertex(3, 0);
              vertex(3, 3);
              vertex(0, 3);
              vertex(1.5, 1.5);
              endShape(CLOSE);
              fill(colors[1]);
              stroke(colors[1]);
              beginShape();
              vertex(0, 0);
              vertex(1.5, 1.5);
              vertex(0, 3);
              endShape(CLOSE);
              break;
      case 11:fill(colors[0]);
              stroke(colors[0]);
              beginShape();
              vertex(0, 0);
              vertex(3, 0);
              vertex(1.5, 1.5);
              vertex(3, 3);
              vertex(0, 3);
              endShape(CLOSE);
              fill(colors[1]);
              stroke(colors[1]);
              beginShape();
              vertex(3, 0);
              vertex(1.5, 1.5);
              vertex(3, 3);
              endShape(CLOSE);
              break;
      case 12:fill(colors[0]);
              stroke(colors[0]);
              beginShape();
              vertex(0, 0);
              vertex(3, 0);
              vertex(3, 1);
              vertex(1, 3);
              vertex(0, 3);
              endShape(CLOSE);
              fill(colors[1]);
              stroke(colors[1]);
              beginShape();
              vertex(3, 1);
              vertex(3, 3);
              vertex(1, 3);
              endShape(CLOSE);
              break;
      case 13:fill(colors[0]);
              stroke(colors[0]);
              beginShape();
              vertex(0, 0);
              vertex(1, 0);
              vertex(3, 2);
              vertex(3, 3);
              vertex(0, 3);
              endShape(CLOSE);
              fill(colors[1]);
              stroke(colors[1]);
              beginShape();
              vertex(1, 0);
              vertex(3, 0);
              vertex(3, 2);
              endShape(CLOSE);
              break;
      case 14:
              break;
      case 15:
              break;
      case 16:
              break;
      case 17:
              break;
      case 18:
              break;
      case 19:
              break;
      case 20:
              break;
      case 21:
              break;
      case 22:
              break;
      case 23:
              break;
      case 24:
              break;
      case 25:
              break;
      case 26:
              break;
      case 27:
              break;
      case 28:
              break;
      case 29:
              break;
      case 30:
              break;
      case 31:
              break;
      case 32:
              break;
      case 33:
              break;
      case 34:
              break;
      case 35:
              break;
      case 36:
              break;
      case 37:
              break;
      case 38:
              break;
      case 39:
              break;
      case 40:
              break;
      case 41:
              break;
      case 42:
              break;
      case 43:
              break;
    }
  }
  
  void chooseColors() {
    for (int i = 0; i < 4; i ++) {
      switch (int(random(6))) {
        case 0: colors[i] = color(222, 120, 18);
                break;
        case 1: colors[i] = color(237, 149, 34); 
                break;
        case 2: colors[i] = color(14, 90, 79); 
                break;
        case 3: colors[i] = color(15, 183, 142); 
                break;
        case 4: colors[i] = color(196, 237, 220); 
                break;
        default: colors[i] = color(10, 70, 45); 
                 break;
      }
    }
  }
}
