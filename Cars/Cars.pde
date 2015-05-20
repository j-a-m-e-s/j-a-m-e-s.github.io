Car myCar;
Car myCar2;
Car[] myCars = new Car[250];

void setup() {
  int i;
  size(700, 700);
  for (i =0; i < 250; i=i+1) {
    myCars[i] = new Car(int(random(0, width)), int(random(0, height)), int(random(1,20)), color(random(255), random(255), random(255)));
  }
}

void draw() {
  int i;
  background(#EEEEEE);
  for (i=0; i < 250; i=i+1) {
    myCars[i].display();
    myCars[i].drive();
  }
}
class Car {
  //Member Variable
  int xpos, ypos, cSpeed, direction, cwidth, cheight, cdiameter;
  color cColor;

  //contructor
  Car(int tempX, int tempY) {
    xpos = tempX;
    ypos = tempY;
    cSpeed = int(random(5, cdiameter));
    cwidth = 50;
    cheight = 30;
    cdiameter = 15;
    cColor = color(random(255), random(255), random(255));
    if (random( -1, 1) > 0) {
      direction =1;
    } else {
      direction = -1;
    }
  }


  //constructor #2
  Car (int tempX, int tempY, int tempSpeed, color tempColor) {
    xpos = tempX;
    ypos = tempY;
    cSpeed = tempSpeed;
    cColor = tempColor;
    cwidth = 50;
    cheight = 30;
    cdiameter = 15;
    if (random( -1, 1) > 0) {
      direction =1;
    } else {
      direction = -1;
    }
  }

  //member Methods
  void display() {
    rectMode(CENTER);
    fill(cColor);
    rect(xpos, ypos, cwidth, cheight, cheight/3, cwidth, 0, cheight/6);
    fill(200);
    ellipse(xpos - cdiameter, ypos + cdiameter, cdiameter, cdiameter);
    ellipse(xpos + cdiameter, ypos + cdiameter, cdiameter, cdiameter);
    fill(0);
    ellipse(xpos - cdiameter, ypos + cdiameter, 5, 5);
    ellipse(xpos + cdiameter, ypos + cdiameter, 5, 5);
    line(xpos + cdiameter, ypos- (cheight - 3), xpos+cdiameter, ypos - 12);
    fill(random(103, 153));
    ellipse(xpos + cdiameter, ypos - (cheight - 3), 3, 3);
    fill(255, 0, 0);
    ellipse(xpos - 22, ypos + 7, 5, 5);
    fill(0, 170, 255);
    rect(xpos - 7, ypos, (cheight/3), (cheight/3));
    rect(xpos + 7, ypos, (cheight/3), (cheight/3));
    fill(255, 255, 0);
    rect(xpos + 23, ypos + 7, 5, 5);
  }

  void drive() {
    xpos = xpos + direction*cSpeed;
    if ( xpos > width) {
      xpos = 0;
    }
    if (xpos < 0) {
      xpos = width;
    }
  }
}



