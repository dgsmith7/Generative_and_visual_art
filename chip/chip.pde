float rx;
float ry;
float rz;
float depth = 1000;

void setup () {
  size (1200, 750, P3D);
  frameRate(60);

  smooth();
  ellipseMode (CENTER);
  noLoop ();
}

void draw () {
  background (0,0,0,0);
  ambient (175, 100, 50);   
  lightSpecular(255, 215, 215);
//  directionalLight(185, 195, 255, -1, 1.25, -1);
  shininess(255);
//translate(-250, 0, 0);
//rotateX(-.35);
//rotateY(.2);
//rotateZ(.025);
  drawStars ();
  drawChipRoof ();
  drawPlatform ();
  drawChipWalls ();
  
}

void drawStars () {
  for (int i = 0; i < 125; i++) {
  stroke (random (100, 255));
    rx = random(width*2)-width/2;
    ry = random (height*2)-height/2;
    rz = 850;
    translate (rx, ry, -rz);
    sphere (1); 
    translate (-rx, -ry, rz);
  }
}
void  drawChipRoof () {
    stroke (200);
    fill(25, 25, 25, 225);
    translate (600, 200, -500);
    box (400, 45, 600);
    translate (-600, -200,  500);
  }

void  drawPlatform () {
  stroke (0 , 100, 150);
  fill (25, 25, 25, 125);
  translate (600, 520, -500);
  box (1200, 26, 1000);
  translate(-500, -520, 500);
    for (float i = 0; i< 1050; i = i + 150) {
      for (float j = 0; j < 1050; j = j + 150) {
        drawGlowBox (i, j);
      }
    }
  }

void  drawGlowBox (float bx, float bz) {
    float by = 500; 
    stroke (0,100,125);
    fill (0, 100, 125, 50);
    translate (bx +55, by, -bz - 150);
    box (145, 26, 145);
    translate (-bx -55 , -by, bz + 150);
  }
  
    
void  drawChipWalls () {
  float direction;
    for (float i = 0; i < 4; i ++){
      for (float j = 0; j < 2; j ++) {
        translate (265+(j*470) , 210, -i*150-275);
        if (j == 0 ) {direction = -1;} else {direction = 1;}
        drawLeg(direction);
        translate (-265-(j*470), -210, i*150+275);
      }
    }
  }

void drawLeg (float dir) {
  stroke (0);
  fill (150);
  //upper
box (75, 10, 80);
//lower
translate (dir * 32, 105, 0);
box (10,200,80);
translate (dir * -32, -105, 0);
//peg
translate (dir * 32, 250, 0);
box (10,175,25);
translate (dir * -32, -250, 0);
stroke (0, 200, 0);
//translate (dir * 32, 255, 0);
//sphere(15);
//translate (dir * -32, -255, 0);

}
  
