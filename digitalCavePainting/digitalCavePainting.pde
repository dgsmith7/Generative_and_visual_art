//  How does digital man "paint a cave wall" like paleo man did so long ago?  
//  What do we share?  We both have the same hands.

BufferedReader reader;
String line;
char[][] gridValues = new char[28][76];
// 76 x 28
// 10 x 20 multipliers

void setup() {
  size(760, 560);
  reader = createReader("digitalCavePainting.txt");
  parseFile();
  ellipseMode(CORNER);
  noStroke();
  noLoop();
}

void draw() {
  background(255);
  drawMarks();
}

void parseFile() {
  int lCount = 0;
  boolean end = false;
  while (!end) {
    try {
      line = reader.readLine();
    } 
    catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    if (line != null) {
      for (int i = 0; i < line.length(); i ++) {
        gridValues[lCount][i] = line.charAt(i);
      }
      lCount ++;
    } else {
      end = true;
    }
  }
}

void drawMarks() {
  for (int i = 0; i < 28; i ++) {
    for (int j = 0; j < 76; j ++) {
      if (gridValues[i][j] == '0') {
        fill(0);
      } else {
        fill(125);
      }
      ellipse(j * 10, i*20, 10, 15);
    }
  }
}
