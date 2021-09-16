float ogd = 500;
float gcx = 250;
float gcy = 150;
float gcd = 267;
float pointX, pointY;
float offsetPercent = 77;
float offset;
float angle;
int j = 0;
float firstX, firstY;
ArrayList<Blip> blips = new ArrayList<Blip>(); 
boolean doneFlag = false;

void setup () {
  size(700, 700);
  background(0);
  noFill();
//    noLoop();
  offset = (gcd/2) * offsetPercent / 100;
}

void draw () {

//  for (int i = 0; i < 360; i ++) {
    stroke(175);
      ellipse(width/2, height/2, ogd, ogd);
    gcx=(width/2) + cos(radians(j)) * ((ogd - gcd)/2);
    gcy=(height/2) + sin(radians(j)) * ((ogd - gcd)/2);
    pointX= gcx + cos(radians((360-j)*(ogd / gcd))) * offset;
    pointY= gcy + sin(radians((360-j)*(ogd / gcd))) * offset;
      stroke(0, 0, 255);
      line(gcx, gcy, pointX, pointY);
      stroke(255, 0 ,0);
//      strokeWeight(3);
            point(pointX, pointY);
    blips.add(new Blip(pointX, pointY, random(5, 7), color(random(255), random(255), random(255))));
    j++;
    //    println(j);
//    stroke(175);
//        ellipse(gcx, gcy, gcd, gcd);
//  }
//  showBlips();
  println(j);
}

void initBlips() {
}

void showBlips() {
  for (int i = 0; i < blips.size(); i ++) {
    Blip b1 = blips.get(i);
    b1.display();
  }
}

void keyPressed() {
  //  showBlips();
  redraw();
}