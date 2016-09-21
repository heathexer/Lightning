int numBolts = 15;
int maxLength = 15;
int variance = 10;
boolean running = false;

Bolt[] bolts = new Bolt[numBolts];
double interval = 360/numBolts;

void setup() {
  background(255);
  size(800, 800);
  for(int i = 0; i < bolts.length; i++) {
    bolts[i] = new Bolt(i*interval);
  }
}

void draw() {
  if(running) {
    for(int i = 0; i < bolts.length; i++) {
      bolts[i].update();
    }
  }
  // System.out.println(Math.random()*2-1);
}

void mousePressed() {
  running = true;
  background(255);
  for(int i = 0; i < bolts.length; i++) {
    bolts[i].updateCoords(mouseX, mouseY);
    bolts[i].oldX = 0;
    bolts[i].oldY = 0;
  }
}

class Bolt {
  double rotation;
  double newX, newY, oldX, oldY, centerX, centerY;
  Bolt(double rotation) {
    this.rotation = rotation;
  }
  void update() {
    newX = oldX+Math.random()*maxLength+1;
    newY = oldY+(Math.random()*2-1)*variance;
    pushMatrix();
    translate((float)(this.centerX), (float)(this.centerY));
    rotate(radians((float)(this.rotation)));
    line((float)(oldX), (float)(oldY), (float)(newX), (float)(newY));
    popMatrix();
    oldX = newX;
    oldY = newY;
  }
  void updateCoords(int x, int y) {
    this.centerX = x;
    this.centerY = y;
  }
}
