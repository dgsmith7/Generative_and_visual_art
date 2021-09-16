String hash = "0x11ac128f8b54949c12d04102cfc01960fc496813cbc3495bf77aeed738579738";
int parameters[] = new int[32];

void setup() {
  size(1600, 50);
  populateParameters();
  noStroke();
}

void draw() {
  background(0);
  for (int i = 0; i < 32; i++) {
    fill(0, 0, parameters[i]);
    rect(i * 50, 0, 50, 50);
  }
}

void populateParameters() {
  hash = hash.substring(2);
  for (int i= 0; i < 32; i++) {
    parameters[i] = unhex(hash.substring(i*2, i*2+2));
    println(i + " - " + parameters[i]);
  }
}
