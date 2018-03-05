void setup() {
  colorMode(HSB, 360, 100, 100);
  size(500, 500);
  noLoop();
  noStroke();
}

void draw() {
  for (int i=0; i<500; i++) {
    fill(random(100, 160), random(80, 100), random(50, 80), random(255)); 
    flower(random(500), random(500), random(10, 70), random(50, 120), int(random(10, 30)));
  }
}

void flower(float x, float y, float radius1, float radius2, int n) {
  float angle = TWO_PI / n;
  beginShape();
  for (float a = 0; a <= TWO_PI + angle; a += angle) {
    float sx = x + cos(a) * radius1;
    float sy = y + sin(a) * radius1;
    curveVertex(sx, sy);
    sx = x + cos(a+angle/2.0) * radius2;
    sy = y + sin(a+ angle/2.0) * radius2;
    curveVertex(sx, sy);
  }
  endShape(CLOSE);
}