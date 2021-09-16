/*
   
 these values for future MESS and Classic99 emulation:
 1 - Black (#000000)
 2 - Medium Green (#46B83C)
 3 - Light Green (#7CCF70)
 4 - Dark Blue (#5D4DFF)
 5 - Light Blue (#7F71FF)
 6 - Dark Red (#B66247)
 7 - Cyan (#5CC7EE)
 8 - Medium Red (#D86B48)
 9 - Light Red (#FB8F6C)
 10 (A) - Dark Yellow (#C3CE42)
 11 (B) - Light Yellow (#D3DB77)
 12 (C ) - Dark Green (#3EA030)
 13 (D) - Magenta (#B664C6)
 14 (E) - Gray (#CDCDCD)
 15 (F) - White (#FFFFFF)
 
 The TMS9928A colors are as follows
 (0.47 saturation level)
 1 - Black (#000000)
 2 - Medium Green (#44B54E)
 3 - Light Green (#79CEEA)
 4 - Dark Blue (#5B56D7)
 5 - Light Blue (#8178EA)
 6 - Dark Red (#B56054)
 7 - Cyan (#6CDAEC)
 8 - Medium Red (#D5685D)
 9 - Light Red (#F98C81)
 10 (A) - Dark Yellow (#CCC366)
 11 (B) - Light Yellow (#DED18D)
 12 (C ) - Dark Green (#3F9F45)
 13 (D) - Magenta (#B469B2)
 14 (E) - Gray (#CDCDCD)
 15 (F) - White (#FFFFFF)
 
 */

int[] colors1 = {#000000, #46B83C, #7CCF70, #5D4DFF, 
  #7F71FF, #B66247, #5CC7EE, #D86B48, 
  #FB8F6C, #C3CE42, #D3DB77, #3EA030, 
  #B664C6, #CDCDCD, #FFFFFF};
int[] colors2 =  {#000000, #44B54E, #79CEEA, #5B56D7, 
  #8178EA, #B56054, #6CDAEC, #D5685D, 
  #F98C81, #CCC366, #DED18D, #3F9F45, 
  #B469B2, #CDCDCD, #FFFFFF};
int[] colors3 =  {#000000, #00CC00, #00FF00, #000099, 
  #3399ff, #CC0000, #00FFFF, #FF0000, 
  #FF3333, #FFFF00, #FFFF66, #009900, 
  #990000, #CDCDCD, #FFFFFF};
String[] names = {"Black", "Medium Green", "Light Green", "Dark Blue", 
  "Light Blue", "Dark Red", "Cyan", "Medium Red", 
  "Light Red", "Dark Yellow", "Light Yellow", "Dark Green", 
  "Magenta", "Gray", "White"};

int whichSet = 1;
int back = 1;
int front = 2;


void setup() {
  size(525, 525);
  background(#7d7d7d);
  noStroke();
  textAlign(CENTER);
}

void draw() {
  int counter = 0;
  for (int i = 0; i < 4; i ++) {
    for (int j = 0; j < 4; j ++) {
      // choose color
      if (counter < 15) {      
        switch (whichSet) {
        case 1:
          fill(color(colors1[counter]));
          rect(j * 125 + 25, i * 125 + 25, 100, 100);
          // draw combo
          fill(color(colors1[back]));
          rect(400, 400, 100, 100);
          fill(color(colors1[front]));
          rect(425, 425, 50, 50);
          break;
        case 2:
          fill(color(colors2[counter]));
          rect(j * 125 + 25, i * 125 + 25, 100, 100);
          // draw combo
          fill(color(colors2[back]));
          rect(400, 400, 100, 100);
          fill(color(colors2[front]));
          rect(425, 425, 50, 50);
          break;
        case 3:
          fill(color(colors3[counter]));
          rect(j * 125 + 25, i * 125 + 25, 100, 100);
          // draw combo
          fill(color(colors3[back]));
          rect(400, 400, 100, 100);
          fill(color(colors3[front]));
          rect(425, 425, 50, 50);
          break;
        default:
          break;
        }
        // draw swatch and label it
        fill(0);
        text(names[counter], j * 125 + 75, i * 125 + 140);
        counter++;
      }
    }
  }
}

void keyPressed() {
  whichSet ++;
  if (whichSet == 4) whichSet = 1;
}

void mouseClicked() {
  int whichBlock = ((4 * ((mouseY - 25) / 125)) + ((mouseX - 25) / 125));
  println(whichBlock);
    if (mouseButton == LEFT) {
      back = whichBlock;
    }
    if (mouseButton == RIGHT) {
      front = whichBlock;
    }
  println(back, front);
}
