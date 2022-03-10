/*

 Letter generator
 David Gail Smith
 July 2019
 
 */

boolean allOverMode = false;
Letter[] alphabet = new Letter[26];
PVector[] allOverCoords = new PVector[26];
float letterSize;
String word = "abcdefghijklmnopqrstuvwxyz";

void setup() {
  size(800, 500);
  background(175);
  letterSize = height/5;
  makeAlphabet();
}

void draw() {
  background(125);
  if (!allOverMode) {
    displayWord(word);
  } else {
    for (int i = 0; i < 26; i ++) {
      alphabet[i].display(allOverCoords[i].x, allOverCoords[i].y);
    }
  }
}

void makeAlphabet() {
  for (int i = 0; i < 26; i ++) {
    alphabet[i] = new Letter(0, height/2, letterSize);
  }
}

void displayWord(String w) {
  for (int i = 0; i < w.length(); i ++) {
    alphabet[int(w.charAt(i))-97].display((width/(w.length()+2)) * i + (width/(w.length())*1.2), 0);
  }
  textAlign(CENTER);
  textSize(32);
  fill(0);
  text(w, width/2, 50);
}

void rerackCoords() {
  for (int i = 0; i < 26; i ++) {
    allOverCoords[i] = new PVector(random(width), random(height/2));
  }
}

void keyPressed() {
  if (key == 'a') {
    allOverMode = !allOverMode;
    rerackCoords();
  } else {
    word = "";
    int len = int(random(13)) + 7;
    for (int i = 0; i < len; i ++) {
      word = word + char(int((random(26) + 97)));
    }
    rerackCoords();
  }
}
