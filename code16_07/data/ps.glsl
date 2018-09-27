uniform int w;
void main(void) {
  int x = int(gl_FragCoord.x);
  int y = int(gl_FragCoord.y);
  float col = mod((x/w)+(y/w),2);
  gl_FragColor = vec4(col,col,col,1);
}
