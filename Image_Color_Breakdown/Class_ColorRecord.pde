class ColorRecord {
  
  color c;
  color c2;
  int numberOfOccurences;
  float percentage;
  
  ColorRecord (color c, int numberOfOccurences) {
    this.c = c;
    this.c2 = c;
    this.numberOfOccurences = numberOfOccurences;
    this.percentage = numberOfOccurences / (img.width * img.height);
  }
  
}
