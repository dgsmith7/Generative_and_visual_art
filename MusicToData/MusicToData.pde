/**
 * Processing Sound Library, Example 5
 * 
 * This sketch shows how to use the FFT class to analyze a stream  
 * of sound. Change the variable bands to get more or less 
 * spectral bands to work with. The smooth_factor variable determines 
 * how much the signal will be smoothed on a scale form 0-1.
 */

import processing.sound.*;
boolean allFlag = true;

// Declare the processing sound variables 
SoundFile sample;
FFT fft;
AudioDevice device;
AudioIn in;
Amplitude rms;

// Declare a scaling factor
int scale = 4;
int ampScale = 2;

// Declare a smooth factor - amplitude example
float smoothFactor = 0.25;
// Used for smoothing - amplitude example
float sumAmpl;


// Define how many FFT bands we want
int bands = 128;  //must be a power of 2

// declare a drawing variable for calculating rect width
float r_width;

// Create a smoothing vector
float[] sum = new float[bands];

// Create a smoothing factor
float smooth_factor = 0.2;

void setup() {
  size(640, 360);
  background(255);

  // If the Buffersize is larger than the FFT Size, the FFT will fail
  // so we set Buffersize equal to bands
  device = new AudioDevice(this, 44000, bands);

  // Calculate the width of the rects depending on how many bands we have
  r_width = width/float(bands);

  // Load and play a soundfile and loop it. This has to be called 
  // before the FFT is created.
  sample = new SoundFile(this, "488__djgriffin__tibetan_chant_4_colargol_2.aiff");
  sample.loop();
//in = new AudioIn(this, 0);
//in.play();
  // Create and patch the FFT analyzer
  fft = new FFT(this, bands);
  //fft.input(in);
  fft.input(sample);
  // Create and patch the rms tracker
  rms = new Amplitude(this);
  rms.input(sample);
}      

void draw() {
  // Set background color, noStroke and fill color
  background(204);
  fill(0, 0, 255);
//  noStroke();

// for amplitude model
  sumAmpl += (rms.analyze() - sumAmpl) * smoothFactor;  
  // rms.analyze() return a value between 0 and 1. It's
  // scaled to height/2 and then multiplied by a scale factor
  float rmsScaled = sumAmpl * (height/2) * ampScale;
  fill(0, 0, map(rmsScaled, 0, height, 255, 0));
  // Draw an ellipse at a size based on the audio analysis
  ellipse(width/2, height/2, rmsScaled, rmsScaled);

  fft.analyze();
  for (int i = 0; i < bands; i++) {
    // Smooth the FFT data by smoothing factor
    sum[i] += (fft.spectrum[i] - sum[i]) * smooth_factor;
    fill(map(i, 0, bands, 255 , 0));
    int which = floor((map(mouseX, 0, width, 1, bands)));
    // Draw the rects with a scale factor
    if (i == which-1 && allFlag == false) {
    rect( i*r_width, height, r_width, -sum[i]*height*scale );
    } else if (allFlag == true) {
    rect( i*r_width, height, r_width, -sum[i]*height*scale );
    }
  }
  text("Band " + floor((map(mouseX, 0, width, 1, bands))), width*0.8, height*0.1);
}

void keyPressed() {
  allFlag = !allFlag;
}
