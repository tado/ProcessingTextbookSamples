size(256,256);
for(int y=0; y<256; y++){
  for(int x=0; x<256; x++){
    stroke(x,y,255);//---------------①
    point(x,y);
  }
}