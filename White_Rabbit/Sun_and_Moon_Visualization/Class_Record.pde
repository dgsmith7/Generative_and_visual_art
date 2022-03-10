class Record {

  float latitude;
  float longitude;
  float bct;
  float sunrise;
  float sunset;
  float ect;
  float moonrise;
  float moonrisePrev;
  float moonsetPrev;
  float moonset;
  String moonPhase;
  float moonIllum;
  String phase;
  String closestPhase;
  String cpDate;
  String cpTime;

  Record() {
  }

  void display() {
    println(latitude);
    println(longitude);
    println(bct);
    println(sunrise);
    println(sunset);
    println(ect);
    println(moonrise);
    println(moonrisePrev);
    println(moonsetPrev);
    println(moonset);
    println(moonPhase);
    println(moonIllum);
    println(phase);
    println(closestPhase);
    println(cpDate);
    println(cpTime);
  }
}