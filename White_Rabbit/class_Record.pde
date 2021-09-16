class Record {

  String nameOfElement;
  float freqCount; 
  float freqPercentage;
  color elementColor;
  boolean isMin, isMax;

  Record(String nameOfElement, float freqCount, float freqPercentage, color elementColor, boolean isMin, boolean isMax) {
    this.nameOfElement = nameOfElement;
    this.freqCount = freqCount;
    this.freqPercentage = freqPercentage;
    this.elementColor = elementColor;
    this. isMin = isMin;
    this.isMax = isMax;
  }

  String getNameOfElement() {
    return this.nameOfElement;
  }

  float getFreqCount() {
    return this.freqCount;
  }

  float getFreqPercentage() {
    return this.freqPercentage;
  }

  color getElementColor() {
    return this.elementColor;
  }

  boolean getIsMin() {
    return this.isMin;
  }

  boolean getIsMax() {
    return this.isMax;
  }

  void setNameOfElement(String n) {
    this.nameOfElement = n;
  }

  void setFreqCount(float fc) {
    this.freqCount = fc;
  }

  void setFreqPercentage(float fp) {
    this.freqPercentage = fp;
  }

  void setElementColor(color c) {
    this.elementColor = c;
  }

  void setIsMin(boolean flag) {
    this.isMin = flag;
  }

  void setIsMax(boolean flag) {
    this.isMax = flag;
  }

  void hoverDisplay() {
    float startSlice;
    float endSlice;
    int top = 150;
    // Statistics
    stroke(0, 0, 0);
    fill(this.elementColor);
    rect(225, top, 600, 350);
    fill(0, 0, 0);
    textAlign(LEFT);
    textSize(60);
    text(this.nameOfElement, 500, top+100);
    textSize(20);
    text("Frequency: " + int(this.freqCount) + " occurences.", 500, top+250);
    if (this.isMin == true) {
      text("This is the least frequent letter.", 500, top+150);
    }
    if (this.isMax==true) {
      text("This is the most frequent letter.", 500, top+150);
    }
    text("Total letters parsed: " + totalChars, 500, top+200);
    if (this.nameOfElement != "alice") {
      text("Percentage: " + this.freqPercentage+"%", 500, top+300);
      // Pie chart
      startSlice = 0;
      endSlice = ((this.freqPercentage*.01) * TWO_PI);
      stroke(0, 0, 0);
      fill(this.elementColor);
      arc(300, top+45, 200, 200, startSlice, endSlice, PIE); // slice
      arc(350, top+225, 200, 200, endSlice, TWO_PI, PIE); // remainder
    }
    textAlign(CENTER);
  }
}