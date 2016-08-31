int length = 3;
int variance = 1;
Bolt westBolt = new Bolt(-length, 0, -variance, variance);
Bolt northBolt = new Bolt(-variance, variance, 0, length);

void setup() {
  size(300,300);
  background(255);
  stroke(0);
}

void draw() {
	if(mousePressed) {
		lightning();
	} else {
		background(255);
	}
}

void lightning() {
	westBolt.draw();
	northBolt.draw();
}

class Bolt {
	double minX;
	double minY;
	double maxX;
	double maxY;

	double newX;
	double newY;
	double oldX = mouseX;
	double oldY = mouseY;
	Bolt(int minX, int maxX, int minY, int maxY) {
		this.minX = minX;
		this.minY = minY;
		this.maxX = maxX;
		this.maxY = maxY;
	}
	void draw() {
		newX = oldX + (Math.random()*(this.maxX-this.minX)+this.minX);
		newY = oldY + (Math.random()*(this.maxY-this.minY)+this.minY);
		line((float)(oldX), (float)(oldY), (float)(newX), (float)(newY));
		oldX = newX;
		oldY = newY;
	}
}