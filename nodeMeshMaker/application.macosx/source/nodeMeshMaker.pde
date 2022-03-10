import peasy.*;
PeasyCam cam;

int nNodes = 5000;
Node[] allNodes = new Node[nNodes];
int minSize = 10;
int maxSize = 25;
float opacity = 255;
int[] lastInSector = new int[32];

float rx = 0;
float ry = 0;
float rz = 0;

void setup() {
  //size (800, 800, P3D);
  fullScreen(P3D);
  smooth();
  colorMode(HSB, 360, 100, 100);
  initLastInSectorArray();
  initNodes();
  cam = new PeasyCam(this, 2500);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(5000);
  sphereDetail(15);
  textSize(25);
}

void draw() {
  background(0, 0, 50);
  lights();
  ambientLight(0, 0, 50, 0, 0, 0);
  rotateX(rx);
  rx += .001;
  rotateY(ry);
  ry += .002;
  rotateZ(rz);
  rz += .003;
  displayNodes();
  cam.beginHUD();
  fill(0);
  text("Drag mouse to inspect or click mouse for new structure", 50, height * .98);
  cam.endHUD();
}

void initLastInSectorArray() {
  for (int i = 0; i < 32; i ++) {
    lastInSector[i] = 0;
  }
}

void initNodes() {  
  int which = 0;

  allNodes[0] = new Node();
  allNodes[0].latitude = 0;
  allNodes[0].longitude = 0;
  allNodes[0].armLength = 1;
  allNodes[0].position = allNodes[0].computeSectorAndPosition(allNodes[0].latitude, 
    allNodes[0].longitude, 
    allNodes[0].armLength);
  allNodes[0].c = setColorByPosit(allNodes[0].latitude, allNodes[0].longitude);
  allNodes[0].size = 50;
  allNodes[0].c = color(0, 0, 100);

  for (int i = 1; i < nNodes; i++) {
    allNodes[i] = new Node();
    which = lastInSector[allNodes[i].sector];
    allNodes[i].armLength = .3*(allNodes[i].size + allNodes[which].size);
    allNodes[i].position = allNodes[i].computeSectorAndPosition(allNodes[i].latitude+random(-7,7), 
      allNodes[i].longitude+random(-3,3), 
      allNodes[i].armLength);
    allNodes[i].position.x += allNodes[which].position.x;
    allNodes[i].position.y += allNodes[which].position.y;
    allNodes[i].position.z += allNodes[which].position.z;
    allNodes[i].c = setColorByPosit(allNodes[i].latitude, allNodes[i].longitude);
    lastInSector[allNodes[i].sector] = i;
  }
}

color setColorByPosit(float latitude, float longitude) {
  return color(latitude/2, 100, longitude, opacity);
}

void displayNodes() {
  for (int i = 0; i < nNodes; i++) {
    allNodes[i].display();
  }
}

void mouseClicked() {
  initLastInSectorArray();
  initNodes();
}
