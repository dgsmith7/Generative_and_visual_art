PVector s1p, s2p, s3p;
PVector s1v, s2v, s3v;
float diam = 40;
float rad = 20;

void setup() {
  size (800, 800, P3D);
  noStroke();
  sphereDetail(30);
  initSpheres();
}

void draw() {
  background (#2E294E);
  setLightingAndMaterials();
  displaySpheres();
  updateSpheres();
  checkEdges();
//  checkCollision();
}
         
void initSpheres() {
  s1p = new PVector(random(150) + 100 - diam + rad, random(150) + 100 - diam + rad);
  s2p = new PVector(random(150) + 300 - diam + rad, random(150) + 300 - diam + rad);
  s3p = new PVector(random(150) + 500 - diam + rad, random(150) + 500 - diam + rad);
  s1v = new PVector(random(10) - 5, random(10) - 5);
  s2v = new PVector(random(10) - 5, random(10) - 5);
  s3v = new PVector(random(10) - 5, random(10) - 5);
  if (s1v.x == 0) s1v.x += 1;
  if (s1v.y == 0) s1v.y += 1;
  if (s2v.x == 0) s2v.x += 1;
  if (s2v.y == 0) s2v.y += 1;
  if (s3v.x == 0) s3v.x += 1;
  if (s3v.y == 0) s3v.y += 1;
}

void displaySpheres() {
  pushMatrix();
  translate(s1p.x, s1p.y);
  fill(#541388);
  sphere(diam);
  popMatrix();
  pushMatrix();
  translate(s2p.x, s2p.y);
  fill(#Ffd400);
  sphere(diam);
  popMatrix();
  pushMatrix();
  translate(s3p.x, s3p.y);
  fill(#D90368);
  sphere(diam);
  popMatrix();
}

void updateSpheres() {
  s1p.add(s1v);
  s2p.add(s2v);
  s3p.add(s3v);
}

void checkEdges() {
  if (s1p.x < diam || s1p.x > (width-diam)) s1v.x *= -1;
  if (s1p.y < diam || s1p.y > (height-diam)) s1v.y *= -1;
  if (s2p.x < diam || s2p.x > (width-diam)) s2v.x *= -1;
  if (s2p.y < diam || s2p.y > (height-diam)) s2v.y *= -1;
  if (s3p.x < diam || s3p.x > (width-diam)) s3v.x *= -1;
  if (s3p.y < diam || s3p.y > (height-diam)) s3v.y *= -1;
}

void checkCollision() {
  if ((dist(s1p.x, s1p.y, s2p.x, s2p.y) < diam)&&(s1p.x - s2p.x < diam)) {s1v.x *=-1; s2v.x *= -1;};
  if ((dist(s1p.x, s1p.y, s2p.x, s2p.y) < diam)&&(s1p.y - s2p.y < diam)) {s1v.y *=-1; s2v.y *= -1;};
  if ((dist(s1p.x, s1p.y, s3p.x, s3p.y) < diam)&&(s1p.x - s3p.x < diam)) {s1v.x *=-1; s3v.x *= -1;};
  if ((dist(s1p.x, s1p.y, s3p.x, s3p.y) < diam)&&(s1p.y - s3p.y < diam)) {s1v.y *=-1; s3v.y *= -1;};
  if ((dist(s2p.x, s2p.y, s3p.x, s3p.y) < diam)&&(s2p.x - s3p.x < diam)) {s2v.x *=-1; s3v.x *= -1;};
  if ((dist(s2p.x, s2p.y, s3p.x, s3p.y) < diam)&&(s2p.y - s3p.y < diam)) {s2v.y *=-1; s3v.y *= -1;};
}

void setLightingAndMaterials() {
  ambient(#F1e9da);
  ambientLight (40, 20, 40);
  lightSpecular(255, 215, 215);
  directionalLight(185, 195, 255, -1, 1.25, -1);
  shininess(255);
}
