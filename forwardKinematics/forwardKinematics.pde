///////////////////////////////////////////////////////////
//   Core to Head:     0-3
//   Core to Hip:      4-6
//   Right arm:        7-9
//   Left arm:         10-12
//   Right leg:        13-15
//   Left leg:         16-18
///////////////////////////////////////////////////////////

int nArms = 22;//18;
Arm[] allArms = new Arm[nArms]; 
PVector corePosit;

void setup() {
  size(500, 500);
  corePosit = new PVector(width/2, height/6 * 2);
  initAll();
}

void draw() {
  background(125);
  for (int i = nArms-1; i > -1; i --) {
    allArms[i].display();
  }
}

void initAll() {
//   Core to Head:     0-3
  allArms[0] = new Arm(corePosit, 15, radians(270));
  allArms[1] = new Arm(allArms[0].end, 15, radians(270));
  allArms[2] = new Arm(allArms[1].end, 45, radians(270));
//   Core to Hip:      4-6
  allArms[3] = new Arm(corePosit, 35, radians(90));
  allArms[4] = new Arm(allArms[3].end, 20, radians(90));
  allArms[5] = new Arm(allArms[4].end, 40, radians(90));
//   Right arm:        7-9
  allArms[6] = new Arm(corePosit, 35, radians(0)); //spine to shoulder
  allArms[7] = new Arm(allArms[6].end, 50, radians(80)); // shoulder to elbow
  allArms[8] = new Arm(allArms[7].end, 50, radians(100)); // elbow to wrist
  allArms[9] = new Arm(allArms[8].end, 30, radians(90)); // wrist to fingertip
//   Left arm:         10-13
  allArms[10] = new Arm(corePosit, 35, radians(180)); //spine to shoulder
  allArms[11] = new Arm(allArms[10].end, 50, radians(100)); // shoulder to elbow
  allArms[12] = new Arm(allArms[11].end, 50, radians(80)); // elbow to wrist
  allArms[13] = new Arm(allArms[12].end, 30, radians(90)); // wrist to fingertip
//   Right leg:        14-17
  allArms[14] = new Arm(allArms[5].end, 13, radians(0)); //spine to hip
  allArms[15] = new Arm(allArms[14].end, 65, radians(80)); // hip to knee
  allArms[16] = new Arm(allArms[15].end, 70, radians(80)); // knee to ankle
  allArms[17] = new Arm(allArms[16].end, 30, radians(90)); // ankle to toe
//   Left leg:         18-21
  allArms[18] = new Arm(allArms[5].end, 13, radians(180)); //spine to hip
  allArms[19] = new Arm(allArms[18].end, 65, radians(100)); // hip to knee
  allArms[20] = new Arm(allArms[19].end, 70, radians(100)); // knee to ankle
  allArms[21] = new Arm(allArms[20].end, 30, radians(90)); // ankle to toe
}

void mouseDragged() {
  for (int i = 0; i < nArms; i ++) {
    if (allArms[i].mouseIsOverEnd()) {
      allArms[i].adjust();
    };
  }
  allArms[14].theta = radians(0);
  allArms[18].theta = radians(180);
}
