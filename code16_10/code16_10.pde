float leftUp_x = -1.5; //表示する複素平面エリア
float rightDown_x = 0.5;
float leftUp_y = -1.0;
float rightDown_y = 1.0;

float dx,dy; //1ピクセルあたりの実軸と虚軸の値
float ix,iy; //複素平面上の計算する座標

void setup(){
  size(1600,800);
  colorMode(HSB,100);
  
  dx = (rightDown_x-leftUp_x)/800.0;
  dy = (rightDown_y-leftUp_y)/800.0;

  loadPixels();
  iy = leftUp_y;
  for(int y=0; y<800; y++){
    ix = leftUp_x;
    for(int x=0; x<800; x++){
      int c = mandelbrotJulia(0, 0, ix, iy,100);
      pixels[y*width+x]=color(c,100,100);
      ix += dx;
    }
    iy += dy;
  }
  updatePixels();
}

void draw(){
}

void mousePressed(){
  float c_x = mouseX/800.0*2.0-1.5;
  float c_y = mouseY/800.0*2.0-1.0;
  leftUp_x    = c_x-0.05;
  rightDown_x = c_x+0.05;
  leftUp_y    = c_y-0.05;
  rightDown_y = c_y+0.05;

  dx = (rightDown_x-leftUp_x)/800.0;
  dy = (rightDown_y-leftUp_y)/800.0;

  loadPixels();
  iy = leftUp_y;
  for(int y=0; y<800; y++){
    ix = leftUp_x;
    for(int x=0; x<800; x++){
      int c = mandelbrotJulia(0, 0, ix, iy,500);
      pixels[y*width+x+800]=color(c,100,100);
      ix += dx;
    }
    iy += dy;
  }
  updatePixels();
  
}

int mandelbrotJulia(float zr, float zi,
                    float cr, float ci,
                    int iteration){
  int n;
  for(n=0; n<iteration; n++){
    float tmp;
    tmp = zr*zr - zi*zi + cr;
    zi = 2*zr*zi + ci;
    zr = tmp;
    if(zr*zr + zi*zi>4){
      return n;
    }
  }
  return n;
}