// button type functions
final static int DoDigit = 1;
final static int DoOp = 2;
final static int DoMem = 3;

//color while pressed
final static color ButtonActive = #8158FF; 
// color before pressed
final static color ButtonInactive = #A486FF;
// operation button before pressed
final static color ButtonOpInactive = #4656FF;
// sp funct memory functions before pressed
final static color ButtonMemInactive = #FA7DFC;
// text color
final static color ButtonText = #000000;

static final int ZERO_ = 0;
static final int ONE_ = 1;
static final int TWO_ = 2;
static final int THREE_ = 3;
static final int FOUR_ = 4;
static final int FIVE_ = 5;
static final int SIX_ = 6;
static final int SEVEN_ = 7;
static final int EIGHT_ = 8;
static final int NINE_ = 9;
static final int DECI_ = 10;
static final int PLUS_ = 11;
static final int MINUS_ = 12;
static final int MULT_ = 13;
static final int DIV_ = 14;
static final int EQUAL_ = 15;
static final int CLR_ = 16;
static final int SIGN_ = 17;
static final int BS_ = 18;
static final int E_ = 19;
static final int MemR_ = 20;
static final int MemPlus_ = 21;
static final int MemClr_ = 22;
static final int MemExchange_ = 23;

// quick size formating ( text does not become proportional automaticaly)
static final int ButtonSize = 50;
static final int DisplayHeight = 70;

// max amount of characters in the result display
static final int MaxStringLength = 13;



String displayValue = "0";
String valueToCompute = "";  //string value left of operator
String valueToCompute2 = ""; // string value right of the operator
String MemValue="";  // Memory value
double result = 0;
char op = '+';
boolean firstNum = true;

ButtonClass[] Buttons = new ButtonClass[] {
  // numbers
  new ButtonClass(4, 2, 1, 1, 5, 5, ButtonActive, ButtonInactive, ButtonText, DoDigit, "0", ZERO_, 20), 
  new ButtonClass(1, 1, 1, 1, 5, 5, ButtonActive, ButtonInactive, ButtonText, DoDigit, "1", ONE_, 20), 
  new ButtonClass(1, 2, 1, 1, 5, 5, ButtonActive, ButtonInactive, ButtonText, DoDigit, "2", TWO_, 20), 
  new ButtonClass(1, 3, 1, 1, 5, 5, ButtonActive, ButtonInactive, ButtonText, DoDigit, "3", THREE_, 20), 
  new ButtonClass(2, 1, 1, 1, 5, 5, ButtonActive, ButtonInactive, ButtonText, DoDigit, "4", FOUR_, 20), 
  new ButtonClass(2, 2, 1, 1, 5, 5, ButtonActive, ButtonInactive, ButtonText, DoDigit, "5", FIVE_, 20), 
  new ButtonClass(2, 3, 1, 1, 5, 5, ButtonActive, ButtonInactive, ButtonText, DoDigit, "6", SIX_, 20), 
  new ButtonClass(3, 1, 1, 1, 5, 5, ButtonActive, ButtonInactive, ButtonText, DoDigit, "7", SEVEN_, 20), 
  new ButtonClass(3, 2, 1, 1, 5, 5, ButtonActive, ButtonInactive, ButtonText, DoDigit, "8", EIGHT_, 20), 
  new ButtonClass(3, 3, 1, 1, 5, 5, ButtonActive, ButtonInactive, ButtonText, DoDigit, "9", NINE_, 20), 
  // decimal 
  new ButtonClass(4, 3, 1, 1, 5, 5, ButtonActive, ButtonInactive, ButtonText, DoDigit, ".", DECI_, 20), 
  // addition
  new ButtonClass(1, 4, 1, 1, 5, 5, ButtonActive, ButtonOpInactive, ButtonText, DoOp, "+", PLUS_, 20), 
  // subtract
  new ButtonClass(2, 4, 1, 1, 5, 5, ButtonActive, ButtonOpInactive, ButtonText, DoOp, "-", MINUS_, 20), 
  // multiply
  new ButtonClass(3, 4, 1, 1, 5, 5, ButtonActive, ButtonOpInactive, ButtonText, DoOp, "X", MULT_, 20), 
  // divide
  new ButtonClass(4, 4, 1, 1, 5, 5, ButtonActive, ButtonOpInactive, ButtonText, DoOp, "÷", DIV_, 20), 
  // solve
  new ButtonClass(5, 4, 1, 1, 5, 5, ButtonActive, ButtonOpInactive, ButtonText, DoOp, "=", EQUAL_, 20), 
  // clear
  new ButtonClass(5, 1, 1, 1, 5, 5, ButtonActive, ButtonOpInactive, ButtonText, DoOp, "C", CLR_, 20), 
  // change sign
  new ButtonClass(4, 1, 1, 1, 5, 5, ButtonActive, ButtonInactive, ButtonText, DoDigit, "±", SIGN_, 20), 
  // backspace
  new ButtonClass(5, 2, 1, 1, 5, 5, ButtonActive, ButtonOpInactive, ButtonText, DoOp, "←", BS_, 20), 
  // exponential ( X * 10^Y)
  new ButtonClass(5, 3, 1, 1, 5, 5, ButtonActive, ButtonInactive, ButtonText, DoDigit, "E", E_, 20), 
  // mem reset
  new ButtonClass(6, 1, 1, 1, 5, 5, ButtonActive, ButtonMemInactive, ButtonText, DoMem, "MR", MemR_, 17), 
  // mem add
  new ButtonClass(6, 2, 1, 1, 5, 5, ButtonActive, ButtonMemInactive, ButtonText, DoMem, "M+", MemPlus_, 17), 
  //mem clear
  new ButtonClass(6, 3, 1, 1, 5, 5, ButtonActive, ButtonMemInactive, ButtonText, DoMem, "MC", MemClr_, 17), 
  //mem exchange
  new ButtonClass(6, 4, 1, 1, 5, 5, ButtonActive, ButtonMemInactive, ButtonText, DoMem, "X↔M", MemExchange_, 13)
  }; //                                                            the symbol above this (↔)is a double sided arrow ( extended keyboard alt + 2 + 9)
  static final int numButtonCol = 4;
static final int numButtonRow = 6;
int[][] ButtonArray = new int[numButtonRow][numButtonCol];
ButtonClass LastButton;

void draw() {
}

void setup() {
  setupButtonArray();
  DrawCalculator();
  DrawButtons();
  DrawDisplay();
}

ButtonClass whichButton (int x, int y, ButtonClass[] Buttons) {
  int i, j;
  ButtonClass button;

  i = (y - DisplayHeight) / ButtonSize;
  j = x / ButtonSize;
  if ((i < numButtonRow) && (i >= 0) && (j < numButtonCol) && (j >= 0)) {
    button = Buttons[ButtonArray[i][j]].InButton (x, y);
  } else {
    button = null;
  }
  return button;
}

void setupButtonArray() {
  int i, j, k;
  ButtonClass b;
  for (k = 0; k < Buttons.length; k++) {
    b = Buttons[k];
    for (i = b.ButtonSlotR; i < b.ButtonSlotR + b.ButtonSlotH; i++ ) {
      for (j = b.ButtonSlotC; j < b.ButtonSlotC + b.ButtonSlotW; j++) {
        ButtonArray[i][j] = b.ButtonID;
      }
    }
  }
}
// changes color while button is pressed
void mousePressed() {
  ButtonClass Button;
  Button = whichButton(mouseX, mouseY, Buttons);
  if (Button != null) {
    Button.Pressed();
    LastButton = Button;
  }
}
// executes function of button when mouse is released, only executes while the mouse is still on the same button while it was pressed on.
void mouseReleased() {
  ButtonClass Button;
  Button = whichButton(mouseX, mouseY, Buttons);
  if (LastButton != null) 
    LastButton.display();
  if (Button != null) {
    if (LastButton == Button) {
      Button.Released();
    }
  }
}

void doDigit(char c) {
  int maxstringlength;
  switch (c) {
  case '±':
    if (valueToCompute.length() != 0) {
      if (valueToCompute.charAt(0) == '-')
        valueToCompute = valueToCompute.substring(1);
      else 
        valueToCompute = "-" + valueToCompute;
      DrawDisplay();
    }
    break;
    //limits E and . to one of each/ no decimals after E
  case 'E':
    if (valueToCompute.length() != 0)
      if (valueToCompute.indexOf("E") != -1)       
        break;
  case '.':
    if (c == '.')
      if (valueToCompute.length() != 0)
        if ((valueToCompute.indexOf(".") != -1)||(valueToCompute.indexOf("E") != -1))       
          break;
  default:
    maxstringlength = MaxStringLength;
    if (firstNum) {
      valueToCompute = "";
      firstNum = false;
      valueToCompute = valueToCompute + c;
      DrawDisplay();
    } else {
      if (valueToCompute.length() == 0) {
        valueToCompute = valueToCompute + c;
        DrawDisplay();
      } else {
        if (valueToCompute.charAt(0) == '-') maxstringlength++;
        if ((valueToCompute.indexOf(".") != -1) || (c=='.')) maxstringlength++;
        if (valueToCompute.length() < maxstringlength) {
          valueToCompute = valueToCompute + c;
          DrawDisplay();
        }
      }
    }
  }
}

void doOp(char c) {
  // need to do a seperate function for the screen to refresh properly, symbols overlap until screen update
  //  textSize(15);
  //  text(c, 30, 50);
  firstNum = true;
  switch (c) {
  case '=' :
    performCalculation();
    DrawDisplay();
    break;
  case 'C' :
    valueToCompute = "";
    DrawDisplay();
    break;
  case '←' :
    if (valueToCompute.length() != 0) {
      valueToCompute = valueToCompute.substring(0, valueToCompute.length() - 1);
      DrawDisplay();
    }
    break;
  case '+' :
  case '-' :
  case 'X' :
  case '÷' :
    op = c;
    valueToCompute2 = valueToCompute;
    break;
  }
}

void doMem(char c) { 
  String tmpstr;
  double MemValueI;
  double valueToComputeI;
  firstNum = true;
  println ("Do Mem", c);
  switch (c) {
  case 'R':
    valueToCompute = MemValue;
    DrawDisplay();
    break;
  case 'C':
    MemValue = "";
    break;
  case '+':
    MemValueI =  float(MemValue);
    if (Double.isNaN(MemValueI))
      MemValueI = 0.;
    valueToComputeI = float(valueToCompute);
    if (Double.isNaN (valueToComputeI))
      valueToComputeI = 0.;
    MemValueI += valueToComputeI;
    MemValue = str((float) MemValueI);
    break;
  case 'M':
    tmpstr = MemValue;
    MemValue = valueToCompute;
    valueToCompute = tmpstr;
    DrawDisplay();
    break;
  }
}

void performCalculation() {
  double valueToComputeI = 0; // double value left of operator
  double valueToComputeI2 = 0;  // double value right of operator

  //set string values to integers
  valueToComputeI = float(valueToCompute);
  if (Double.isNaN (valueToComputeI))
    valueToComputeI = 0;
  valueToComputeI2 = float(valueToCompute2);
  if (Double.isNaN (valueToComputeI2))
    valueToComputeI2 = 0;
  switch (op) {
  case '+':
    valueToComputeI2 += valueToComputeI;
    break;
  case '-':
    valueToComputeI2 -= valueToComputeI;
    break;
  case 'X':
    valueToComputeI2 *= valueToComputeI;
    break;
  case '÷':
    valueToComputeI2 /= valueToComputeI;
    break;
  } 
  valueToComputeI = valueToComputeI2;
  valueToCompute = str((float)valueToComputeI);
  valueToCompute2 = str((float)valueToComputeI2);
}

void DrawButtons() {
  int i;
  for (i=0; i < Buttons.length; i++) {
    Buttons[i].display();
  }
}

void DrawCalculator() {
  size (numButtonCol * ButtonSize + 4, numButtonRow * ButtonSize + 4 + DisplayHeight);
  background (111, 198, 255);
  noFill();
  strokeWeight(3);
  stroke(200);
  rect (1, 1, numButtonCol * ButtonSize + 4 - 1, numButtonRow * ButtonSize + 4 + DisplayHeight - 1);
}

void DrawDisplay() {
  fill(200, 200, 150);
  rect(10, 10, width - 20, DisplayHeight - 20, 7);
  fill(0);
  textSize(18);
  textAlign(RIGHT);
  text(valueToCompute, width - 15, 35);
}

void handleKeyPressNum(String keyPress) {
  if (firstNum) {
    valueToCompute += keyPress;
    displayValue += valueToCompute;
  } else {
    valueToCompute2 += keyPress;
  }
}



void keyPressed() {
  if (key == '1') {
    handleKeyPressNum("1");
  } else if (key =='2');
  {
    handleKeyPressNum("2");
  }/* else if (key == '3');
  {
    handleKeyPressNum("3");
  } else if (key == '4'); 
  {
    handleKeyPressNum("4");
  } else if (key == '5'); 
  {
    handleKeyPressNum("5");
  } else if (key == '6'); 
  {
    handleKeyPressNum("6");
  } else if (key == '7'); 
  {
    handleKeyPressNum("7");
  } else if (key == '8'); 
  {
    handleKeyPressNum("8");
  } else if (key == '9'); 
  {
    handleKeyPressNum("9");
  } else if (key == '0'); 
  {
    handleKeyPressNum("0");
  } else if (key == '3'); 
  {
    handleKeyPressNum("3");
  }*/
}



class ButtonClass {
  int ButtonSlotC;
  int ButtonSlotR;
  int ButtonSlotW;
  int ButtonSlotH;
  int ButtonStartX;
  int ButtonEndX;
  int ButtonStartY;
  int ButtonEndY;
  int ButtonX;
  int ButtonY;
  int ButtonW;
  int ButtonH;
  color ButtonActiveColor;
  color ButtonInactiveColor;
  color ButtonTextColor;
  int ButtonType;
  String ButtonString;
  int ButtonID;
  int ButtonFont;

  //Constructor 
  ButtonClass(int tmpSlotR, 
  int tmpSlotC, 
  int tmpSlotW, 
  int tmpSlotH, 
  int tmpW, 
  int tmpH, 
  color tmpActiveColor, 
  color tmpInactiveColor, 
  color tmpTextColor, 
  int tmpType, 
  String tmpString, 
  int ID,
  int FontS) {
    ButtonSlotR = tmpSlotR - 1;
    ButtonSlotC = tmpSlotC - 1;
    ButtonSlotW = tmpSlotW;
    ButtonSlotH = tmpSlotH;
    ButtonW = tmpW;
    ButtonH = tmpH;
    ButtonStartX = ButtonSlotC * ButtonSize + ButtonW;
    ButtonStartY = ButtonSlotR * ButtonSize + ButtonH + DisplayHeight;
    ButtonEndX = (ButtonSlotC + ButtonSlotW) * ButtonSize - ButtonW;
    ButtonEndY = (ButtonSlotR + ButtonSlotH) * ButtonSize - ButtonH + DisplayHeight;
    ButtonActiveColor = tmpActiveColor;
    ButtonInactiveColor = tmpInactiveColor;
    ButtonTextColor = tmpTextColor;
    ButtonType = tmpType;
    ButtonString = tmpString;
    ButtonID = ID;
    ButtonFont = FontS;
  }

  void display() {
    fill (ButtonInactiveColor);
    stroke (0);
    strokeWeight (2);
    rect (ButtonStartX, ButtonStartY, ButtonEndX - ButtonStartX, ButtonEndY - ButtonStartY, 10);
    fill (ButtonTextColor);
    textSize (ButtonFont);
    textAlign (CENTER);
    text (ButtonString, (ButtonStartX + ButtonEndX) / 2, (ButtonStartY + ButtonEndY) / 2 + ButtonFont/2);
    
  }  

  void Pressed() {
    fill (ButtonActiveColor);
    stroke (0);
    strokeWeight (2);
    rect (ButtonStartX, ButtonStartY, ButtonEndX - ButtonStartX, ButtonEndY - ButtonStartY, 10);
    fill (ButtonTextColor);
    textSize (ButtonFont);
    textAlign (CENTER);
    text (ButtonString, (ButtonStartX + ButtonEndX) / 2, (ButtonStartY + ButtonEndY) / 2 + ButtonFont/2);
  }

  void Released() {
    switch (ButtonType) {
    case DoDigit: 
      doDigit (ButtonString.charAt(0));
      break;
    case DoOp:
      doOp (ButtonString.charAt(0));
      break;
    case DoMem:
      doMem (ButtonString.charAt(1));
      break;
    }
  }

  ButtonClass InButton (int x, int y) {
    ButtonClass Button;
    if ((x > ButtonStartX) && (x < ButtonEndX) && ( y > ButtonStartY) && (y < ButtonEndY)) 
      Button = this;
    else 
      Button = null;
    return Button;
  }
}


