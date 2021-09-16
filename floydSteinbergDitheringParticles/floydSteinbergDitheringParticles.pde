PImage img;
String fileName = "close-up soft edge.jpg";//WING10.jpg";//";
Particle[] particles = new Particle[128400];

void setup() {
  size(1202, 794, P2D);//1200, 428);//(600, 214);//1202, 794);
  img = loadImage(fileName);
  img.loadPixels();
//  noLoop();
}

void draw() {
  background(125);
  image(img, 0, 0);
  img.filter(GRAY);
  dither();
  img.loadPixels();
//  buildParticles();
  img.updatePixels();
  image(img, 0, 0);
  //for (int i = 0; i < particles.length; i ++) {
  //  particles[i].display();
  //}
}

void dither() {
  println("Dithering image...");
  float errorR, errorG, errorB;
  color oldPixel, newPixel;
  for (int i = 1; i < img.pixels.length-width-1; i++) {
    oldPixel = img.pixels[i];
    int factor = 3;
    int r = round(red(oldPixel));
    int g = round(green(oldPixel));
    int b = round(blue(oldPixel));
    int newR = round(factor * (r/255)*(255/factor));
    int newG = round(factor * (g/255)*(255/factor));
    int newB = round(factor * (b/255)*(255/factor));
    newPixel = color(newR, newG, newB);
    img.pixels[i] = newPixel;
errorR = r - newR;
errorG = g - newG;
errorB = b - newB;
    img.pixels[i+1] = color(red(img.pixels[i+1]) + errorR * (7.0/16.0),
                            green(img.pixels[i+1]) + errorG * (7.0/16.0),
                            blue(img.pixels[i+1]) + errorB * (7.0/16.0));
    img.pixels[i-1+width] = color(red(img.pixels[i-1+width]) + errorR * (3.0/16.0),
                            green(img.pixels[i-1+width]) + errorG * (3.0/16.0),
                            blue(img.pixels[i-1+width]) + errorB * (3.0/16.0));
    img.pixels[i+width] = color(red(img.pixels[i+width]) + errorR * (5.0/16.0),
                            green(img.pixels[i+width]) + errorG * (5.0/16.0),
                            blue(img.pixels[i+width]) + errorB * (5.0/16.0));
    img.pixels[i+width+1] = color(red(img.pixels[i+width+1]) + errorR * (1.0/16.0),
                            green(img.pixels[i+width+1]) + errorG * (1.0/16.0),
                            blue(img.pixels[i+width+1]) + errorB * (1.0/16.0));
   
  } 
}

void buildParticles() {
  println("Building particle array...");
  for (int i = 0; i < img.pixels.length; i ++) {
    particles[i] =  new Particle(i, i % int(width/2), i/int(width/2), img.pixels[i]); 
  }
}
/*
for each y from top to bottom
   for each x from left to right
      oldpixel  := pixel[x][y]
      newpixel  := find_closest_palette_color(oldpixel)
      pixel[x][y]  := newpixel
      quant_error  := oldpixel - newpixel
      pixel[x + 1][y    ] := pixel[x + 1][y    ] + quant_error * 7 / 16
      pixel[x - 1][y + 1] := pixel[x - 1][y + 1] + quant_error * 3 / 16
      pixel[x    ][y + 1] := pixel[x    ][y + 1] + quant_error * 5 / 16
      pixel[x + 1][y + 1] := pixel[x + 1][y + 1] + quant_error * 1 / 16


find_closest_palette_color(oldpixel) = round(oldpixel / 255)
*/
