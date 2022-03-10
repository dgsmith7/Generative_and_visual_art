import peasy.*;
PeasyCam cam;

int nNodes = 9;
Node[] nodes = new Node[nNodes];

void setup () {
  cam = new PeasyCam(this, 150);
  cam.setMinimumDistance(250);
  cam.setMaximumDistance(1500);

  size(500, 500, P3D);
  background(125);
  spawnNodes();
}

void draw() {
  background(125);
  for (int i = 0; i < nNodes; i ++) {
    nodes[i].display();
    stroke(color(255, 0, 0));
    drawLines(nNodes-1);
  }
}

void spawnNodes() {
  nodes[0] = new Node(0, 100, 100, -100);
  nodes[1] = new Node(1, 300, 100, -100);
  nodes[2] = new Node(2, 100, 300, -100);
  nodes[3] = new Node(3, 300, 300, -100);
  nodes[4] = new Node(4, 100, 100, -300);
  nodes[5] = new Node(5, 300, 100, -300);
  nodes[6] = new Node(6, 100, 300, -300);
  nodes[7] = new Node(7, 300, 300, -300);
  nodes[8] = new Node(8, 200, 200, -50);
}

void drawLines(int n) {
  if (n > 1) {
    for (int i = n; i > 0; i --) {
      line(nodes[n].x, nodes[n].y, nodes[n].z, nodes[i-1].x, nodes[i-1].y, nodes[i-1].z);
    }
    drawLines(n - 1);
  }
}