/*********************************
 * By David G. Smith, Feb 2016   *
 * Uses Naval Observatory Sun &  *
 * Moon Data from www            *
 *********************************/

import controlP5.*;
import java.util.*;

ControlP5 cp5;
Button monthDown;
Button monthUp;
Button dayDown;
Button dayUp;
Button yearDown;
Button yearUp;
Button hourDown;
Button hourUp;
Button minuteDown;
Button minuteUp;
Button locationDown;
Button locationUp;

color bgc = color(50);
color earthColor = color(80, 130, 20);
final color TEXT_COLOR = color(75);
final color CLOCK_COLOR = color (100);
final color LABEL_COLOR = color(150);
final color CONTROL_BGC = color(200);
final int BUTTON_SIZE = 20;
final int BUTTON_GAP = 10;
final float SUN_DIAM = 75;
final color SUN_COLOR = color(255, 255, 0, 150);
final float MOON_DIAM = 45;
final color MOON_COLOR = color(130, 150, 150, 125);

Record currentInfo;
/*
float beginCivil = 6;
 float sunrise = 6.5;
 float sunset = 18.5;
 float endCivil = 19.0;
 float moonrise = 19.0;
 float moonset = 6.0;
 float prevRise = 0;
 float illum;
 String phase;
 String closestPhase;
 String cpDate;
 String cpTime;
 */

float clockX = 75;
float clockY = 75;
final float CLOCK_DIAMETER = 100;

int year = year();
int month = month();
int day = day();
int hour = hour();
int minute = minute();
String sDay = str(day);
String sMonth = str(month);
String sHour = str(hour);
String sMin = str(minute);
String[] months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
String[] locations = {"Honolulu", "Oakland", "Denver", "Dallas", "Pittsburgh"};
String[] states = {"HI", "CA", "CO", "TX", "PA"};
int[] daysInMonth = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
int whichLocation = 0;

JSONObject sunAndMoonForOneDay;

void setup() {
  cp5 = new ControlP5(this);
  initControls();
  size(1000, 500);
  bgc = color(125, 125, 125);
  background(bgc);
  loadData();
  textSize(20);
  textAlign(CENTER);
}

void draw() {
  background(bgc);
  paintSkyIllumination();
  fill(125);
  showClock(clockX, clockY);
  showSelectedMonth();
  showSelectedDay();
  showSelectedYear();
  showSelectedLocation();
  showSelectedTime();
  drawSunArc();
  drawMoonArc();
  drawEarth();
  stroke(bgc); 
  fill(bgc);
}

void loadData() {
  JSONArray sunData;
  JSONArray moonData;
  JSONArray prevMoonData;
  JSONArray closestPhase;
  JSONObject set;
  String tempStr = "";
  String querryString = "http://api.usno.navy.mil/rstt/oneday?date=" + (month + 1) + "/" + day + "/" + year + "&loc=" + locations[whichLocation] + ",%20" + states[whichLocation] + "";  
  sunAndMoonForOneDay = loadJSONObject(querryString);
  //  sunAndMoonForOneDay = loadJSONObject("http://api.usno.navy.mil/rstt/oneday?date=2/28/2016&loc=Dallas,%20TX");
  currentInfo = new Record();
  currentInfo.latitude = sunAndMoonForOneDay.getFloat("lat");
  currentInfo.longitude = sunAndMoonForOneDay.getFloat("lon");
  sunData = sunAndMoonForOneDay.getJSONArray("sundata");
  for (int i = 0; i < sunData.size(); i ++) {
    set = sunData.getJSONObject(i);
    if (set.getString("phen").equals("BC")) {
      tempStr = set.getString("time");
      currentInfo.bct = parseForTime(tempStr);
    }
    if (set.getString("phen").equals("R")) {
      tempStr = set.getString("time");
      currentInfo.sunrise =  parseForTime(tempStr);
    }
    if (set.getString("phen").equals("S")) {
      tempStr = set.getString("time");
      currentInfo.sunset =  parseForTime(tempStr);
    }
    if (set.getString("phen").equals("EC")) {
      tempStr = set.getString("time");
      currentInfo.ect =  parseForTime(tempStr);
    }
  }
  moonData = sunAndMoonForOneDay.getJSONArray("moondata");
  for (int i = 0; i < moonData.size(); i ++) {
    set = moonData.getJSONObject(i);
    if (set.getString("phen").equals("R")) {
      tempStr =  set.getString("time");
      currentInfo.moonrise = parseForTime(tempStr);
    }
    if (set.getString("phen").equals("S")) {
      tempStr = set.getString("time");
      currentInfo.moonset = parseForTime(tempStr);
    }
  }
/*
prevMoonData = sunAndMoonForOneDay.getJSONArray("prevmoondata");
  for (int i = 0; i < prevMoonData.size(); i ++) {
    set = prevMoonData.getJSONObject(i);
    if (set.getString("phen").equals("R")) {
      tempStr = set.getString("time");
      currentInfo.moonrisePrev = parseForTime(tempStr);
    }
    if (set.getString("phen").equals("S")) {
      tempStr  = set.getString("time"); 
      currentInfo.moonsetPrev = parseForTime(tempStr);
    }
  }
  */
  
  set = sunAndMoonForOneDay.getJSONObject("closestphase");
  currentInfo.closestPhase = set.getString("phase");
  currentInfo.cpDate = set.getString("date");
  currentInfo.cpTime = set.getString("time");
  // tempStr = sunAndMoonForOneDay.getString("fracillum");
  // currentInfo.moonIllum = float(trim(tempStr.substring(0, tempStr.length() - 1)));
  // currentInfo.phase = sunAndMoonForOneDay.getString("curphase");

  // currentInfo.display();
}

float parseForTime(String tempStr) {
  String tempStr2 = "";
  String tempStr3 = "";
  float tempMin = 0;
  float tempHour = 0;
  tempStr2 = tempStr.substring(tempStr.length() - 8, tempStr.length()); 
  tempStr3 = tempStr.substring(0, tempStr.length() - 8);
  tempMin = float(trim(tempStr3.substring(tempStr3.length()-2, tempStr3.length())));
  if (tempStr3.length() < 5) {
    tempHour = float(trim(tempStr3.substring(0, 1)));
  } else {
    tempHour = float(trim(tempStr3.substring(0, 2)));
  } 
  if (tempStr2.substring(1, 2).equals("p")) {
    tempHour = tempHour + 12.0;
  }
  return tempHour + (tempMin / 60.0);
}

void initControls() {
  cp5.addSlider("sliderTime")
    .setPosition(100, 425)
    .setRange(0, 24)
    .setSize(800, 20)
    .setCaptionLabel("Time of Day")
    .setLabelVisible(false)
    .setSliderMode(Slider.FLEXIBLE);
  cp5.addButton("monthDown")
    .setValue(0)
    .setPosition(3.55 * (width / 10) - (BUTTON_GAP / 2) - BUTTON_SIZE, 3 * (height / 5) + (BUTTON_GAP / 2))
    .setSize(BUTTON_SIZE, BUTTON_SIZE)
    .setCaptionLabel("-");
  cp5.addButton("monthUp")
    .setValue(0)
    .setPosition(3.55 * (width / 10) + (BUTTON_GAP / 2), 3 * (height / 5) + (BUTTON_GAP / 2))
    .setSize(BUTTON_SIZE, BUTTON_SIZE)
    .setCaptionLabel("+");
  cp5.addButton("dayDown")
    .setValue(0)
    .setPosition(4.3 * (width / 10) - (BUTTON_GAP / 2) - BUTTON_SIZE, 3 * (height / 5) + (BUTTON_GAP / 2))
    .setSize(BUTTON_SIZE, BUTTON_SIZE)
    .setCaptionLabel("-");
  cp5.addButton("dayUp")
    .setValue(0)
    .setPosition(4.3 * (width / 10) + (BUTTON_GAP / 2), 3 * (height / 5) + (BUTTON_GAP / 2))
    .setSize(BUTTON_SIZE, BUTTON_SIZE)
    .setCaptionLabel("+");
  cp5.addButton("yearDown")
    .setValue(0)
    .setPosition(5.05 * (width / 10) - (BUTTON_GAP / 2) - BUTTON_SIZE, 3 * (height / 5) + (BUTTON_GAP / 2))
    .setSize(BUTTON_SIZE, BUTTON_SIZE)
    .setCaptionLabel("-");
  cp5.addButton("yearUp")
    .setValue(0)
    .setPosition(5.05 * (width / 10) + (BUTTON_GAP / 2), 3 * (height / 5) + (BUTTON_GAP / 2))
    .setSize(BUTTON_SIZE, BUTTON_SIZE)
    .setCaptionLabel("+");
  cp5.addButton("hourDown")
    .setValue(0)
    .setPosition(5.8 * (width / 10) - (BUTTON_GAP / 2) - BUTTON_SIZE, 3 * (height / 5) + (BUTTON_GAP / 2))
    .setSize(BUTTON_SIZE, BUTTON_SIZE)
    .setCaptionLabel("-");
  cp5.addButton("hourUp")
    .setValue(0)
    .setPosition(5.8 * (width / 10) + (BUTTON_GAP / 2), 3 * (height / 5) + (BUTTON_GAP / 2))
    .setSize(BUTTON_SIZE, BUTTON_SIZE)
    .setCaptionLabel("+");
  cp5.addButton("minuteDown")
    .setValue(0)
    .setPosition(6.45 * (width / 10) - (BUTTON_GAP / 2) - BUTTON_SIZE, 3 * (height / 5) + (BUTTON_GAP / 2))
    .setSize(BUTTON_SIZE, BUTTON_SIZE)
    .setCaptionLabel("-");
  cp5.addButton("minuteUp")
    .setValue(0)
    .setPosition(6.45 * (width / 10) + (BUTTON_GAP / 2), 3 * (height / 5) + (BUTTON_GAP / 2))
    .setSize(BUTTON_SIZE, BUTTON_SIZE)
    .setCaptionLabel("+");
  cp5.addButton("locationDown")
    .setValue(0)
    .setPosition(width /2 - (BUTTON_GAP / 2) - BUTTON_SIZE, (height / 2) + (BUTTON_GAP / 2))
    .setSize(BUTTON_SIZE, BUTTON_SIZE)
    .setCaptionLabel("-");
  cp5.addButton("locationUp")
    .setValue(0)
    .setPosition(width /2 + (BUTTON_GAP / 2), (height / 2) + (BUTTON_GAP / 2))
    .setSize(BUTTON_SIZE, BUTTON_SIZE)
    .setCaptionLabel("+");
}

void paintSkyIllumination() { // modify to add color and evening moon illumination from data
  float rDimFactor;
  float gDimFactor;
  float bDimFactor;
  float now = hour + (minute / 60.0);
  if ((0 <= now) && ( now < currentInfo.bct)) {
    bgc = color (0, 0, 0); 
    background(bgc);
  }
  if ((currentInfo.bct <= now) && ( now < currentInfo.sunrise)) {
    rDimFactor = (now - currentInfo.bct) * (20 / (currentInfo.sunrise - currentInfo.bct)) + 80; 
    gDimFactor = (now - currentInfo.bct) * (70 / (currentInfo.sunrise - currentInfo.bct)) + 110; 
    bDimFactor = (now - currentInfo.bct) * (80 / (currentInfo.sunrise - currentInfo.bct)) + 120;
    bgc = color(rDimFactor, gDimFactor, bDimFactor); 
    background(bgc);
  }
  if ((currentInfo.sunset <= now) && ( now < currentInfo.ect)) {
    rDimFactor = (now - currentInfo.sunset) * (20 / (currentInfo.ect-currentInfo.sunset)); 
    gDimFactor = (now - currentInfo.sunset) * (70 / (currentInfo.ect-currentInfo.sunset)); 
    bDimFactor = (now - currentInfo.sunset) * (80 / (currentInfo.ect-currentInfo.sunset)); 
    bgc = color(100 - rDimFactor, 180 - gDimFactor, 200 - bDimFactor); 
    background(bgc);
  }
  if ((currentInfo.ect <= now) && ( now < 24)) {
    bgc = color (0, 0, 0); 
    background(bgc);
  }
}


void showClock(float x, float y) {
  float hAngle;
  float mAngle;
  int adjHour = hour;
  if (hour > 12) {
    adjHour = hour - 12;
  }
  hAngle = adjHour * (TWO_PI / 12) - HALF_PI;
  mAngle = minute * (TWO_PI / 60) - HALF_PI;
  strokeWeight(2);
  stroke(CLOCK_COLOR);
  noFill();
  ellipse(x, y, CLOCK_DIAMETER, CLOCK_DIAMETER);
  line(x, y, x + (CLOCK_DIAMETER / 3) * cos(hAngle), y + (CLOCK_DIAMETER / 3) * sin(hAngle));
  line(x, y, x + (CLOCK_DIAMETER / 2.5) * cos(mAngle), y + (CLOCK_DIAMETER / 2.5) * sin(mAngle));
  strokeWeight(1);
}

void showSelectedMonth() {
  fill(TEXT_COLOR);
  text(months[month], 3.55 * (width / 10), 3 * (height / 5));
}

void showSelectedDay() {
  fill(TEXT_COLOR);
  text(day + ",", 4.3 * (width / 10), 3 * (height / 5));
}

void showSelectedYear() {
  fill(TEXT_COLOR);
  text(year, 5.05 * (width / 10), 3 * (height / 5));
}

void showSelectedLocation() {
  fill(TEXT_COLOR);
  text(locations[whichLocation] + ", " + states[whichLocation], width/2, height / 2);
}

void showSelectedTime() {
  fill(TEXT_COLOR);
  text(sHour + " : " + sMin, 6.15 * (width / 10), 3 * (height / 5));
}

void drawEarth() {
  fill(earthColor);
  rect(0, 4 * (height / 5), width, (height / 5));
  textSize(18);
  fill(TEXT_COLOR);
  text("Time of day", width / 2, 475);
}

void drawSunArc () {
  float now = hour + (minute / 60.0);
  float nowAngle = PI + (PI / (currentInfo.sunset - currentInfo.sunrise)) * (now - currentInfo.sunrise); 
  float arcDiam = (width / 10) * 7.75;
  float sunX = (width / 2) + cos(nowAngle) * (arcDiam / 2);
  float sunY = ((4 * (height / 5)) + sin(nowAngle) * (arcDiam / 2)) + (SUN_DIAM / 2);
  fill(SUN_COLOR);
  noStroke();
  if ((now >= currentInfo.sunrise) && (now <= currentInfo.sunset)) {
    ellipse(sunX, sunY, SUN_DIAM, SUN_DIAM);
  }
}

void drawMoonArc() {
  boolean prevMoon = false;
  float prevMoonrise =  currentInfo.moonrise;  // get previous one)
  if (currentInfo.moonrise > currentInfo.moonset) {
    prevMoon = true;
  }
  float now = hour + (minute / 60.0);
  float nowAngle = PI + (PI / (currentInfo.moonset - currentInfo.moonrise)) * (now - currentInfo.moonrise); 
  float arcDiam = (width / 10) * 6.;
  float moonX = (width / 2) + cos(nowAngle) * (arcDiam / 2);
  float moonY = ((4 * (height / 5)) + sin(nowAngle) * (arcDiam / 2)) + (MOON_DIAM / 2);
  fill(MOON_COLOR);
  noStroke();
  if ((!prevMoon) && (now >= currentInfo.moonrise) && (now <= currentInfo.moonset)) {
    ellipse(moonX, moonY, MOON_DIAM, MOON_DIAM);
  }
  if (prevMoon) {
    if (now < currentInfo.moonset) {
      nowAngle = PI + (PI / ((24 - prevMoonrise) + currentInfo.moonset)) * ((24 - prevMoonrise) + (now)); 
      arcDiam = (width / 10) * 6.;
      moonX = (width / 2) + cos(nowAngle) * (arcDiam / 2);
      moonY = ((4 * (height / 5)) + sin(nowAngle) * (arcDiam / 2)) + (MOON_DIAM / 2);
      ellipse(moonX, moonY, MOON_DIAM, MOON_DIAM);
    }
    if (now > currentInfo.moonrise) {
      nowAngle = PI + (PI / ((24 - prevMoonrise) + currentInfo.moonset)) * ((now - currentInfo.moonrise)); 
      arcDiam = (width / 10) * 6.;
      moonX = (width / 2) + cos(nowAngle) * (arcDiam / 2);
      moonY = ((4 * (height / 5)) + sin(nowAngle) * (arcDiam / 2)) + (MOON_DIAM / 2);
      ellipse(moonX, moonY, MOON_DIAM, MOON_DIAM);
    }
  }
}

void drawSunHover() {
}

void drawMoonHover() {
}

public void monthDown() {
  month = month - 1;
  if (month == -1) {
    month = 11;
  }
  checkForLeapYear(false);
}

public void monthUp() {
  month = month + 1;
  if (month == 12) {
    month = 0;
  }
  checkForLeapYear(true);
}

public void dayDown() {
  day = day - 1;
  if (day == 0) {
    day = daysInMonth[month];
  }
  checkForLeapYear(false);
}

public void dayUp() {
  day = day + 1;
  if (day == daysInMonth[month] + 1) {
    day = 1;
  }
  checkForLeapYear(true);
}

public void yearDown() {
  year = year - 1;
  if (year == 1699) {
    year = 2100;
  }
  checkForLeapYear(false);
}

public void yearUp() {
  year = year + 1;
  if (year == 2101) {
    year = 1700;
  }
  checkForLeapYear(true);
}

public void hourDown() {
  hour = hour - 1;
  if (hour == -1) {
    hour = 23;
  }
  fixTimeStrings();
  adjustSliderToTime();
}

public void hourUp() {
  hour = hour + 1;
  if (hour == 24) {
    hour = 0;
  }
  fixTimeStrings();
  adjustSliderToTime();
}

public void minuteDown() {
  minute = minute - 1;
  if (minute == -1) {
    minute = 59;
  }
  fixTimeStrings();
  adjustSliderToTime();
}

public void minuteUp() {
  minute = minute + 1;
  if (minute == 60) {
    minute = 0;
  }
  fixTimeStrings();
  adjustSliderToTime();
}

public void locationDown() {
  whichLocation = whichLocation - 1;
  if (whichLocation == -1) {
    whichLocation = 4;
  }
}

public void locationUp() {
  whichLocation = whichLocation + 1;
  if (whichLocation == 5) {
    whichLocation = 0;
  }
}

void checkForLeapYear(boolean upFlag) {
  if ((year % 4 != 0) && (month == 1) && (day > 28)) { // not leap year but is Feb
    if ((upFlag)) {
      day = 1;
    } else {
      day = 28;
    }
  }
}

void fixTimeStrings() {
  if (hour < 10) {
    sHour = "0" + str(hour);
  } else {
    sHour = str(hour);
  }
  if (minute < 10) {
    sMin = "0" + str(minute);
  } else {
    sMin = str(minute);
  }
  if (day < 10) {
    sDay = "0" + str(day);
  } else {
    sDay = str(day);
  }
  if (month < 10) {
    sMonth = "0" + str(month);
  } else {
    sMonth = str(month);
  }
}

void sliderTime() {
  adjustTimeToSlider();
}

void adjustSliderToTime() {
  float adjMin = minute / 60.0;
  float adjTime = hour + adjMin;
  cp5.getController("sliderTime").setValue(adjTime);
}

void adjustTimeToSlider() {
  if (cp5.getController("sliderTime").isMousePressed()) {
    float adjTime = cp5.getController("sliderTime").getValue();
    hour = int(adjTime);
    minute=round(((adjTime - hour) * 60));
    fixTimeStrings();
  }
}

void mouseReleased() {
  loadData();
}