class ColorRecord {
  
  String colorName;
  color cVals;
  int x;
  int y;
  int selectOrder;
  boolean decider;
  int deciderNum;
  String p1Adj;
  String p2Adj;
  String n1Adj;
  String n2Adj;
  String noun1;
  String noun2;
  String verb1;
  String verb2;
  String object1;
  String object2;
  boolean decider2;
  int decider2Num;
  String pResultPart1;
  String pResultPart2;
  String nResultPart1;
  String nResultPart2;
  String adv1;
  String adv2;
  
  ColorRecord (String colorName, color cVals, int x, int y, int selectOrder) {
    this.colorName = colorName;
    this.cVals = cVals;
    this.x = x;
    this.y = y;
    this.selectOrder = selectOrder;
  }
  
  void display() {
    stroke(this.cVals);
    fill(this.cVals);
    rect(this.x, this.y, 50, 50);
  }
  
  boolean isClickedOn(int objectX, int objectY) {
    return (((x <= objectX) && (x + 50 >= objectX)) && ((y <= objectY) && (y + 50 >= objectY)));
  }

}