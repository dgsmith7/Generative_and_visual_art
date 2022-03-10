// Color Card Generator for Rolled Paper - by David G. Smith Feburauary 2, 2015
int redVal = 0;
int greenVal = 0;
int blueVal = 0;
int counter = 0;
String saveName;
int x = 410;
int y = 160;
boolean continueFlag = true;

void setup () {
  size (2060, 26100); 
  background (255);
  noLoop ();
}

void draw () {
  for (int sheetNum = 0; sheetNum < 7; sheetNum += 1) {
    for (int columnNum = 0; columnNum < 5; columnNum += 1) {
      for (int rowNum = 0; rowNum < 27; rowNum += 1) {
        if (continueFlag == true) {
          fill (redVal, greenVal, blueVal);
          rect ((x*columnNum)+10, (4350*sheetNum)+(y*rowNum)+10, 390, 150);
          fill (redVal, 0, 0);
          rect ((x*columnNum)+35, (4350*sheetNum)+(y*rowNum)+35, 100, 100);
          fill (0, greenVal, 0);
          rect ((x*columnNum)+155, (4350*sheetNum)+(y*rowNum)+35, 100, 100);
          fill (0, 0, blueVal);
          rect ((x*columnNum)+285, (4350*sheetNum)+(y*rowNum)+35, 100, 100);
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
        } // end if continueflag
      } // end rowNum
    } // end ColumnNum
  } // end sheetNum
  println ("finished!");
  save("Roll/sixRolls.png");
} // end draw