//global var
int x, y;

void setup() {
  size(700,700);
  frameRate(10);
  // initializing start coords
  x = 200;
  y = 200;
  frameRate(100);
}

void draw() {
  fill(255);
  stroke(random(255), random(255), random(255) );
 // drawName();
  //noLoop();
}

void keyPressed() {
  if( key == CODED) {
     if(keyCode == RIGHT) {
      moveRight(1);
    } else if (keyCode == DOWN) {
      moveDown(1);
    } else if (keyCode == UP) {
      moveUp(1);
    } else if (keyCode == LEFT) {
      moveLeft(1);
    }
  }
}

void mouseClicked() {
  
  saveFrame("line-######.png");
}

// Algorithm for your first name
void drawName() {
  moveRight(16);
  moveLeft(8);
  moveDown(15);
  moveLeft(7);
  moveUp(3);
  moveDown(3);
  moveRight(7);
  moveUp(15);
  moveRight(17);
  moveDown(15);
  moveRight(7);

}

// Method to draw right line
void moveRight(int rep) {
  for(int i=0;i<rep*10;i++){
    point(x+i,y);
  }
  x=x+(10*rep);
}

void moveLeft(int rep) {
  for( int i= 0;  -i < rep*10; i--){
    point(x+i, y);
  }
  x=x-(10*rep);
}

void moveDown(int rep) {
  for( int i= 0; i < rep* 10; i++) {
    point(x, y+i);
  }
  y=y + (10*rep);
}

void moveUp(int rep) {
  for ( int i = 0; i < rep* 10; i++) {
    point(x, y - i);
  }
  y= y - ( 10*rep);
}

void rightDown( int rep) {
  for (int i = 0; i < rep*10; i++) {
    point(x + i, y + i);
  }
  y= x -(10*rep);
}

