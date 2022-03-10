int numberOfLayers = 13;
color top;
color bottom;
float alph;
float upperX;
float upperY;
float rightX;
float rightY;
float lowerX;
float lowerY;
float leftX;
float leftY;

void setup() {
  size(300, 300);
  upperX = width / 2;
  upperY = height / (numberOfLayers + 6);
  rightX = 8 * (width / 9);
  rightY = 3 * (height / (numberOfLayers + 6));
  lowerX = width / 2;
  lowerY = 6 * (height / (numberOfLayers + 6));
  leftX = width / 9;
  leftY = 3 * (height / (numberOfLayers + 6));
 noLoop();  
}

void draw() {
//  alph = map(mouseX, 0, width, 0, 255);
//  alph = 105;

//  purp: alph 40, 75, 150
  top = color(163, 24, 234, 150);
  bottom = color(25, 47, 229, 150);
//  sea: alph 45
//  top = color (27, 239, 245, 45);
//  bottom = color (50, 224, 188, 45);

// red green:
//  top = color (255, 0 ,0, 100);
//  bottom = color (0, 255, 0, 100);

  background(225);

//  fill(125, 255);
//  text(alph, 25, 675);

  stroke(230);
// noStroke();
  fill(bottom);
  quad(upperX, upperY + ((numberOfLayers - 1) * (height / (numberOfLayers + 6))), rightX, rightY + ((numberOfLayers - 1) * (height / (numberOfLayers + 6))), lowerX, lowerY + ((numberOfLayers - 1) * (height / (numberOfLayers + 6))), leftX, leftY + ((numberOfLayers - 1) * (height / (numberOfLayers + 6))));  
  for (float i = (numberOfLayers - 2); i > 0; i --) {
    fill(lerpColor(bottom, top, 1 - (i / numberOfLayers)));
    quad(upperX, upperY + (i * (height / (numberOfLayers + 6))), rightX, rightY + (i * (height / (numberOfLayers + 6))), lowerX, lowerY + (i * (height / (numberOfLayers + 6))), leftX, leftY + (i * (height / (numberOfLayers + 6))));
  } 
  fill(top);
  quad(upperX, upperY, rightX, rightY, lowerX, lowerY, leftX, leftY);

  save("layeredSquaresPurp3.png");
}