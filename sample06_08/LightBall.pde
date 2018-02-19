class LightBall extends Ball {
  protected color col = color(250);

  void draw() {
    fill(col);
    ellipse(centerX, centerY, diameter, diameter);
    drawShade();
  }
  void drawShade() {
    noStroke();
    fill(200);
    arc(centerX, centerY, diameter, diameter, 0.0, PI);
    fill(240);
    arc(centerX, centerY, diameter, diameter * 0.3, PI, TWO_PI);
    fill(220);
    arc(centerX, centerY, diameter, diameter * 0.3, 0, PI);
  }
  void update() {
    super.update();
    applyAirDrag();
  }
  void applyAirDrag() {
    float k = 0.08;
    float factor = 1.0 - k;
    dx *= factor;
    dy *= factor;
  }
}