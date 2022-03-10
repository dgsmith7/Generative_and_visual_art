import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Lakota_Bracelet extends PApplet {

int alpha = 225;
int[] palette = {
  color(255, 0, 0, alpha), color(255, 128, 0, alpha), color(255, 255, 0, alpha), color(0, 255, 255, alpha), color(0, 0, 0, alpha)
};
//    red 0                      orange 1                     yellow 2                     turq 3                  black 4

int[][] pattern = {
 {4,4,4,4,0,0,0,0,0,4,4,4,4,4,4,0,0,0,0,0,4,4,4,4,4,4,4,4,0,0,0,0,0,4,4,4},
 {4,4,4,4,4,1,1,1,4,4,4,4,4,4,4,4,1,1,1,4,4,4,4,4,3,4,4,4,4,1,1,1,4,4,4,2},
 {4,4,4,4,4,4,2,4,4,0,0,0,0,0,4,4,4,2,4,4,4,4,4,3,0,3,4,4,4,4,2,4,4,4,2,3},
 {4,3,4,4,4,4,4,4,4,0,3,3,3,0,4,4,4,4,4,4,4,4,3,0,1,0,3,4,4,4,4,4,4,4,2,3},
 {4,0,3,4,4,4,4,0,0,0,3,2,3,0,0,0,0,4,4,4,4,3,0,1,2,1,0,3,4,4,4,4,4,2,2,3},
 {4,1,0,3,4,4,4,0,3,3,3,2,3,3,3,3,0,4,4,4,3,0,1,2,4,2,1,0,3,4,4,4,2,3,3,3},
 {4,2,1,0,3,4,4,0,3,2,2,2,2,2,2,3,0,4,4,3,0,1,2,4,4,4,2,1,0,3,4,4,2,3,3,3}
 };
 
float blockW, blockH, offsetX, offsetY;                   

public void setup() {
  
  blockW = ceil(width / 72);
  blockH = ceil(height / 13);
  offsetX = (width - (72*blockW))/2;
  offsetY = (height - (13*blockH))/2;
  noStroke();
}

public void draw() {
  background(0);
  for (int i = 0; i < 13; i ++) {
    for (int j = 0; j < 73; j ++) {
      if ((i <= 6) && (j <= 35)) {
        fill(palette[pattern[i][j]]);
        rect(offsetX + j * blockW, offsetY + (i * blockH), blockW, blockH);
      }
      if ((i > 6) && (j <= 35)) {
        fill(palette[pattern[12 - i][j]]);
        rect(offsetX + j * blockW, offsetY + (i * blockH), blockW, blockH);
      }
      if ((i <= 6) && (j > 36)) {
        fill(palette[pattern[i][72 - j]]);
        rect(offsetX + ((j - 1) * blockW), offsetY + (i * blockH), blockW, blockH);
      }
      if ((i > 6) && (j > 36)) {
        fill(palette[pattern[12 - i][72 - j]]);
        rect(offsetX + ((j - 1) * blockW), offsetY + (i * blockH), blockW, blockH);
      }
    }
  }
}
  public void settings() {  size (1200, 180); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#000000", "--hide-stop", "Lakota_Bracelet" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
