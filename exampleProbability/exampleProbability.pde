int selector = (int)random(10) + 1;
String message = "Press a key to change color.";

void setup() {
  size(250, 250);
  noStroke();
}

// Here I am simply using math and a conditional to set the 
// color of an ellipse.  Each time key is pressed, a new value
// is generated and the circle color is chosen using the new value 
// and the probabilities in the conditionals

void draw() {
  background(125);
// 30% of the time
  if (selector <= 3) { 
    fill(255, 0, 0);
  }
// 60% of the time
  else if (selector > 3 && selector <= 9) {
    fill(0, 255, 0);
  } 
// 10% of the time
  else {
    fill(0, 0, 255);
  }
  ellipse(width/2, height/2, 50, 50);
  fill(0);
  text(message, 10, 10);
  text("Selector is " + selector, 10, 25);
}

void keyPressed() {
  selector = (int)random(10) + 1;
}
