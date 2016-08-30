void setup() {
  size(300,300);
  background(255);
}

void draw() {
	if(mousePressed) {
		background(255);
		lightning();
	} else {
		background(255);
	}
}

void lightning() {
	
}

class Bolt {
	void Bolt(int minX, int maxX, int minY, int maxY) {
		int oldX = (int)(Math.random()*(maxX-minX)+minX);
	}
	void draw() {

	}
}