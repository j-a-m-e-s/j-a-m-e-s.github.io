void setup() {
  size(910, 400);
  background(100);
}

void draw() {
  background(100);
  strokeWeight(2);
  line(100, 200, 800, 200);
  fill(220);

  // top
  eventHist("UNIVAC - 1951", "The 2nd comercial computer", 150, 150, true);
  eventHist("Mouse & Windows - 1964", "In 1964, the first prototype computer mouse was made to use with a graphical user interface.", 350, 150, true);
  eventHist("First Consumer Computers - 1976", "Apple creates the first comercial computers", 550, 150, true);
  eventHist("Microsoft Windows - 1985", "Microsoft announced their OS with GUI and multitasking", 750, 150, true);

  // bottom
  eventHist("ENIAC - 1946", "The first programable electronic computer", 50, 250, false);
  eventHist("ERMA & MICR - 1955", "Created for banking it could record check values and record them by scaning", 250, 250, false);
  eventHist("ARPAnet - 1969", "A protected flow of information between computers for the military", 450, 250, false);
  eventHist("IBM Home Computer - 1981", "IBM works with microsoft to create an IBM computer", 650, 250, false);

  // title
  fill(200);
  textSize(50);
  text("Historic Computer Systems", 125, 50);
  textSize(15);
  text("James Lee", 825, 390);
}

// top
void eventHist(String eName, String details, int xpos, int ypos, boolean top) {
  if (top) {
    fill(255);
    textSize(11);
    text(eName, xpos - 50, ypos - 10);
    line(xpos, ypos, xpos + 50, ypos + 50);

    if (mouseX > xpos - 60 && mouseX < xpos + 60 &&
      mouseY > ypos -40 && mouseY < ypos + 10) {
      fill(200);
      text(details, xpos - 145, ypos + 175);
    }
  } else {//if(!top); {
    line(xpos, ypos, xpos + 50, ypos - 50);
    textSize(11);
    fill(255);
    text(eName, xpos - 50, ypos + 16);

    if (mouseX > xpos - 50 && mouseX < xpos + 100  &&
      mouseY > ypos - 20 && mouseY < ypos + 10) {
      fill(200);
      text(details, xpos - 30, ypos + 75);
    }
  }
}






// Website http://inventors.about.com/library/blcoindex.htm


