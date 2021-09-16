PImage img;
ArrayList<ColorRecord> allColors = new ArrayList<ColorRecord> ();
int sizeOfImage;

void setup () {
  size (500, 780); 
  background(255);  
  img = loadImage("TigerIndex16.png");
  img.loadPixels();
  sizeOfImage = img.width * img.height;
  analyzeImage();

  noLoop();
}

void draw() {
//  image(img, 0, 0);
  recalculate();
  displayReport();
}

void analyzeImage() {
  color currentColor = img.pixels[0];
  println(sizeOfImage);
  if (allColors.size() == 0) {         
    allColors.add(new ColorRecord(currentColor, 0));
    println("Added new record #" + 0);
  }
  for (int i = 1; i < sizeOfImage; i ++) {
    currentColor = img.pixels[i];
    background(255);
    stroke(0);
    fill(0);
//    println("Pixel " + i);
    if (notANewColor(currentColor)) {
      countThisColor(currentColor);
    print("Pixel " + i);
    }
    else {
      allColors.add(new ColorRecord(currentColor, 0.0));
      text("Added new record #" + (allColors.size()-1), 50, 50);
    }
  }
}

boolean notANewColor(color currentColor) {
  int i = 0; 
  boolean match = false;
  while ((i <= allColors.size()-1) && (match == false)) {
    if (currentColor == allColors.get(i).c) {match = true;}
    i ++;
  }
  if (match == true) {
    return true;
  }
  else {
    return false;
  }
}
  
  /*
  for (int i = 0; i < allColors.size(); i ++) {
    if (currentColor == allColors.get(i).c) {
      return true;
    }
  }
      return false;
}
*/

void countThisColor(color col) {
  for (int i = 0; i < allColors.size(); i ++) {
    if (col == allColors.get(i).c) {
      allColors.get(i).numberOfOccurences += 1;
      println(" - " + i + " occurrences = " + allColors.get(i).numberOfOccurences);
    }
  }
}

void recalculate() {
  float total = 0;
  for (int i = 0; i < allColors.size(); i ++) {
    total = total + allColors.get(i).numberOfOccurences;
    allColors.get(i).percentage = round((allColors.get(i).numberOfOccurences / sizeOfImage) * 100);
  }
  println(total);
}
void displayReport() {
  for (int i = 0; i < allColors.size(); i ++) {
    noStroke();
    fill(allColors.get(i).c);
    rect(25, (i * 35) + 5, 35, 35);
    text(int(allColors.get(i).percentage) +"%"+"     R"+red(allColors.get(i).c)+" G"+green(allColors.get(i).c)+" B"+blue(allColors.get(i).c), 75, (i * 35) + 25);
  }
}

void makePDF() {
  for (int i =0; i < allColors.size(); i ++) {
    
  }
}
