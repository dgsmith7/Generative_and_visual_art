import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import peasy.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class nodeMeshMaker extends PApplet {


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

public void setup() {
  //size (800, 800, P3D);
  
  
  colorMode(HSB, 360, 100, 100);
  initLastInSectorArray();
  initNodes();
  cam = new PeasyCam(this, 2500);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(5000);
  sphereDetail(15);
  textSize(25);
}

public void draw() {
  background(0, 0, 50);
  lights();
  ambientLight(0, 0, 50, 0, 0, 0);
  rotateX(rx);
  rx += .001f;
  rotateY(ry);
  ry += .002f;
  rotateZ(rz);
  rz += .003f;
  displayNodes();
  cam.beginHUD();
  fill(0);
  text("Drag mouse to inspect or click mouse for new structure", 50, height * .98f);
  cam.endHUD();
}

public void initLastInSectorArray() {
  for (int i = 0; i < 32; i ++) {
    lastInSector[i] = 0;
  }
}

public void initNodes() {  
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
    allNodes[i].armLength = .3f*(allNodes[i].size + allNodes[which].size);
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

public int setColorByPosit(float latitude, float longitude) {
  return color(latitude/2, 100, longitude, opacity);
}

public void displayNodes() {
  for (int i = 0; i < nNodes; i++) {
    allNodes[i].display();
  }
}

public void mouseClicked() {
  initLastInSectorArray();
  initNodes();
}

class Node {

  float latitude, longitude;
  float armLength;
  PVector position;
  int c;
  float opac;
  float size;
  int sector;

  Node () {
    this.latitude = PApplet.parseInt(random(360));
    this.longitude = PApplet.parseInt(random(180));
    this.armLength = random(width);
    position = computeSectorAndPosition(latitude, longitude, armLength);
    this.c = color(0);
    this.opac = 127;
    this.size = random(25, 75);
  }

  public void display() {
    noStroke();
    fill(c, opac);
    pushMatrix();
    translate(position.x, position.y, position.z);
    box(size);
    popMatrix();
  }

  public PVector computeSectorAndPosition (float latitude, float longitude, float armLength) {
    this.sector = (PApplet.parseInt(latitude>45) + 
                    PApplet.parseInt(latitude>90)+ 
                    PApplet.parseInt(latitude>135) +
                    PApplet.parseInt(latitude>180) + 
                    PApplet.parseInt(latitude>215) + 
                    PApplet.parseInt(latitude>270) +  
                    PApplet.parseInt(latitude>315) +
                    (PApplet.parseInt(longitude > 45) * 8) +
                    (PApplet.parseInt(longitude > 90) * 8) + 
                    (PApplet.parseInt(longitude > 135) * 8));
    return new PVector(armLength*sin(radians(longitude))*cos(radians(latitude)), 
      (armLength* sin(radians(longitude))*sin(radians(latitude))), 
      (armLength*cos(radians(longitude))));
  }
}

  public void settings() {  fullScreen(P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#000000", "--hide-stop", "nodeMeshMaker" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
