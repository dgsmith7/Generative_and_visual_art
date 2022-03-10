int tileSize = 50;
float gap = (sqrt(3)/2) * tileSize;
int horizontal = 1000;
int vertical = 700;
Tile[] allTiles = new Tile[(round(horizontal/gap) * round(vertical/(tileSize * .75)))];
color paintC;


void setup() {
  size(1000, 700);
  background(125);
  initTiles();
//  noLoop();
}

void draw() {
background(125);
  for (int i = 0; i < allTiles.length; i ++) {
    allTiles[i].display();
  }
}

void initTiles() {
  int counter = 0;
  for (int i = 0; i < round(1000/gap); i ++) {
    for (int j = 0; j < round(700/(tileSize * .75)); j ++) {
      if ((j % 2) == 0) {
        allTiles[counter] = new Tile(i * gap + (gap*.5), (j) * (tileSize * .75), tileSize/2 , color(random(255), random(255), random(255), 125));
      }
      else {
        allTiles[counter] = new Tile(i * gap, (j) * (tileSize * .75), tileSize/2 , color(random(255), random(255), random(255), 125));
      }
    counter ++;
    }
  }
}

int checkWhich() {
  int which = 0;
  for (int i = 0; i < allTiles.length; i ++) {
    if (allTiles[i].isTouching(mouseX, mouseY) == true) {
      which = i;
    }
  }
  return which;
}

void mouseClicked() {
  int index = checkWhich();
//  if ((index == 0) || (index == allTiles.length -1)) {
  if ((keyPressed == true) && (keyCode == SHIFT)) {
  paintC = allTiles[index].c;
  }
  else {
    allTiles[index].c = paintC;
    allTiles[index].display();
  }
}