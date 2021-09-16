// Interactive Otto Runge Color Globe Copyright (C) by David G. Smith, January 2016

// Peasy cam stuff
import peasy.*;
PeasyCam cam;
float radius = 50;
int lat, lon;
boolean craziness;
float crazyFactor = 21;
int effect;

float radiusHolder;
float sat;


void setup() {
  size (750, 750, P3D);
  frameRate(60);
  colorMode(HSB, 180);  // uses hue saturation value color mode

  // more peasy cam stuff  
  cam = new PeasyCam(this, 150);
  cam.setMinimumDistance(150);
  cam.setMaximumDistance(250);
  lat = 0;
  lon = 0;

  radiusHolder = radius;
  sat = 0;
  background(0);
}

void draw() {  
  //  background (125);
  drawLine();
        cam.rotateX(.05);
  cam.rotateY(.075);
  cam.rotateZ(.025);

  fill(0, 255, 0);
  //  drawColoredSphere ();
  //  drawAxis();
  //  saveFrame("frame-####.png");  // saves each frame as an image for use with Tools>Movie Maker
}

void drawLine() {
  strokeWeight(1);
  stroke(random(5) + 30,  random(10) + 200, random(10) + 180, 180);  // sets color hue saturation and value based on location
  if (craziness == true) {
    radiusHolder = radius; 
    radius = radius + (noise(lat, lon)*crazyFactor);
  }  //extends radius if Perlin noise is toggled on
  if (lon < 90) {
    sat= sat + 2;
  } else {
    sat = sat - 2;
  }  // tweaks saturation based on location
  if ((effect == 0) || (effect == 1)) {
    line ((radius*sin(PI+radians(lon))*cos(PI+radians(lat))), 
      (radius* sin(PI+radians(lon))*sin(PI+radians(lat))), 
      (radius*cos(PI+radians(lon)))
      , (radius*sin(radians(lon))*cos(radians(lat))), 
      (radius* sin(radians(lon))*sin(radians(lat))), 
      (radius*cos(radians(lon))));
  }
  if (effect == 2) {
    point ((radius*sin(radians(lon))*cos(radians(lat))), (radius* sin(radians(lon))*sin(radians(lat))), (radius*cos(radians(lon))));
  }
  if (craziness == true) {
    radius = radiusHolder;
  }
  lon = lon + 1;
  if (lon == 180) {
    lon = 0;
    lat = lat + 1;
    if (lat == 360) {
      lat = 0;
    }
  }
}

void drawColoredSphere() {
  float radiusHolder = radius;
  float sat = 0;
  for (float latitude = 0; latitude < 360; latitude= latitude + 1) { //iterates through latitudes
    for (float longitude = 0; longitude < 180; longitude = longitude + 1) { // iterates through longitudes
      strokeWeight(7);
      stroke(latitude/2, sat /*180*/, longitude, 180);  // sets color hue saturation and value based on location
      if (craziness == true) {
        radiusHolder = radius; 
        radius = radius + (noise(latitude, longitude)*crazyFactor);
      }  //extends radius if Perlin noise is toggled on
      if (longitude < 90) {
        sat= sat + 2;
      } else {
        sat = sat - 2;
      }  // tweaks saturation based on location
      if ((effect == 0) || (effect == 1)) {
        line (0, 0, 0, (radius*sin(radians(longitude))*cos(radians(latitude))), (radius* sin(radians(longitude))*sin(radians(latitude))), (radius*cos(radians(longitude))));
      }
      if (effect == 2) {
        point ((radius*sin(radians(longitude))*cos(radians(latitude))), (radius* sin(radians(longitude))*sin(radians(latitude))), (radius*cos(radians(longitude))));
      }
      if (craziness == true) {
        radius = radiusHolder;
      }
    }
  }

  //auto rotates cam
    cam.rotateX(.005);
  cam.rotateY(.051);
  cam.rotateZ(.015);
  /*
  camera.setDistance(double d);  // distance from looked-at point
   camera.pan(double dx, double dy);   // move the looked-at point relative to current orientation
   */
}

void keyPressed () {
  if (key == '1') { // Perlin radius for lines, resulting in "furry sphere"
    effect = 1;
  }
  if (key == '2') { // Instead of full lie from center to point, just draws a point in space around sphere
    effect = 2;
  } else { 
    effect = 0; // turns effects off 
    craziness = !(craziness); // toggles Perlin noise off
  }
} 

void drawAxis() {  // draws the little handles
  pushMatrix();
  strokeWeight(1);
  stroke(150, 0, 50);
  line (0, 0, 55, 0, 0, -55);
  translate(0, 0, 55);
  sphere(1);
  stroke(150, 0, 180);
  translate(0, 0, -110);
  sphere(1);
  popMatrix();
}

void mouseClicked() {
  saveFrame("frame-####.png");  // saves each frame as an image for use with Tools>Movie Maker
}
