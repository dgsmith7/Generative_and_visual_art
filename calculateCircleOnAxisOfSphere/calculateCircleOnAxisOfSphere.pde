import peasy.*;PeasyCam cam;//float radius = 50;
import processing.dxf.*;
float rx = 0;
float ry = 0;
float rz = 0;

float coreX, coreY, coreZ;
float cx, cy, cz;
float axisRadius, inclination, azimuth;
float outerShapeRadius;
float uv1x, uv2x, uv3x;
float uv1y, uv2y, uv3y;
float uv1z, uv2z, uv3z;
//float sx, sy, sz;
int c1 = 2;
int c2 = 6;
int c3 = 5;
int i = 0;

float dx, dy, dz;
float ex, ey, ez;

PVector[] c = new PVector[360];
PVector[] d = new PVector[360];
PVector[] e = new PVector[360];

PShape form, t1, t2, t3, t4, t5, t6;
String fileName = "triangleForm.dxf";

boolean doneBuilding = false;

PrintWriter report;

void setup() {
 // size(800, 800, P3D);
  fullScreen(P3D, 2);
  blendMode(BLEND);
   noStroke();
//  stroke(255, 0, 0);
  //noLoop();
  // set core to center of 3d box
  coreX = width/2;
  coreY = height/2;
  coreZ = width/2 * -1;
  // set radius and angles of inclination and azimuth
  axisRadius = width*.4;  
  inclination = radians(0);  // 0 to PI
  azimuth = radians(0); // 0 to TWO_PI
  // set point on axis
  calculateSurfaceCoord();
  // set outer shapoe radius
  outerShapeRadius = 125;
  sphereDetail(15);
  background(0);
  cam = new PeasyCam(this, 3500);cam.setMinimumDistance(-100);cam.setMaximumDistance(3500);
//  noFill();
fill(225);
report = createWriter("CoordsAndDims.txt");
}

void draw() {
  //cam.setRotations(rx, ry, rz);
  //rx = rx + .005;
  //ry = ry + .004;
  //rz = rz + .003;
  
  background(0);
   lights();
   
    //drawCoreBox();
    //drawSurfaceBox();
    //drawConnector();
    //drawUV1Box();
    //drawUV2Box();
    //drawUV3Box();
    //drawOuterShape();
    //mapAngles();
    //calculateSurfaceCoord();
  
  if (doneBuilding == false) {
  
    //  if (i < 360) {
    //    println(i);
    // background(0);
    //cx = coreX + (axisRadius * (cos(radians(c1 * i)) + (cos(radians(c2 * i)) / 2) + (sin(radians(c3 * i)) / 3))); 
    //cy = coreY + (axisRadius * (sin(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
    //cz = coreZ - (axisRadius * (cos(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3)));
    //dx = (outerShapeRadius + coreX) + (axisRadius * (cos(radians(c1 * i)) + (cos(radians(c2 * i)) / 2) + (sin(radians(c3 * i)) / 3))); 
    //dy = coreY + (axisRadius * (sin(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
    //dz = coreZ - (axisRadius * (cos(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3)));
    //ex = coreX + (axisRadius * (cos(radians(c1 * i)) + (cos(radians(c2 * i)) / 2) + (sin(radians(c3 * i)) / 3))); 
    //ey = (outerShapeRadius + coreY) + (axisRadius * (sin(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
    //ez = (outerShapeRadius + coreZ) - (axisRadius * (cos(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3)));
    //c[i] = new PVector(cx, cy, cz);
    //d[i] = new PVector(dx, dy, dz);
    //e[i] = new PVector(ex, ey, ez);
    //inclination = acos((-1*(cz - coreZ))/axisRadius);
    //azimuth = acos((cx - coreX) / (axisRadius * sin(inclination)));
    //calculateUV1();
    //calculateUV2();
    //calculateUV3();
    //drawOuterShape();
    //  background(0);
    //  drawSurfaceBox();
    //  displayStats();
    //    i++;
        
calculateTriangles();
buildShapeTS();
reportDimensions();
  }
  shape(form, 0 ,0);
  stroke(255, 0 ,0);
  noFill();
  pushMatrix();
  translate(coreX, coreY, coreZ);
  sphere(width);
  popMatrix();
}


void drawCoreBox() {
  fill(255, 0, 0);
  pushMatrix();
  translate(coreX, coreY, coreZ);
  fill(255, 0, 0);
  box(15);
  popMatrix();
}

void drawSurfaceBox() {
  pushMatrix();
  translate(cx, cy, cz);
  fill(0, 0, 255);
  box(15);
  popMatrix();
}

void drawConnector() {
  stroke(255, 0, 0);
  line(coreX, coreY, coreZ, cx, cy, cz);
  noStroke();
}

void drawUV1Box() {
  pushMatrix();
  translate(uv1x, uv1y, uv1z);
  fill(0, 255, 0);
  box(5);
  popMatrix();
}

void drawUV2Box() {
  pushMatrix();
  translate(uv2x, uv2y, uv2z);
  fill(255, 255, 0);
  box(5);
  popMatrix();
}

void drawUV3Box() {
  pushMatrix();
  translate(uv3x, uv3y, uv3z);
  fill(255, 255, 0);
  box(5);
  popMatrix();
}

void mapAngles() {
  inclination = map(mouseX, 0, width, 0, PI);
  azimuth = map(mouseY, 0, height, 0, TWO_PI);
}

void calculateSurfaceCoord() {
  cx = coreX + axisRadius * sin(inclination) * cos(azimuth);
  cy = coreY + axisRadius * sin(inclination) * sin(azimuth);
  cz = coreZ - axisRadius * cos(inclination);
}

void calculateUV1() {
  float newRadius = sqrt(((0.5 * outerShapeRadius * sqrt(3)) * (0.5 * outerShapeRadius * sqrt(3))) + 
    ((axisRadius - (0.5 * outerShapeRadius)) * (axisRadius - (0.5 * outerShapeRadius))));
  float inclinationChange = (atan((0.5 * outerShapeRadius * sqrt(3)) / (axisRadius - (0.5 * outerShapeRadius))));
  float newInclination = (inclination - inclinationChange) ;
  uv1x = coreX + newRadius * sin(newInclination) * cos(azimuth);
  uv1y = coreY + newRadius * sin(newInclination) * sin(azimuth);
  uv1z = coreZ - newRadius * cos(newInclination);
}

void calculateUV2() {
  float newRadius = sqrt(((0.5 * outerShapeRadius * sqrt(3)) * (0.5 * outerShapeRadius * sqrt(3))) + 
    ((axisRadius - (0.5 * outerShapeRadius)) * (axisRadius - (0.5 * outerShapeRadius))));
  float inclinationChange = (atan((0.5 * outerShapeRadius * sqrt(3)) / (axisRadius - (0.5 * outerShapeRadius))));
  float newInclination = (inclination + inclinationChange) ;
  uv2x = coreX + newRadius * sin(newInclination) * cos(azimuth);
  uv2y = coreY + newRadius * sin(newInclination) * sin(azimuth);
  uv2z = coreZ - newRadius * cos(newInclination);
}

void calculateUV3() {
  float newRadius = outerShapeRadius + axisRadius;
  uv3x = coreX + newRadius * sin(inclination) * cos(azimuth);
  uv3y = coreY + newRadius * sin(inclination) * sin(azimuth);
  uv3z = coreZ - newRadius * cos(inclination);
}

void drawOuterShape() {
  //stroke(255, 175, 0);
  //line(uv1x, uv1y, uv1z, uv2x, uv2y, uv2z);
  //line(uv2x, uv2y, uv2z, uv3x, uv3y, uv3z);
  //line(uv3x, uv3y, uv3z, uv1x, uv1y, uv1z);
  //noStroke();

  stroke(255, 175, 0);
  pushMatrix();
  translate(cx, cy, cz);
  box(2);
  popMatrix();

  stroke(0, 175, 255);
  pushMatrix();
  translate(dx, dy, dz);
  box(2);
  popMatrix();

  stroke(255, 0, 0);
  pushMatrix();
  translate(ex, ey, ez);
  box(2);
  popMatrix();

  line(cx, cy, cz, dx, dy, dz);
  line(dx, dy, dz, ex, ey, ez);
  line(ex, ey, ez, cx, cy, cz);
}

void displayStats() {
  text("Inclination - " + int(degrees(inclination)), 10, 25);
  text("Azimuth - " + int(degrees(azimuth)), 10, 50);
  text("Radius - " + int(axisRadius), 10, 75);
  text("Core - " + int(coreX)+"  "+int(coreY)+"  "+int(coreZ), 10, 375);
  text("Axis Point - " + int(cx)+"  "+int(cy)+"  "+int(cz), 10, 400);
  text("UV1 - " + int(uv1x)+"  "+int(uv1y)+"  "+int(uv1z), 10, 425);
  text("UV2 - " +int(uv2x)+"  "+int(uv2y)+"  "+int(uv2z), 10, 450);
  text("UV3 - " +int(uv3x)+"  "+int(uv3y)+"  "+int(uv3z), 10, 475);
}

void calculateTriangles() {
  for (int i = 0; i < 360; i = i + 1) {
      cx = coreX + (axisRadius * (cos(radians(c1 * i)) + (cos(radians(c2 * i)) / 2) + (sin(radians(c3 * i)) / 3))); 
    cy = coreY + (axisRadius * (sin(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
    cz = coreZ - (axisRadius * (cos(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3)));
    dx = (outerShapeRadius + coreX) + (axisRadius * (cos(radians(c1 * i)) + (cos(radians(c2 * i)) / 2) + (sin(radians(c3 * i)) / 3))); 
    dy = coreY + (axisRadius * (sin(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
    dz = coreZ - (axisRadius * (cos(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3)));
    ex = coreX + (axisRadius * (cos(radians(c1 * i)) + (cos(radians(c2 * i)) / 2) + (sin(radians(c3 * i)) / 3))); 
    ey = (outerShapeRadius + coreY) + (axisRadius * (sin(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3))); 
    ez = (coreZ + outerShapeRadius) - (axisRadius * (cos(radians(c1 * i)) + (sin(radians(c2 * i)) / 2) + (cos(radians(c3 * i)) / 3)));
    c[i] = new PVector(cx, cy, cz);
    d[i] = new PVector(dx, dy, dz);
    e[i] = new PVector(ex, ey, ez);
  }
}

void buildShape() {
//  beginRaw(DXF, fileName);
  form = createShape(GROUP);
  for (int i = 0; i < 359; i ++) {
    t1 = createShape();
    t2 = createShape();
    t3 = createShape();
    t4 = createShape();
    t5 = createShape();
    t6 = createShape();
//color newFill = color(map(i, 0, 359, 100, 255), map(i, 0, 359, 100, 255));
//t1.setFill(newFill);
//t2.setFill(newFill);
//t3.setFill(newFill);
//t4.setFill(newFill);
//t5.setFill(newFill);
//t6.setFill(newFill);
    t1.beginShape();
    t1.vertex(c[i].x, c[i].y, c[i].z);
    t1.vertex(d[i].x, d[i].y, d[i].z);
    t1.vertex(d[i+1].x, d[i+1].y, d[i+1].z);
    t1.endShape(CLOSE);
    form.addChild(t1);
    t2.beginShape();
    t2.vertex(c[i].x, c[i].y, c[i].z);
    t2.vertex(d[i+1].x, d[i+1].y, d[i+1].z);
    t2.vertex(c[i+1].x, c[i+1].y, c[i+1].z);
    t2.endShape(CLOSE);
    form.addChild(t2);
    t3.beginShape();
    t3.vertex(d[i].x, d[i].y, d[i].z);
    t3.vertex(e[i+1].x, e[i+1].y, e[i+1].z);
    t3.vertex(e[i].x, e[i].y, e[i].z);
    t3.endShape(CLOSE);
    form.addChild(t3);
    t4.beginShape();
    t4.vertex(d[i].x, d[i].y, d[i].z);
    t4.vertex(d[i+1].x, d[i+1].y, d[i+1].z);
    t4.vertex(e[i+1].x, e[i+1].y, e[i+1].z);
    t4.endShape(CLOSE);
    form.addChild(t4);
    t5.beginShape();
    t5.vertex(c[i].x, c[i].y, c[i].z);
    t5.vertex(e[i+1].x, e[i+1].y, e[i+1].z);
    t5.vertex(e[i].x, e[i].y, e[i].z);
    t5.endShape(CLOSE);
    form.addChild(t5);
    t6.beginShape();
    t6.vertex(c[i].x, c[i].y, c[i].z);
    t6.vertex(c[i+1].x, c[i+1].y, c[i+1].z);
    t6.vertex(e[i+1].x, e[i+1].y, e[i+1].z);
    t6.endShape(CLOSE);
    form.addChild(t6);
  }
    t1 = createShape();
    t2 = createShape();
    t3 = createShape();
    t4 = createShape();
    t5 = createShape();
    t6 = createShape();
//color newFill = color(255, 0 ,0);
//t1.setFill(newFill);
//t2.setFill(newFill);
//t3.setFill(newFill);
//t4.setFill(newFill);
//t5.setFill(newFill);
//t6.setFill(newFill);
    t1.beginShape();
    t1.vertex(c[359].x, c[359].y, c[359].z);
    t1.vertex(d[359].x, d[359].y, d[359].z);
    t1.vertex(d[0].x, d[0].y, d[0].z);
    t1.endShape(CLOSE);
    form.addChild(t1);
    t2.beginShape();
    t2.vertex(c[359].x, c[359].y, c[359].z);
    t2.vertex(d[0].x, d[0].y, d[0].z);
    t2.vertex(c[0].x, c[0].y, c[0].z);
    t2.endShape(CLOSE);
    form.addChild(t2);
    t3.beginShape();
    t3.vertex(d[359].x, d[359].y, d[359].z);
    t3.vertex(e[0].x, e[0].y, e[0].z);
    t3.vertex(e[359].x, e[359].y, e[359].z);
    t3.endShape(CLOSE);
    form.addChild(t3);
    t4.beginShape();
    t4.vertex(d[359].x, d[359].y, d[359].z);
    t4.vertex(d[0].x, d[0].y, d[0].z);
    t4.vertex(e[0].x, e[0].y, e[0].z);
    t4.endShape(CLOSE);
    form.addChild(t4);
    t5.beginShape();
    t5.vertex(c[359].x, c[359].y, c[359].z);
    t5.vertex(e[0].x, e[0].y, e[0].z);
    t5.vertex(e[359].x, e[359].y, e[359].z);
    t5.endShape(CLOSE);
    form.addChild(t5);
    t6.beginShape();
    t6.vertex(c[359].x, c[359].y, c[359].z);
    t6.vertex(c[0].x, c[0].y, c[0].z);
    t6.vertex(e[0].x, e[0].y, e[0].z);
    t6.endShape(CLOSE);
    form.addChild(t6);
doneBuilding = true;
shape(form, 0, 0);
//endRaw();
//exit();
}

void buildShapeTS() {
//  beginRaw(DXF, fileName);
  form = createShape(GROUP);
  t1 = createShape();
  t2 = createShape();
  t3 = createShape();
  t1.beginShape(TRIANGLE_STRIP);
  t2.beginShape(TRIANGLE_STRIP);
  t3.beginShape(TRIANGLE_STRIP);
  for (int i =0; i < 360; i = i + 4) {
    t1.vertex(d[i].x, d[i].y, d[i].z);
    t1.vertex(c[i].x, c[i].y, c[i].z);
    t2.vertex(e[i].x, e[i].y, e[i].z);
    t2.vertex(d[i].x, d[i].y, d[i].z);
    t3.vertex(c[i].x, c[i].y, c[i].z);
    t3.vertex(e[i].x, e[i].y, e[i].z);
  }
    t1.vertex(d[0].x, d[0].y, d[0].z);
    t1.vertex(c[0].x, c[0].y, c[0].z);
    t2.vertex(e[0].x, e[0].y, e[0].z);
    t2.vertex(d[0].x, d[0].y, d[0].z);
    t3.vertex(c[0].x, c[0].y, c[0].z);
    t3.vertex(e[0].x, e[0].y, e[0].z);
  t1.endShape();
  t2.endShape();
  t3.endShape();
        form.addChild(t1);
        form.addChild(t2);
        form.addChild(t3);
  doneBuilding = true;
  shape(form, 0, 0);
//  endRaw();
//  exit();
}

void reportDimensions() {
  int skip = 4;
  for (int i = 0; i < 360; i = i + skip) {
    report.println("Triangle "+i+", First point - x:"+nf(c[i].x, 4, 1)+", y:"+nf(c[i].y, 4, 1)+", z:"+nf(c[i].z, 4, 1));
    report.println("   " +nf(dist(c[i].x, c[i].y, c[i].z, d[i].x, d[i].y, d[i].z), 4, 1)+" units to the second point:");
    report.println("Triangle "+i+", Second point - x:"+nf(d[i].x, 4, 1)+", y:"+nf(d[i].y, 4, 1)+", z:"+nf(d[i].z, 4, 1));
    report.println("   " +nf(dist(d[i].x, d[i].y, d[i].z, e[i].x, e[i].y, e[i].z), 4, 1)+" units to the third point:");
    report.println("Triangle "+i+", Third point - x:"+nf(e[i].x, 4, 1)+", y:"+nf(e[i].y, 4, 1)+", z:"+nf(e[i].z, 4, 1));
    report.println("   " +nf(dist(e[i].x, e[i].y, e[i].z, c[i].x, c[i].y, c[i].z), 4, 1)+" units back to the first point.");
    report.println();
    if (i < 360-skip) {
    report.println("     First point on Triangle "+i+" to First point on Triangle "+(i+skip)+"  is: " + nf(dist(c[i].x, c[i].y, c[i].z, c[i+skip].x, c[i+skip].y, c[i+skip].z), 4, 1));
    report.println("     Second point on Triangle "+i+" to Second point on Triangle "+(i+skip)+" is: " + nf(dist(d[i].x, d[i].y, d[i].z, d[i+skip].x, d[i+skip].y, d[i+skip].z), 4, 1));
    report.println("     Third point on Triangle "+i+" to Third point on Triangle "+(i+skip)+" is: " + nf(dist(e[i].x, e[i].y, e[i].z, e[i+skip].x, e[i+skip].y, e[i+skip].z), 4, 1));
    report.println();
    } else {
    report.println("     First point on Triangle "+i+" to First point on Triangle 0 is: " + nf(dist(c[i].x, c[i].y, c[i].z, c[0].x, c[0].y, c[0].z), 4, 1));
    report.println("     Second point on Triangle "+i+" to Second point on Triangle 0 is: " + nf(dist(d[i].x, d[i].y, d[i].z, d[0].x, d[0].y, d[0].z), 4, 1));
    report.println("     Third point on Triangle "+i+" to Third point on Triangle 0 is: " + nf(dist(e[i].x, e[i].y, e[i].z, e[0].x, e[0].y, e[0].z), 4, 1));
    }
  }
  report.flush();
  report.close();
}
