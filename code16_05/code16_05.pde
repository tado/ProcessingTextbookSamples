void setup(){
  size(1920,1080);
}
void draw(){
  for(int y=0; y<height; y++){
    for(int x=0; x<width; x++){
      int w=frameCount%30+1;
      stroke((x/w+y/w)%2*255);
      point(x,y);
    }
  }
}