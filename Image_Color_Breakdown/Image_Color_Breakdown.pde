PImage img;
ArrayList<ColorRecord> allColors = new ArrayList<ColorRecord> ();
int sizeOfImage;
int totalAdds = 0;
boolean showIdx=false;
void setup () {
  size (1280, 1280); 
  background(255);  
  img = loadImage("Pixels2.png");
  img.loadPixels();
  sizeOfImage = img.width * img.height;
  image(img, 0, 0);
  noStroke();
  textSize(11);
  analyzeImage();

  noLoop();
}

void draw() {
//  background(255);
//  image(img, 0, 0);
//  recalculate();
  displayReport();
//saveFrame("report.png");
}

void analyzeImage() {
  color currentColor = img.pixels[0];
  println(sizeOfImage);
  //if (allColors.size() == 0) {         
  //  allColors.add(new ColorRecord(currentColor, 1));
  //  println("Added new record #" + 0);
  //}
  int counter = 0;
//  for (int i = 20; i < sizeOfImage; i = i + 20) {  // original i
    
    for (int k = 0; k < 1280; k = k + 20) {
      for (int j = 0 ; j < 1280; j = j + 20) {
int factor = 12;
        int i = k*1280 + j; 

        currentColor = img.pixels[i];
    int ccr = int(floor(red(img.pixels[i])/factor)*factor);
    int ccg = int(floor(green(img.pixels[i])/factor)*factor);
    int ccb = int(floor(blue(img.pixels[i])/factor)*factor);   
    currentColor =  color(ccr, ccg, ccb);
    println("I is " + i + "  The pixel is "+k+", "+j+"   The color is "+currentColor);
    noStroke(); fill(currentColor); rect(j,k,20,20); 
  //  background(255);
//    stroke(0);
//    fill(255);
//    println("Pixel " + i);
    if (notANewColor(currentColor)) {
      counter++;
      print (counter +"   ");
      countThisColor(currentColor, j, k);

//    print("Pixel " + i);
    }
    else {
      allColors.add(new ColorRecord(currentColor, 1));
      println("Added new record #" + (allColors.size()-1));
if(showIdx){fill(255);text(allColors.size()-1,j+2,k+15);}
    }
//  }  // original i
    }}
//  println();
}

boolean notANewColor(color currentColor) {
  int i = 0; 
  boolean match = false;
  while ((i <= allColors.size()-1) && (match == false)) {
    if (currentColor == allColors.get(i).c) {
      match = true;
    }
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

void countThisColor(color col, int j, int k) {
  for (int i = 0; i < allColors.size(); i ++) {
    if (col == allColors.get(i).c) {
      allColors.get(i).numberOfOccurences += 1;
      println("adding an ocurrence to record #"+i);
      totalAdds++;
if(showIdx){      fill(255);text(i,j+2,k+15);}

      //noStroke();
//      println(" - record#" + i + " occurrences = " + allColors.get(i).numberOfOccurences);
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
  int total = 0;
  for (int i = 0; i < allColors.size(); i ++) {
    //noStroke();
    //fill(allColors.get(i).c);
    //rect(25, (i * 7) + 5, 7,7);
    //text(i +" -     "+int(allColors.get(i).numberOfOccurences) + "     "+int(allColors.get(i).percentage) +"%"+"     R"+red(allColors.get(i).c)+" G"+green(allColors.get(i).c)+" B"+blue(allColors.get(i).c), 75, (i * 7) + 25);
//println(i +" - "+int(allColors.get(i).percentage) +"%"+"     R"+red(allColors.get(i).c)+" G"+green(allColors.get(i).c)+" B"+blue(allColors.get(i).c));
println(i +" -     "+int(allColors.get(i).numberOfOccurences) + "     "+int(allColors.get(i).percentage) +"%"+"     H"+ceil(map(hue(allColors.get(i).c),0,255,0,360))+" S"+ceil(map(saturation(allColors.get(i).c),0,255,0,100))+" B"+ceil(map(brightness(allColors.get(i).c),0,255,0,100)));
total+=(allColors.get(i).numberOfOccurences);
}
println(total);
}


void makePDF() {
  for (int i =0; i < allColors.size(); i ++) {
    
  }
}
