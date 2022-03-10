int redVal = 0;
int greenVal = 0;
int blueVal = 0;
int counter = 0;
String saveName;
boolean continueFlag = true;

void setup () {
  size (950, 750);
  frameRate (1);
  noLoop ();
}

void draw () {
  while (continueFlag == true) {
    background (255);
    fill (redVal, greenVal, blueVal);
    rect (10, 10, 930, 730);
    fill (redVal, 0, 0);
    rect (50, 250, 250, 250);
    fill (0, greenVal, 0);
    rect (350, 250, 250, 250);
    fill (0, 0, blueVal);
    rect (650, 250, 250, 250); 
    
    saveName = "Cards2/"; //R"+redVal+"-G"+greenVal+"-B"+blueVal+" and ";
 /*   
    blueVal += 32;
    if (blueVal == 256) {
      blueVal=255;
    }
    if (blueVal > 256) {
      blueVal = 0;
      greenVal += 32;
      if (greenVal == 256) {
        greenVal = 255;
      }
      if (greenVal > 256) {
        greenVal = 0;
        redVal +=32;
        if (redVal == 256) {
          redVal = 255;
        }
        if (redVal > 256) {
          redVal = 0;
          greenVal = 0;
          blueVal = 0;
          println ("yes");
          continueFlag = false;
        }
      }
    }
*/
/*    fill (redVal, greenVal, blueVal);
    rect (10, 761, 930, 730);
    fill (redVal, 0, 0);
    rect (50, 1000, 250, 250);
    fill (0, greenVal, 0);
    rect (350, 1000, 250, 250);
    fill (0, 0, blueVal);
    rect (650, 1000, 250, 250); 
*/
    if (counter <10) {
      saveName += "000"+Integer.toString(counter)+".png";//+"R"+redVal+"-G"+greenVal+"-B"+blueVal+"-000"+Integer.toString(counter)+".png";
    }
    if ((counter >=10) && (counter < 100)) {
      saveName += "00"+Integer.toString(counter)+".png";//+"R"+redVal+"-G"+greenVal+"-B"+blueVal+"-00"+Integer.toString(counter)+".png";
    }
    if ((counter >=100) && (counter < 1000)) {
      saveName += "0"+Integer.toString(counter)+".png";//+"R"+redVal+"-G"+greenVal+"-B"+blueVal+"-0"+Integer.toString(counter)+".png";
    }
    if ((counter >=1000) && (counter < 10000)) {
      saveName += Integer.toString(counter)+".png";//+"R"+redVal+"-G"+greenVal+"-B"+blueVal+"-"+Integer.toString(counter)+".png";
    }
    save(saveName);
    // println(saveName);
    counter ++;

    blueVal += 32;
    if (blueVal == 256) {
      blueVal=255;
    }
    if (blueVal > 256) {
      blueVal = 0;
      greenVal += 32;
      if (greenVal == 256) {
        greenVal = 255;
      }
      if (greenVal > 256) {
        greenVal = 0;
        redVal +=32;
        if (redVal == 256) {
          redVal = 255;
        }
        if (redVal > 256) {
          redVal = 0;
          greenVal = 0;
          blueVal = 0;
          continueFlag = false;
        }
      }
    }
    
  }
}

