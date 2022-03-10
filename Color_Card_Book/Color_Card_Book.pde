// Color Card Generator for Rolled Paper - by David G. Smith Feburauary 2, 2015
int redVal = 255;  // initial red
int greenVal = 0;
int blueVal = 0;
int counter = 0;
String saveName;
int x = 700;
int y = 300;
boolean continueFlag = true;

void setup () {
  size (2100, 2700);
  background (255);
  noLoop ();
}

void draw () {
  for (int sheetNum = 8; sheetNum < 28; sheetNum += 9) {  //  these first two
    for (int columnNum = 0; columnNum < 3; columnNum += 1) {
      for (int rowNum = 0; rowNum < 9; rowNum += 1) {
        if (continueFlag == true) {
          fill (redVal, greenVal, blueVal);
          rect ((x*columnNum)+25, (y*rowNum)+25, 650, 250);
          fill (redVal, 0, 0);
          rect ((x*columnNum)+75, (y*rowNum)+75, 150, 150);
          fill (0, greenVal, 0);
          rect ((x*columnNum)+275, (y*rowNum)+75, 150, 150);
          fill (0, 0, blueVal);
          rect ((x*columnNum)+475, (y*rowNum)+75, 150, 150);
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
              if (redVal > 0) {//  set flag
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
   save("Pages2/Page"+(sheetNum+1)+".png");
 } // end sheetNum
  println ("finished!");
} // end draw

