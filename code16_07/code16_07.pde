PShader ps;
void setup() {
  size(1920, 1080, P2D);
  ps = loadShader("ps.glsl");
}
void draw() {
  ps.set("w", frameCount%30+1);
  shader(ps); 
  rect(0, 0, width, height);
}