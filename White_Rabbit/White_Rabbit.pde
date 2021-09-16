//  Visualization of text in Alice in Wonderland by David G. Smith 27 Jan 2016

BufferedReader reader;
String line = "";
Record[] elements = new Record[27];
boolean countingFinished = false;
char currChar;
int asciiVal = 0;
int totalChars = 0;
int tempCount = 0;
int max = 0;
int min = 0;
final String fileName = "alice30.txt";
int[][] metaPicArray = new int[107730][2]; 
int state = 1; //   1=metaPic   and   -1=bar graph

void setup() {
  size(1050, 750);
  textAlign(CENTER);
  fill(75);
  countingFinished = false;
  reader = createReader(fileName);  
  initRecords();
  setPalette();
  // Retireve and analyze data outside "draw" loop
  while (countingFinished == false) {
    readAndParseFile();
  }  
  setMinAndMax();
  calculatePercentages();
  showStats();
}

void draw() {
  background(125);
  fill(0, 0, 0, 225);
  textSize(40);
  text ("Alice in Wonderland - data visualization", width/2, 50);
  textSize(20);
  text("Click to toggle between meta-picture and bar-graph.", width/2, 70);
  showKey();
  if (state == 1) {
    drawMetaPic();
  } else {
    showBarGraph();
  }
  if (mouseOnBox() == true) {
    elements[whichBox()].hoverDisplay();
  }
} 

void initRecords() {  // instantiates a record object for each element
  color tempColor;
  for (int i = 0; i < 27; i++) {
    elements[i] = new Record("name", 0.0, 0.0, color(random(255), random(255), random(255)), false, false);
    if (i != 26) {
      elements[i].setNameOfElement(str(char(i+97)));
    } else {
      elements[i].setNameOfElement("alice");
    }
  }
}

void setPalette () {  // set color scheme and alpha for each of the 27 elements
  elements[0].setElementColor(color(91, 88, 90, 175));
  elements[1].setElementColor(color(30, 46, 55, 175));
  elements[2].setElementColor(color(96, 99, 111, 175));
  elements[3].setElementColor(color(38, 55, 82, 175));
  elements[4].setElementColor(color(51, 72, 102, 175));
  elements[5].setElementColor(color(58, 98, 146, 175));
  elements[6].setElementColor(color(83, 11, 147, 175));
  elements[7].setElementColor(color(80, 129, 177, 175));
  elements[8].setElementColor(color(120, 159, 194, 175));
  elements[9].setElementColor(color(146, 179, 201, 175));
  elements[10].setElementColor(color(184, 196, 202, 175));
  elements[11].setElementColor(color(230, 232, 230, 175));
  elements[12].setElementColor(color(217, 201, 181, 175));
  elements[13].setElementColor(color(182, 168, 153, 175));
  elements[14].setElementColor(color(134, 104, 83, 175));
  elements[15].setElementColor(color(155, 128, 107, 175));
  elements[16].setElementColor(color(72, 48, 33, 175));
  elements[17].setElementColor(color(97, 69, 51, 175));
  elements[18].setElementColor(color(111, 86, 69, 175));
  elements[19].setElementColor(color(151, 143, 138, 175));
  elements[20].setElementColor(color(117, 111, 107, 175));
  elements[21].setElementColor(color(83, 79, 77, 175));
  elements[22].setElementColor(color(60, 56, 55, 175));
  elements[23].setElementColor(color(111, 135, 149, 175));
  elements[24].setElementColor(color(57, 86, 95, 175));
  elements[25].setElementColor(color(42, 75, 84, 175));
  elements[26].setElementColor(color(255, 0, 0, 175));
}

void readAndParseFile() {
  if (fileReady()) {
    line = line.toLowerCase();  // convert line to lower case
    for (int i = 0; i < line.length(); i++) {  // go character by character
      currChar = line.charAt(i);
      asciiVal = int(currChar);
      if ((asciiVal > 96 ) && (asciiVal < 123)) {// 'a' through 'z'
        totalChars += 1;
        tempCount = int(elements[(asciiVal-97)].getFreqCount());   // tally appropropraite record
        elements[(asciiVal-97)].setFreqCount(tempCount + 1); 
        if (currChar == 'a') {  // check to see if 'alice' is there
          if (itsAlice(i) == true) {  // tally alice record and highlight
            tempCount = int(elements[26].getFreqCount());
            elements[26].setFreqCount(tempCount + 1);
            for (int j = 0; j < 5; j++) {
              metaPicArray[totalChars+j][1] = 1;
            }
          }
        }
        metaPicArray[totalChars][0] = asciiVal-97;  // record for future display
      }
    }
  } else {// we're at the end of the file - set flag!!!
    countingFinished = true;
  }
}

boolean fileReady() { // Get next line if not at end of file or empty file 
  try {
    line = reader.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  if (line == null) {
    // Stop reading because of an error or file is empty
    return false;
  } else {
    return true;
  }
}

boolean itsAlice(int lineIndex) {  // looks forward to see if 'a' is beginning of 'alice'
  String curr5;
  if (lineIndex+5 <= line.length()) {
    curr5=line.substring(lineIndex, lineIndex+5);
  } else {
    curr5 = "nosir"; // a dummy false in case a is at end of string
  }
  if (curr5.equals("alice")) {
    return true;
  } else {
    return false;
  }
}

boolean mouseOnBox () {  // determines if mouse is over box fields on key
  if (((mouseX >= 35) && (mouseX < width-35))  &&  ((mouseY >= 705)&&(mouseY<= 725))) {
    return true;
  } else {
    return false;
  }
}

int whichBox() {  // determine which element over which mouse is hovering 
  int indexPosit = (mouseX-52)/35;
  return (indexPosit);
}

void setMinAndMax () {  // determine extremes and sets appropriate flags
  for (int i = 25; i >= 0; i--) {
    if (elements[i].getFreqCount() > elements[max].getFreqCount()) {
      max = i;
    }
    if (elements[i].getFreqCount() < elements[min].getFreqCount()) {
      min = i;
    }
  }
  elements[max].setIsMax(true);
  elements[min].setIsMin(true);
}

void calculatePercentages() {
  float tempPercent;
  for (int i = 0; i < 27; i++) {
    tempPercent = (round(((elements[i].getFreqCount()/float(totalChars))*10000)))/100.0;
    elements[i].setFreqPercentage(tempPercent); // 2 decimal places
  }
}

void showStats() { // Display stats on console
  for (int i = 0; i < 27; i++) {
    print("> "+elements[i].getNameOfElement()+"   Freq:"+elements[i].getFreqCount()+"    Percent:"+elements[i].getFreqPercentage()+"   ");
    if (elements[i].isMax == true) {
      print("<---MAX");
    }
    if (elements[i].isMin == true) {
      print("<---MIN");
    }
    println();
  }
  println("Total characters: "+totalChars);
}

void mouseClicked() {
  state = state * -1;
}

void drawMetaPic() { 
  int sidePad = 125;
  int top = 90;
  int wide = 399;
  int high = 270;
  int metaPicX;
  int metaPicY;
  // draw surrounding frame
  stroke (0);
  fill(125);
  rect(sidePad-1, top-1, wide*2+1, high*2);
  // draw 2x2 square for each letter
  for (int i = 0; i<totalChars; i++) {
    metaPicX = sidePad + (i%399)*2;
    metaPicY = top + (i/399)*2;
    noStroke();
    fill(elements[metaPicArray[i][0]].getElementColor());
    rect(metaPicX, metaPicY, 2, 2);
    // highlight every "alice"
    if (metaPicArray[i][1] == 1) {
      fill(255, 0, 0, 175);
      rect(metaPicX, metaPicY+1, 2, 1);
    }
  }
    fill(0, 0, 0, 175);
  text("Meta-picture of ducoment - one colored square per alphabetical character", width/2, 650);
}

void showKey() {
  for (int i = 0; i < 27; i ++) {
    stroke(elements[i].getElementColor());
    fill(elements[i].getElementColor());
    rect(35+(35*i)+17, 695, 32, 30);
    fill(0, 0, 0, 175);
    textSize(16);
    text(elements[i].getNameOfElement(), 67+(35*i)+4, 715);
    textSize(14);
  }
  text("Key for letters and colors: Hover MOUSE over boxes below for statistics.", 300, 685);
}

void showBarGraph() {
  float tallnessFactor = (300/(elements[max].getFreqCount()));
  float top = 450.0;//(elements[max].getFreqCount()*tallnessFactor)+450;  
  float barWidth = 32.0;  
  float sidePad = 35.0; 
  float bottom = 550.0;  //580;
  float onCenter = 35.0;
  //  draw support line
  stroke(0);
  line(sidePad-5, bottom+1, sidePad+(onCenter*27)+barWidth+10, bottom+1);  
  line(sidePad-5, bottom+2, sidePad+(onCenter*27)+barWidth+10, bottom+2);
  // draw bars sized for data and draw labels
  textSize(14);
  for (int i = 0; i < 27; i ++) {
    stroke(elements[i].getElementColor());
    fill(elements[i].getElementColor());
    rect(sidePad+(onCenter*i)+(onCenter/2), (bottom-(elements[i].getFreqCount()*tallnessFactor)), barWidth, (elements[i].getFreqCount()*tallnessFactor));
    fill(0, 0, 0, 175);
    text(elements[i].getNameOfElement(), sidePad+barWidth+(onCenter*i)+4, bottom-7);
    fill(200, 0, 0, 175);
    if (i == max) {
      text("Max", sidePad+(onCenter*i)+(onCenter), bottom-25);
    }
    if (i == min) {
      text("Min", sidePad+(onCenter*i)+(onCenter), bottom-25);
    }
  }

  fill(0, 0, 0, 175);
  text("Frequency of Characters", width/2, 580);
}