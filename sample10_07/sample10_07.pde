float[] x = new float[100];
float[] y = new float[100];
int number;
boolean waterDropStart;

void setup () {
  size(500, 500);
  background(255);
  number=0;
  waterDropStart=false;
}

void draw () {
  reset();
  fill(128);

  if (waterDropStart) {
    for (int i=0; i<number; i++) {
      ellipse(x[i], y[i], 5, 5);
      x[i]=x[i]+random(-1, 1);
      y[i]=y[i]+random(1, 3);
    }
  }
}

void reset() {
  fill(255, 30);
  noStroke();
  rect(0, 0, width, height);
}

void mousePressed() {
  waterDropStart=true;
  x[number]=mouseX;
  y[number]=mouseY;
  number++;
}