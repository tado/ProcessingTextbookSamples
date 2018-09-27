size(256,256);
for(int y=0; y<256; y++){
  for(int x=0; x<256; x++){
    stroke( y     /4%2*255,255);
    point(x,y);
    stroke((y+x/4)/4%2*255,128);
    point(x,y);
  }
}