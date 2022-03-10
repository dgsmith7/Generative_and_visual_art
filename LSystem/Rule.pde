class Rule {
  String in;
  String out;
  
  Rule(String i, String o) {
    this.in = i;
    this.out = o;
  }
  
  void display() {
    println(this.in + " - > " + this.out);
  }
}
