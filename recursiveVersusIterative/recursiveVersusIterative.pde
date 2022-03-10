int val = 7;

void setup () {
  noLoop();
}

void draw() {
  println(recursiveFactorial(val));
  println(iterativeFactorial(val));
}

int recursiveFactorial(int v) {
  if (v == 0) {
    return 1;
  } else {
    return v * recursiveFactorial(v - 1);
  }
}

int iterativeFactorial(int v) {
  int result = 1;
  while (v > 0) {
    result = result * v;
    v --;
  }
  return result;
}
