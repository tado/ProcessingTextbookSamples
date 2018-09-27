PVector[] blob = new PVector[20];
PVector[] blob_v = new PVector[20];

void setup(){
  size(500,500);
  for(int i=0; i<20; i++){
    blob[i] = new PVector(random(width),random(height));
    blob_v[i] = new PVector(random(10)-5,random(10)-5);
  }    
}

void draw(){
  background(0);
  //blobの移動
  for(int i=0; i<20; i++){
    blob[i].add(blob_v[i]);
    if(blob[i].x <      0) blob[i].x += width;
    if(blob[i].y <      0) blob[i].y += height;
    if(blob[i].x >  width) blob[i].x -= width;
    if(blob[i].y > height) blob[i].y -= height;
  }
  
  loadPixels();
  for(int y=0; y<width; y++){
    for(int x=0; x<width; x++){
      //blobがあったら色加算
      for(int i=0; i<20; i++){
        float d = dist(x,y,blob[i].x,blob[i].y);
        if(d<100){
          pixels[y*width+x]+=color(40*(1+cos(d*0.0314)));
        }
      }
      //blob計算後、任意の値のピクセルを白く塗る
      int r = pixels[y*width+x]&0x000000ff;
      pixels[y*width+x]=color((r/15%2*255));         
    }
  }
  updatePixels();
}