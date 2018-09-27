int SIZE = 512;
byte[][] Cmap1,Cmap2;
byte dead = 1;
byte live = 0;

void setup() {
  size(512, 512);
  Cmap1 = new byte[SIZE][SIZE];
  Cmap2 = new byte[SIZE][SIZE];
  for(int x = 0; x < SIZE; x++){
    for(int y = 0; y < SIZE; y++){
      Cmap1[x][y] = (85<random(100)) ? live : dead;
      Cmap2[x][y] = dead;
    }
  }
}

void draw() {
  loadPixels();
  for(int x = 1; x < SIZE-1; x++){
    for(int y = 1; y < SIZE-1; y++){
      int sum =  Cmap1[x-1][y-1]
                +Cmap1[x  ][y-1]
                +Cmap1[x+1][y-1]
                +Cmap1[x-1][y  ]
                +Cmap1[x+1][y  ]
                +Cmap1[x-1][y+1]
                +Cmap1[x  ][y+1]
                +Cmap1[x+1][y+1];
      if(Cmap1[x][y]==dead)
        if(sum==5)
          Cmap2[x][y]=live;
      if(Cmap1[x][y]==live)
        if(sum==5 || sum==6)
          Cmap2[x][y]=live;
        else
          Cmap2[x][y]=dead;
      pixels[y*SIZE+x] = color(Cmap2[x][y]*255);
    }
  }
  updatePixels();
  
  for(int x = 1; x < SIZE-1; x++){
    for(int y = 1; y < SIZE-1; y++){
      Cmap1[x][y]=Cmap2[x][y];
    }
  }
}