int length = 10;
int variance = 5;
boolean drawing;

Bolt eastBolt = new Bolt(0, length, -variance, variance);
Bolt westBolt = new Bolt(-length, 0, -variance, variance);
Bolt northBolt = new Bolt(-variance, variance, -length, 0);
Bolt southBolt = new Bolt(-variance, variance, 0, length);
Bolt northWestBolt = new Bolt(-length, 0, -length, 0);
Bolt northEastBolt = new Bolt(0, length, -length, 0);
Bolt southWestBolt = new Bolt(-length, 0, 0, length);
Bolt southEastBolt = new Bolt(0, length, 0, length);

void setup() {
  size(800,500);
  background(255);
  stroke(0);
}

void draw() {
	if(drawing) {
		lightning();
	}
}

void lightning() {
	eastBolt.draw();
	westBolt.draw();
	northBolt.draw();
	southBolt.draw();
	northWestBolt.draw();
	northEastBolt.draw();
	southWestBolt.draw();
	southEastBolt.draw();
}

void mousePressed() {
	background(255);
	eastBolt.update();
	westBolt.update();
	northBolt.update();
	southBolt.update();
	northWestBolt.update();
	northEastBolt.update();
	southWestBolt.update();
	southEastBolt.update();
	drawing = true;
}

class Bolt {
	int minX;
	int minY;
	int maxX;
	int maxY;

	int newX;
	int newY;
	int oldX;
	int oldY;
	Bolt(int minX, int maxX, int minY, int maxY) {
		this.minX = minX;
		this.minY = minY;
		this.maxX = maxX;
		this.maxY = maxY;
	}
	void update() {
		this.oldX = mouseX;
		this.oldY = mouseY;
	}
	void draw() {
		if(!(oldX<0) && !(oldX>width) && !(oldY<0) && !(oldY>height)) {
			newX = oldX + (int)((Math.random()*(this.maxX-this.minX)+this.minX));
			newY = oldY + (int)((Math.random()*(this.maxY-this.minY)+this.minY));
			line(oldX, oldY, newX, newY);
			oldX = newX;
			oldY = newY;
		}
	}
}