int nParticles = 5000;
float sourceX;
float sourceY;
float gravity = .05;
float dampening = .9;
float friction = .7;
float lifeDecrement = .5;

float[] s = new float[nParticles];
float[] x = new float[nParticles];
float[] y = new float[nParticles];
color[] c = new color[nParticles];
float[] xSpd = new float[nParticles];
float[] ySpd = new float[nParticles];
float[] life = new float[nParticles];


void setup() {
  size (500, 500);
  sourceX = width / 2;
  sourceY = height / 2;
  initAllParticles();
  noStroke();
}

void draw() {
  background(0);
  displayParticles();
  moveParticles();
  applyGravity();  
  checkEdgesAndApplyFricDamp();
  checkLifeAndAdjust();
}

void displayParticles() {
  for (int i = 0; i < nParticles; i ++) {
    fill(c[i], life[i]);
    ellipse(x[i], y[i], s[i], s[i]);
  }
}

void moveParticles() {
  for (int i = 0; i < nParticles; i ++) {
    x[i] = x[i] + xSpd[i];
    y[i] = y[i] + ySpd[i];
  }
}

void applyGravity() {
  for (int i = 0; i < nParticles; i ++) {
    ySpd[i] = ySpd[i] + gravity;
  }
}

void checkEdgesAndApplyFricDamp() {
  for (int i = 0; i < nParticles; i ++) {
    if ((x[i] >= (width - s[i])) || (x[i] <= (s[i]))) {
      xSpd[i] = xSpd[i] * -1;
    }
    if (y[i] >= (height - s[i])) {
      y[i] = height - s[i] - 1;
      ySpd[i] = ySpd[i] * -1 * dampening;
      xSpd[i] = xSpd[i] * friction;
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
  s[index] = 7;
  x[index] = sourceX;
  y[index] = sourceY;
  c[index] = color(random(255), random(255), random(255));
  xSpd[index] = random(-3, 3);
  ySpd[index] = random(-3, 3);
  life[index] = random(50, 255);
}
  
