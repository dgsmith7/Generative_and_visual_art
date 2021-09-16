class ColorRecord {
  
  color c;
  float numberOfOccurences;
  float percentage;
  
  ColorRecord (color c, float numberOfOccurences) {
    this.c = c;
    this.numberOfOccurences = numberOfOccurences;;
    this.percentage = numberOfOccurences / (img.width * img.height);
  }
  
}