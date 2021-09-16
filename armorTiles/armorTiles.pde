import processing.pdf.*;

int rows = 13;
int cols = 11;
int[][] grid = new int[rows][cols];  // for 18x18
//int[][] grid = new int[6][5];    // for 22x28
Tile[] tiles = new Tile[16];
String dataFile = "a4.json";
int counter = 0;

// generate 12 pdfs
// or generate a ton of pdfs and pick 12 that you like

void setup() {
//  testConnections();
//  initGrid();  // for 18x18
initGrid(rows, cols);
//  initGridMetal();   // for 22x28
//  setAllGrid();
  consoleGrid();
  size(4950, 5850, PDF, "BigGrid1.pdf");  // 450 x rows, 450 x cols
//  size(2250, 2700, PDF, "metalGrid.pdf");//  for 22x28
//  size(450, 450);
  strokeWeight(13);
  strokeCap(SQUARE);
  parseTileData();
  noLoop();
}

void draw() {
  background(255);
//  tiles[0].display(0, 0);
  displayGrid();  // for 18x18
//  displayGridMetal();   // for 22x28
  exit();
}

void testConnections() {
  for (int i = 0; i < 16; i ++) {
    print(i + " can connectLR with ");
    for (int j = 0; j < 16; j ++) {
      if ((i != j) && (connectsLR(i, j) == true)) {
        print(j + " ");
      }
    }
    println();
    print(i + " can connectTB with ");
    for (int j = 0; j < 16; j ++) {
      if ((i != j) && (connectsTB(i, j) == true)) {
        print(j + " ");
      }
    }
    println();
  }
}

void initGrid() {
  grid[0][0] = int(random(16));
  grid[0][1] = int(random(16));
  while (connectsLR(grid[0][0], grid[0][1]) == false) {
    grid[0][1] = int(random(16));
  }
  grid[0][2] = int(random(16));
  while (connectsLR(grid[0][1], grid[0][2]) == false) {
    grid[0][2] = int(random(16));
  }
  grid[0][3] = int(random(16));
  while (connectsLR(grid[0][2], grid[0][3]) == false) {
    grid[0][3] = int(random(16));
  }
  grid[1][0] = int(random(16));
  while (connectsTB(grid[0][0], grid[1][0]) == false) {
    grid[1][0] = int(random(16));
  }
  grid[1][1] = int(random(16));
  while ((connectsTB(grid[0][1], grid[1][1]) == false) || (connectsLR(grid[1][0], grid[1][1]) == false)) {
    grid[1][1] = int(random(16));
  }
  grid[1][2] = int(random(16));
  while ((connectsTB(grid[0][2], grid[1][2]) == false) || (connectsLR(grid[1][1], grid[1][2]) == false)) {
    grid[1][2] = int(random(16));
  }
  grid[1][3] = int(random(16));
  while ((connectsTB(grid[0][3], grid[1][3]) == false) || (connectsLR(grid[1][2], grid[1][3]) == false)) {
    grid[1][3] = int(random(16));
  }
  grid[2][0] = int(random(16));
  while (connectsTB(grid[1][0], grid[2][0]) == false) {
    grid[2][0] = int(random(16));
  }
  grid[2][1] = int(random(16));
  while ((connectsTB(grid[1][1], grid[2][1]) == false) || (connectsLR(grid[2][0], grid[2][1]) == false)) {
    grid[2][1] = int(random(16));
  }
  grid[2][2] = int(random(16));
  while ((connectsTB(grid[1][2], grid[2][2]) == false) || (connectsLR(grid[2][1], grid[2][2]) == false)) {
    grid[2][2] = int(random(16));
  }
  grid[2][3] = int(random(16));
  while ((connectsTB(grid[1][3], grid[2][3]) == false) || (connectsLR(grid[2][2], grid[2][3]) == false)) {
    grid[2][3] = int(random(16));
  }
  grid[3][0] = int(random(16));
  while (connectsTB(grid[2][0], grid[3][0]) == false) {
    grid[3][0] = int(random(16));
  }
  grid[3][1] = int(random(16));
  while ((connectsTB(grid[2][1], grid[3][1]) == false) || (connectsLR(grid[3][0], grid[3][1]) == false)) {
    grid[3][1] = int(random(16));
  }
  grid[3][2] = int(random(16));
  while ((connectsTB(grid[2][2], grid[3][2]) == false) || (connectsLR(grid[3][1], grid[3][2]) == false)) {
    grid[3][2] = int(random(16));
  }
  grid[3][3] = int(random(16));
  while ((connectsTB(grid[2][3], grid[3][3]) == false) || (connectsLR(grid[3][2], grid[3][3]) == false)) {
    grid[3][3] = int(random(16));
  }
}

void initGridMetal() {
  grid[0][0] = int(random(16));
  grid[0][1] = int(random(16));
  while (connectsLR(grid[0][0], grid[0][1]) == false) {
    grid[0][1] = int(random(16));
  }
  grid[0][2] = int(random(16));
  while (connectsLR(grid[0][1], grid[0][2]) == false) {
    grid[0][2] = int(random(16));
  }
  grid[0][3] = int(random(16));
  while (connectsLR(grid[0][2], grid[0][3]) == false) {
    grid[0][3] = int(random(16));
  }
  
  grid[0][4] = int(random(16));
  while (connectsLR(grid[0][3], grid[0][4]) == false) {
    grid[0][4] = int(random(16));
  }
  
  grid[1][0] = int(random(16));
  while (connectsTB(grid[0][0], grid[1][0]) == false) {
    grid[1][0] = int(random(16));
  }
  grid[1][1] = int(random(16));
  while ((connectsTB(grid[0][1], grid[1][1]) == false) || (connectsLR(grid[1][0], grid[1][1]) == false)) {
    grid[1][1] = int(random(16));
  }
  grid[1][2] = int(random(16));
  while ((connectsTB(grid[0][2], grid[1][2]) == false) || (connectsLR(grid[1][1], grid[1][2]) == false)) {
    grid[1][2] = int(random(16));
  }
  grid[1][3] = int(random(16));
  while ((connectsTB(grid[0][3], grid[1][3]) == false) || (connectsLR(grid[1][2], grid[1][3]) == false)) {
    grid[1][3] = int(random(16));
  }
  
    grid[1][4] = int(random(16));
  while ((connectsTB(grid[0][4], grid[1][4]) == false) || (connectsLR(grid[1][3], grid[1][4]) == false)) {
    grid[1][4] = int(random(16));
  }

  grid[2][0] = int(random(16));
  while (connectsTB(grid[1][0], grid[2][0]) == false) {
    grid[2][0] = int(random(16));
  }
  grid[2][1] = int(random(16));
  while ((connectsTB(grid[1][1], grid[2][1]) == false) || (connectsLR(grid[2][0], grid[2][1]) == false)) {
    grid[2][1] = int(random(16));
  }
  grid[2][2] = int(random(16));
  while ((connectsTB(grid[1][2], grid[2][2]) == false) || (connectsLR(grid[2][1], grid[2][2]) == false)) {
    grid[2][2] = int(random(16));
  }
  grid[2][3] = int(random(16));
  while ((connectsTB(grid[1][3], grid[2][3]) == false) || (connectsLR(grid[2][2], grid[2][3]) == false)) {
    grid[2][3] = int(random(16));
  }

    grid[2][4] = int(random(16));
  while ((connectsTB(grid[1][4], grid[2][4]) == false) || (connectsLR(grid[2][3], grid[2][4]) == false)) {
    grid[2][4] = int(random(16));
  }

  grid[3][0] = int(random(16));
  while (connectsTB(grid[2][0], grid[3][0]) == false) {
    grid[3][0] = int(random(16));
  }
  grid[3][1] = int(random(16));
  while ((connectsTB(grid[2][1], grid[3][1]) == false) || (connectsLR(grid[3][0], grid[3][1]) == false)) {
    grid[3][1] = int(random(16));
  }
  grid[3][2] = int(random(16));
  while ((connectsTB(grid[2][2], grid[3][2]) == false) || (connectsLR(grid[3][1], grid[3][2]) == false)) {
    grid[3][2] = int(random(16));
  }
  grid[3][3] = int(random(16));
  while ((connectsTB(grid[2][3], grid[3][3]) == false) || (connectsLR(grid[3][2], grid[3][3]) == false)) {
    grid[3][3] = int(random(16));
  }

  grid[3][4] = int(random(16));
  while ((connectsTB(grid[2][4], grid[3][4]) == false) || (connectsLR(grid[3][3], grid[3][4]) == false)) {
    grid[3][4] = int(random(16));
  }

  grid[4][0] = int(random(16));
  while (connectsTB(grid[3][0], grid[4][0]) == false) {
    grid[4][0] = int(random(16));
  }
  grid[4][1] = int(random(16));
  while ((connectsTB(grid[3][1], grid[4][1]) == false) || (connectsLR(grid[4][0], grid[4][1]) == false)) {
    grid[4][1] = int(random(16));
  }
  grid[4][2] = int(random(16));
  while ((connectsTB(grid[3][2], grid[4][2]) == false) || (connectsLR(grid[4][1], grid[4][2]) == false)) {
    grid[4][2] = int(random(16));
  }
  grid[4][3] = int(random(16));
  while ((connectsTB(grid[3][3], grid[4][3]) == false) || (connectsLR(grid[4][2], grid[4][3]) == false)) {
    grid[4][3] = int(random(16));
  }
  grid[4][4] = int(random(16));
  while ((connectsTB(grid[3][4], grid[4][4]) == false) || (connectsLR(grid[4][3], grid[4][4]) == false)) {
    grid[4][4] = int(random(16));
  }
  grid[5][0] = int(random(16));
  while (connectsTB(grid[4][0], grid[5][0]) == false) {
    grid[5][0] = int(random(16));
  }
  grid[5][1] = int(random(16));
  while ((connectsTB(grid[4][1], grid[5][1]) == false) || (connectsLR(grid[5][0], grid[5][1]) == false)) {
    grid[5][1] = int(random(16));
  }
  grid[5][2] = int(random(16));
  while ((connectsTB(grid[4][2], grid[5][2]) == false) || (connectsLR(grid[5][1], grid[5][2]) == false)) {
    grid[5][2] = int(random(16));
  }
  grid[5][3] = int(random(16));
  while ((connectsTB(grid[4][3], grid[5][3]) == false) || (connectsLR(grid[5][2], grid[5][3]) == false)) {
    grid[5][3] = int(random(16));
  }
  grid[5][4] = int(random(16));
  while ((connectsTB(grid[4][4], grid[5][4]) == false) || (connectsLR(grid[5][3], grid[5][4]) == false)) {
    grid[5][4] = int(random(16));
  }
}

void initGrid(int nRows, int nColumns) {
  for (int r = 0; r < nRows; r++) {
    for(int c = 0; c < nColumns; c++) {
      grid[r][c] = int(random(16));
        if (r == 0 && c > 0) {
            while (connectsLR(grid[r][c-1], grid[r][c]) == false) {
              grid[r][c] = int(random(16));
            }
        } else if (r > 0 && c == 0) {
            while (connectsTB(grid[r-1][c], grid[r][c]) == false) {
              grid[r][c] = int(random(16));
            }
        } else if (r > 0  && c > 0) {
            while ((connectsTB(grid[r-1][c], grid[r][c]) == false) || (connectsLR(grid[r][c-1], grid[r][c]) == false)) {
              grid[r][c] = int(random(16));
            }
        }      
    }
  }
}

void setAllGrid() {
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j ++) {
      grid[i][j] = (i*4) + j;
    }
  }
}

void consoleGrid() {
  for (int i = 0; i < rows; i ++) {
    for (int j = 0; j < cols; j ++) {
      print(grid[i][j] + " ");
    }
    println();
  }
}

boolean connectsLR(int onLeft, int possibleVal) {
  String binOnLeft = binary(onLeft, 4);
  String binPoss = binary(possibleVal, 4);
  if (binOnLeft.charAt(1) == (binPoss.charAt(3))) {
//    println(binOnLeft + "  " + binPoss + " can connect");
    return true;
  } else {
  return false;
  }
}

boolean connectsTB(int above, int possibleVal) {
  String binAbove = binary(above, 4);
  String binPoss = binary(possibleVal, 4);
  if (binAbove.charAt(2) == (binPoss.charAt(0))) {
//    println(binAbove + "  " + binPoss + " can connect");
    return true;
  } else {
  return false;
  }
}


void parseTileData() {
  JSONArray tileData;
  tileData = loadJSONArray(dataFile);
  ArrayList<String> lines = new ArrayList<String>();
  for (int i = 0; i < tileData.size(); i++) {
    JSONObject t = tileData.getJSONObject(i); 
    int value = t.getInt("val");
    JSONArray lineArray = t.getJSONArray("lines");
    for (int j = 0; j < lineArray.size(); j ++) {
      String s = lineArray.getJSONObject(j).getString("verticies"); // get the next string in the JSON array
      lines.add(s);
    }
    tiles[i] = new Tile(buildShape(lines), value);
    // empty arraylist
    for (int k = lines.size() - 1; k >= 0; k--) {
      lines.remove(k);
    }
  }
}

PShape buildShape(ArrayList<String> lines) {
  PShape l;
  l = createShape(GROUP);
  for (int i = 0; i < lines.size(); i ++) {
    String[] verticies = split(lines.get(i), ","); /// parse string into array of values
    PShape p = createShape();
    p.beginShape();
    p.noFill();
    if ((verticies.length >= 2) && (verticies.length%2 == 0)) {
      for (int j = 0; j < verticies.length; j = j + 2) {
        p.vertex(parseInt(verticies[j])*28, parseInt(verticies[j+1])*28);
      }
    }
    p.endShape(OPEN);
    l.addChild(p);
  } 
  return l;
}

void displayGrid() {
  for (int i = 0; i < rows; i ++) {
    for (int j = 0; j < cols; j ++) {
      tiles[grid[i][j]].display(450*j, 450*i);
    }
  }
}

void displayGridMetal() {
  for (int i = 0; i < 6; i ++) {
    for (int j = 0; j < 5; j ++) {
      tiles[grid[i][j]].display(450*j, 450*i);
    }
  }
}
