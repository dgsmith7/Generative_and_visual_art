import controlP5.*;

ControlP5 cp5;

void initGUIControls() {
  int myColor = color(5);

  cp5 = new ControlP5(this);

  cp5.addSlider("hue1Slider")
    .setPosition(125, 500)
    .setWidth(200)
    .setHeight(30)
    .setRange(0, 100) // values can range from big to small as well
    .setValue(random(100))
    .setValueLabel("Hue 1")
    .setCaptionLabel("Hue 1 - upper left corner above")
    .setColor(new CColor(color(60, 25, 25),color(60, 40, 40),color(60, 55, 55),color(60, 0, 100),color(60, 0, 100)))
    ;

  cp5.addSlider("hue2Slider")
    .setPosition(550, 500)
    .setWidth(200)
    .setHeight(30)
    .setRange(0, 100) // values can range from big to small as well
    .setValue(random(100))
    .setValueLabel("Hue 2")
    .setCaptionLabel("Hue 2 - upper left corner above")
    .setColor(new CColor(color(60, 25, 25),color(60, 40, 40),color(60, 55, 55),color(60, 0, 100),color(60, 0, 100)))
    ;

  cp5.addSlider("baseSaturationSlider")
    .setPosition(125, 550)
    .setWidth(200)
    .setHeight(30)
    .setRange(0, 100) // values can range from big to small as well
    .setValue(random(70) + 25)
    .setValueLabel("Base saturation percentage")
    .setCaptionLabel("Saturation % for both")
    .setColor(new CColor(color(60, 25, 25),color(60, 40, 40),color(60, 55, 55),color(60, 0, 100),color(60, 0, 100)))
    ;

  cp5.addSlider("baseValueSlider")
    .setPosition(125, 600)
    .setWidth(200)
    .setHeight(30)
    .setRange(0, 100) // values can range from big to small as well
    .setValue(random(70) + 25)
    .setValueLabel("Base value percentage")
    .setCaptionLabel("Value % for both")
    .setColor(new CColor(color(60, 25, 25),color(60, 40, 40),color(60, 55, 55),color(60, 0, 100),color(60, 0, 100)))
    ;
}