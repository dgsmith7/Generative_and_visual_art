int nSeeds = 10;
PVector[] allSeeds = new PVector[nSeeds];
PVector[] centroids = new PVector[nSeeds];
color[] palette = new color[nSeeds];
boolean hive = true;

void setup() {
  size(500, 500);
  noStroke();
  fill(0);
  generateSeeds();
  initColors();
//  noLoop();
}

void draw() {
  background(125);
  displayVoronoi();
  println("Hivemode = " + hive);
  //  displaySeeds();
  //  displayDelaunay();
}

void generateSeeds() {
  for (int i = 0; i < nSeeds; i++) {
    allSeeds[i] = new PVector(random(width-50)+25, random(height-50)+25);
  }
  for (int i = 0; i < nSeeds; i++) {
    //println(allSeeds[i].x, allSeeds[i].y);
  }
}

void initColors() {
  for (int i = 0; i < nSeeds; i ++) {
    palette[i] = color(random(255), random(255), random(255));
  }
}

void displaySeeds() {
  fill(255);
  for (int i = 0; i < nSeeds; i++) {
    ellipse(allSeeds[i].x, allSeeds[i].y, 3, 3);
    text(i, allSeeds[i].x + 5, allSeeds[i].y);
  }
}

void displayVoronoi() {
  int closest;
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      closest = 0;      
      for (int k = 0; k < nSeeds; k ++) {
        if (dist(i, j, allSeeds[k].x, allSeeds[k].y) <
          dist(i, j, allSeeds[closest].x, allSeeds[closest].y)) {
          closest = k;
        }
      }
      fill(palette[closest]);
      ellipse(i, j, 2, 2);
      // hive
      if (hive == true) {
        stroke(0);
        line(i, j, allSeeds[closest].x, allSeeds[closest].y);
        noStroke();
      }
    }
  }
}

void displayDelaunay() {
  for (int i = 0; i < nSeeds; i ++) {
    int closest = findClosest(i);
    int nextClosest = findNextClosest(i, closest);
    println(i, closest, nextClosest);
    stroke(0);
    line(allSeeds[i].x, allSeeds[i].y, allSeeds[closest].x, allSeeds[closest].y);
    line(allSeeds[i].x, allSeeds[i].y, allSeeds[nextClosest].x, allSeeds[nextClosest].y);
    //    line(allSeeds[closest].x, allSeeds[closest].y, allSeeds[nextClosest].x, allSeeds[nextClosest].y);
    noStroke();
  }
}

int findClosest(int i) {
  int which = 0;
  while (which == i) {
    which++;
  }
  for (int j = 0; j < nSeeds-1; j++) {
    if (j != i) {
      if (dist(allSeeds[i].x, allSeeds[i].y, allSeeds[j].x, allSeeds[j].y) <
        dist(allSeeds[i].x, allSeeds[i].y, allSeeds[which].x, allSeeds[which].y)) {
        which = j;
      }
    }
  }
  return which;
}

int findNextClosest(int i, int closest) {
  int which = 0;
  while ((which == i) || (which == closest)) {
    which++;
  }
  for (int j = 0; j < nSeeds-1; j++) {
    if ((j != i) && (j != closest)) {
      if (dist(allSeeds[i].x, allSeeds[i].y, allSeeds[j].x, allSeeds[j].y) <
        dist(allSeeds[i].x, allSeeds[i].y, allSeeds[which].x, allSeeds[which].y)) {
        which = j;
      }
    }
  }
  return which;
}

void keyPressed() {
  switch(key) {
  case 'h':
  case 'H': 
    println("Recalculating...");
    hive = !hive;
    break;
  }
}
