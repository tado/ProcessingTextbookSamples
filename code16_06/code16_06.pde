void setup(){
  size(1920,1080);
}
void draw(){
  loadPixels();
  for(int y=0; y<height; y++){
    for(int x=0; x<width; x++){
      int w=frameCount%30+1;
      pixels[y*width+x]=color((x/w+y/w)%2*255);
    }
  }
  updatePixels();
}