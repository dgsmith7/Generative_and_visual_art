/*
Lindenmeier System - classic fern
 recursive way of generating sentences over and over again using string replacement 
 */

String sentence = "X";
String newSentence = "";
Rule[] rules = new Rule[2];
float len = 250;
int wt = 7;
float angle = 25;

void setup() {
  size(800, 800);
  initRules();
  stroke(0);
  strokeWeight(wt);
  println(sentence);
  noLoop();
}

void draw() {
  strokeWeight(wt);
  displayResult();
}

void initRules() {
  rules[0] = new Rule("X", "F+[[X]-X]-F[-FX]+X");
  rules[1] = new Rule("F", "FF");
}

void generate() {
  boolean found = false;
  for (int i = 0; i < sentence.length(); i ++) {
    for (int j = 0; j < rules.length; j ++) {
      if (sentence.substring(i, i+1).equals(rules[j].in)) {
        newSentence = newSentence + rules[j].out;
        found = true;
      }
    }
    if (!found) {
      newSentence = newSentence + sentence.substring(i, i+1);
    }
    found = false;
  }
  sentence = newSentence;
  newSentence = "";
}

void displayResult() {
  //  background(255);
  translate(width/2, height * .9);
  for (int i = 0; i < sentence.length(); i ++) {
    switch (sentence.charAt(i)) {
    case 'F': 
      line(0, 0, 0, -len); 
      translate(0, -len); 
      break;
    case 'X': 
      break;
    case '-': 
      rotate(-radians(angle)); 
      break;
    case '+': 
      rotate(radians(angle)); 
      break;
    case '[': 
      pushMatrix(); 
      break;
    case ']':
      popMatrix(); 
      break;
    }
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("LSystemTree.png");
  } else {
    generate();
    println(sentence);
    redraw();
    len *= .5;
    wt --;
  }
}
