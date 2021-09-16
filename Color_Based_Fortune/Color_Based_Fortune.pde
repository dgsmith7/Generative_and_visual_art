
ColorRecord[] allColors = new ColorRecord[8];
String[] colorName = {"Red", "Blue", "Yellow", "Green", "Orange", "Violet", "Brown", "Black"};
color[] cVals = {color(255, 0, 0, 125), color(0, 0, 255, 125), color(255, 255, 0, 125), color(0, 255, 0, 125), color(255, 127, 0, 125), color(127, 0, 255, 125), color(160, 160, 80, 125), color(0, 0, 0, 125)};
boolean[] decider = {true, true, false, true, false, true, false, false};
int[] deciderNum = {1, 2, 1, 1, 2, 2, 1, 2};
String[] p1Adj = {"brave and strong", "smart and concise", "balanced and rested", "optimistic and confident", "warm and comfortable", "true and spiritual", "srious and supportive", "safe and efficient"};
String[] p2Adj = {"warm and exciting", "trustful and efficient", "peaceful and harmonious", "friendly and creative", "fun and sensual", "luxurious and visionary", "warm and reliable", "sophisticated and substantial"};
String[] n1Adj = {"aggressive and defient", "cold and aloof", "boring and draining", "fearful and irrational", "deprived and frustrating", "introverted and informal", "heavy and not-so-fun", "cold and oppressive"};
String[] n2Adj = {"strained and ugly", "unkind and numbing", "stagnant and plain", "depressed and anxious", "frivilous and immature", "supressed and over-indulgent", "boring and unsophisticated", "heavy and menacing"};
String[] noun1 = {"fireman", "soldier", "hippie", "shaman", "rescue worker", "pilot or flight attendant", "lumberjack", "drunken sailor"};
String[] noun2 = {"woman riding a horse", "mailman", "exterminator", "librarian", "farm hand", "sexual interest of yours", "shrimp-boat captain", "satanist"};
String[] verb1 = {"gives you a", "praises you about your", "toasts you because of your", "builds a shrine for your", "lights on fire your", "makes love to you for your", "sings a merry song about your", "smells your"};
String[] verb2 = {"takes from you a", "scolds you about your", "watches you with your", "raises money for your", "pours orange paint on your", "spits on you because of your", "sees your", "drinks from your"};
String[] object1 = {"bomb", "new car", "collection of squids", "rather large genitalia", "shaven monkey", "holy grail", "kung-fu skills", "hairy back"};
String[] object2 = {"pair of velvet underwear", "wallet", "nasty sock", "presonal hygiene habits", "gilded yak", "rigid-hull inflatable boat", "pet Liger", "unsightly nose hair"};
boolean[] decider2 = {true, false, false, false, true, true, true, false};
int[] decider2Num = {2, 1, 2, 2, 1, 1, 2, 1};
String[] pResultPart1 = {"a box of money", "the tooth fairy", "you", "you", "your enemies", "world peace", "a winged kitten flying into your lap", "the dark lord"};
String[] pResultPart2 = {"landing in your back yard", "bringing you all of your teeth in a jeweled sack", "being granted total elightnment by the Dali Laama", "being sexually gratified aboad a UFO during an alien abduction", "spontaneously combusting and you becoming forever free of strife", "being restored", "while riding a unicorn", "granting you supreme power over everything in his realm"};
String[] nResultPart1 = {"a herd of stampeding buffalo", "a ripple in the space-time continuum", "the IRS", "you", "you", "the horses of the apocalypse", "a prehistoric wild mountain walrus", "your ID cards and money" };
String[] nResultPart2 = {"poop in your front yard", "interuppting your morning routine", "fining you for your unpaid taxes", "being the subject of a Scotland Yard investigation based on your activities as an inmate", "accidentally farting loudly while speaking before a large crowd", "being unleashed on your gorgeous vegetable garden", "skewering you with his tusks", "being cast into the eternal pit"};
String[] adv1 = {"swiftly", "with gusto", "under duress", "lovingly", "with pinache", "in the manner of Salvador Dali", "as if you were on fire", "while you watch in the nude"};
String[] adv2 = {"slowly", "in a half-hearted manner", "hastily", "spitefully", "clumsily", "in a calm and orderly fashion", "while you are sleping", "with a bang and a whimper"};
int which = 0;

void setup() {
  size (625, 500);
  background(125);
  initColorRecords();
  drawSelectionBoxes();
  displayInstructions();
  getColorSelections();
  displayFortune();
  noLoop();
}

void draw() {
}

void initColorRecords() {
  for (int i = 0; i < 8; i ++) {
    allColors[i] = new ColorRecord(colorName[i], cVals[i], (i * 75) + 25, 25, i);
    allColors[i].decider = decider[i];
    allColors[i].deciderNum = deciderNum[i];
    allColors[i].p1Adj = p1Adj[i];
    allColors[i].p2Adj = p2Adj[i];
    allColors[i].n1Adj = n1Adj[i];
    allColors[i].n2Adj = n2Adj[i];
    allColors[i].noun1 = noun1[i];
    allColors[i].noun2 = noun2[i];
    allColors[i].verb1 = verb1[i];
    allColors[i].verb2 = verb2[i];
    allColors[i].object1 = object1[i];
    allColors[i].object2 = object2[i];
    allColors[i].decider2 = decider2[i];
    allColors[i].decider2Num = decider2Num[i];
    allColors[i].pResultPart1 = pResultPart1[i];
    allColors[i].pResultPart2 = pResultPart2[i];
    allColors[i].nResultPart1 = nResultPart1[i];
    allColors[i].nResultPart2 = nResultPart2[i];
    allColors[i].adv1 = adv1[i];
    allColors[i].adv2 = adv2[i];
  }
}

void drawSelectionBoxes() {
  for (int i = 0; i < 8; i ++) {
    allColors[i].display();
  }
}

void displayInstructions() {
  text("Select the eight color boxes in order starting with your the most desirable color and", 75, 125);
  text("ending with the least deireable color", 215, 140);
}

void getColorSelections() {
  /*
  put clicked color in next slot
  increment the slot counter
  which = clicked on
  */ 
}

void mouseClicked () {
  for (int i = 0; i < 8; i ++) {
    if (allColors[i].isClickedOn(mouseX, mouseY)) {
      which = i; 
      break;
    }
  }
}

void displayFortune() {
  text("A ", 10, 170); 
  if (allColors[0].decider) {
    if (allColors[0].deciderNum == 1) {
      text(allColors[1].p1Adj, 10, 200);
      text(allColors[2].noun1, 10, 230);
      text(allColors[3].verb1, 10, 260);
      text(allColors[4].object1, 10, 290);
    } else {
      text(allColors[1].p2Adj, 10, 200);
      text(allColors[2].noun2, 10, 230);
      text(allColors[3].verb2, 10, 260);
      text(allColors[4].object2, 10, 290);
    }
  }

  if (! allColors[0].decider) {
    if (allColors[0].deciderNum == 1) {
      text(allColors[1].n1Adj, 10, 200);
      text(allColors[2].noun1, 10, 230);
      text(allColors[3].verb1, 10, 260);
      text(allColors[4].object1, 10, 290);
    } else {
      text(allColors[1].n2Adj, 10, 200);
      text(allColors[2].noun2, 10, 230);
      text(allColors[3].verb2, 10, 260);
      text(allColors[4].object2, 10, 290);
    }
  }

  text("resulting in", 10, 320);

  if (allColors[5].decider2) {
    if (allColors[5].decider2Num == 1) {
      text(allColors[6].pResultPart1, 10, 350);
      text(allColors[7].adv1, 10, 380);
      text(allColors[6].pResultPart2 + ".", 10, 410);
    } else {
      text(allColors[6].pResultPart1, 10, 350);
      text(allColors[7].adv2, 10, 380);
      text(allColors[6].pResultPart2 + ".", 10, 410);
    }
  }

  if (! allColors[5].decider2) {
    if (allColors[5].decider2Num == 1) {
      text(allColors[6].nResultPart1, 10, 350);
      text(allColors[7].adv1, 10, 380);
      text(allColors[6].nResultPart2 + ".", 10, 410);
    } else {
      text(allColors[6].nResultPart1, 10, 350);
      text(allColors[7].adv2, 10, 380);
      text(allColors[6].nResultPart2 + ".", 10, 410);
    }
  }
}