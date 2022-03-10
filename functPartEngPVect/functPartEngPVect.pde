int nParticles = 5000;
PVector source;
PVector gravity = new PVector(0, .05);
PVector dampening = new PVector(0, .9);
PVector friction = new PVector(.7, 0);
float lifeDecrement = .5;

float[] s = new float[nParticles];
PVector[] position = new PVector[nParticles];
color[] c = new color[nParticles];
PVector[] spd = new PVector[nParticles];
float[] life = new float[nParticles];

void setup() {
//  size (500, 500);
fullScreen();
  source = new PVector(width / 2, height / 2);
  initAllParticles();
  noStroke();
//  noLoop();
}

void draw() {
  background(0);
  source.set(mouseX, mouseY);
  displayParticles();
  moveParticles();
  applyGravity();  
  checkEdgesAndApplyFricDamp();
  checkLifeAndAdjust();
}

void displayParticles() {
  for (int i = 0; i < nParticles; i ++) {
    fill(c[i], life[i]);
    ellipse(position[i].x, position[i].y, s[i], s[i]);
  }
}

void moveParticles() {
  for (int i = 0; i < nParticles; i ++) {
    position[i].add(spd[i]);
  }
}

void applyGravity() {
  for (int i = 0; i < nParticles; i ++) {
    spd[i].add(gravity);
  }
}

void checkEdgesAndApplyFricDamp() {
  for (int i = 0; i < nParticles; i ++) {
    if ((position[i].x >= (width - s[i])) || (position[i].x <= (s[i]))) {
      spd[i].x *= -1;
    }
    if (position[i].y >= (height - s[i])) {
      position[i].y = height - s[i];
      spd[i].y *= dampening.y;
      spd[i].y *= -1;
      spd[i].x *= friction.x; 
    }
  }
}

void checkLifeAndAdjust() {
  for (int i = 0; i < nParticles; i ++) {
    life[i] = life[i] - lifeDecrement;
  }
  for (int i = 0; i < nParticles; i ++) {
    if (life[i] <= 0) {
      initOneParticle(i);
    }
  }
}

void initAllParticles() {
  for (int i = 0; i < nParticles; i++) {
    initOneParticle(i);
  }
}

void initOneParticle(int index) {
  s[index] = 15;
  position[index] = new PVector(source.x, source.y);
  c[index] = color(random(255), random(255), random(255));
  spd[index] = new PVector(random(-5, 5), random(-5, 5));
  life[index] = random(50, 255);
}
  
