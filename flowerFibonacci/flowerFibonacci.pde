//  Fibonacci Flowers - David Gail Smith - Mar 2019  

ArrayList<Node> nodes = new ArrayList<Node>();
float nextAng = 0;
float angJump = 137.5;//222.48; //(golden ratio of 360 degrees aka 360 * 0.618)
float visRange = 1000;
float colorTop, colorBottom, noise1, noise2;
float noiseInc = 0.00075;

float r = 0;
int n = 0;

boolean looping = true;
PShape heart;

void setup() {
  size(900, 900);
  //fullScreen(P2D, 2);
  frameRate(60);
  colorMode(HSB, 360, 100, 100);
  //  visRange = .6 * dist(0, 0, width, height);
  //  visRange = min(width, height)/2 - 1;
  nodes.add(new Node(0));
  textSize(35);
  noStroke();
  heart = loadShape("heart.svg");
}

void draw() {
  background(0, 0, 99);

  r += 0.003;
  translate(width/2, height/2);
  rotate(r);
  translate(-width/2, -height/2);

  //  background(0, 0, 48);
  ellipse(width/2, height/2, 5, 5);
  colorTop = noise(noise1, noise2) * 360;
  colorBottom = noise(noise2, noise1) * 360;
  noise1 += noiseInc;
  noise2 += noiseInc;
  // for color change of entire blossom - uncomment lines 28 and 36
  //nodes.add(new Node(nextAng));

  // for subtle color change at inception uncomment line 31
  nodes.add(new Node(nextAng, color(colorBottom, 85, 85, 125)));  
  n++;
  if ((n == 30)) {
    n = 1;
  }
  for (int i = nodes.size() - 1; i >= 0; i--) {
    nodes.get(i).move();
    // for color change of entire blossom - uncomment lines 28 and 36
    //nodes.get(i).c = color(map(nodes.get(i).radius, 0, width/2.5, colorTop, colorBottom), 85, 85);    
    //    nodes.get(i).display();
    nodes.get(i).displayHeart();
    if (nodes.get(i).radius > visRange) {
      nodes.remove(i);
    }
  }
  nextAng += angJump;
  if (nextAng > 360) {
    nextAng = nextAng - 360;
  }
}

void mouseClicked() {
  if (looping == true) {
    looping = false; 
    noLoop();
  } else {
    looping = true;
    loop();
  }
}
