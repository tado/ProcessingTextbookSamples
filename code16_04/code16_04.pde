size(256,256);
for(int y=0; y<256; y++){
  for(int x=0; x<256; x++){
    stroke(sin(dist(108,108,x,y))*128+128,255);
    point(x,y);
    stroke(sin(dist(148,148,x,y))*128+128,128);
    point(x,y);
  }
}