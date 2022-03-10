color[] eachOne = {#486048, #183048, #789090, #607878, #304860, #f03030, 
                   #a8a8a8, #303030, #783030, #c01818, #481818, #181818, 
                   #f0f0f0, #781818, #d87878, #c0c0c0, #d8d8d8, #a87878, 
                   #d89090, #f0a8a8};
float[] percentage = {21.2, 18.3, 15.1, 14.3, 13.9, 6.9, 3.0, 1.6, 1.5, 1.4, 0.6, 0.4, 0.3, 0.3, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2};
int i = 0;

void setup () {
  size(500, 1250);
  noLoop();
}

void draw() {
  float total = 10;
  for (int i = 0; i < 5; i ++) {
    stroke(eachOne[i]);
    fill(eachOne[i]);
    rect(10, total , 480, (1100 * (percentage[i] / 100))); 
    total = total + (1100 * (percentage[i] /100));
    println(total / 1000);
  }
  
  float xt = 10;
  float nextt = total + sqrt(480 * (1100 * (percentage[5] / 100)));
  for (int j = 5; j < 8; j ++) {
        stroke(eachOne[j]);
    fill(eachOne[j]);
    rect(xt, total , sqrt(480 * (1100 * (percentage[j] / 100))), sqrt(480 * (1100 * (percentage[j] / 100)))); 
//    total = total + sqrt(480 * (1100 * (percentage[j] / 100)));
    xt = xt + sqrt(480 * (1100 * (percentage[j] / 100)));
  }
  
 xt = 10;
  float follt = nextt + sqrt(480 * (1100 * (percentage[8] / 100)));
  for (int j = 8; j < 15; j ++) {
        stroke(eachOne[j]);
    fill(eachOne[j]);
    rect(xt, nextt , sqrt(480 * (1100 * (percentage[j] / 100))), sqrt(480 * (1100 * (percentage[j] / 100)))); 
//    total = total + sqrt(480 * (1100 * (percentage[j] / 100)));
    xt = xt + sqrt(480 * (1100 * (percentage[j] / 100)));
  } 
  
  xt = 10;
  for (int j = 15; j < 20; j ++) {
        stroke(eachOne[j]);
    fill(eachOne[j]);
    rect(xt, follt , sqrt(480 * (1100 * (percentage[j] / 100))), sqrt(480 * (1100 * (percentage[j] / 100)))); 
//    total = total + sqrt(480 * (1100 * (percentage[j] / 100)));
    xt = xt + sqrt(480 * (1100 * (percentage[j] / 100)));
  }  writeIt();
}

void writeIt() {
  save("perectage");
}


void keyPressed() {
  i = i + 1;
  if (i > 19) {
    i = 0;
  }
}