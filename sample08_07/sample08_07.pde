void setup() {
  size(500, 500);
}

void draw() {
  nGram(250, 250, 100, 150, 20);
}

void nGram(float x, float y, float radius1, float radius2, int n) {
  float angle = TWO_PI / n;
  beginShape();
  for (float step = 0; step <= TWO_PI + angle; step += angle) {
    float cv_x = x + cos(step) * radius1;
    float cv_y = y + sin(step) * radius1;
    curveVertex(cv_x, cv_y);
    ellipse(cv_x, cv_y, 5, 5);
    cv_x = x + cos(step +angle/2.0) * radius2;
    cv_y = y + sin(step + angle/2.0) * radius2;
    curveVertex(cv_x, cv_y);
    ellipse(cv_x, cv_y, 10, 10);
  }
  endShape(CLOSE);
}