PImage[] panel = new PImage[8];
int[][] field = new int[7][6];
int click=0;
int hex=0;

void setup(){
  size(1100,768);
  panel[0] = loadImage("triRedUp.png");
  panel[1] = loadImage("triRedDown.png");
  panel[2] = loadImage("triGreenUp.png");
  panel[3] = loadImage("triGreenDown.png");
  panel[4] = loadImage("triBlueUp.png");
  panel[5] = loadImage("triBlueDown.png");
  panel[6] = loadImage("triYellowUp.png");
  panel[7] = loadImage("triYellowDown.png");
  for(int y=0; y<6; y++){
    for(int x=0; x<7; x++){
      field[x][y] = int(random(4));
    }
  }
  noFill();
  strokeWeight(10);
  stroke(255);
}

void draw(){
  background(64);
  for(int y=0; y<6; y++){
    for(int x=0; x<7; x++){
      if((x+y)%2==0)
        image(panel[field[x][y]*2],x*64,y*110);
      else
        image(panel[field[x][y]*2+1],x*64,y*110);
    }
  }
  
  noFill();
  int ny = (mouseY+55)/110;
  int nx = (mouseX+64+(ny+1)%2*64)/128;
  int mx = nx*128-(ny+1)%2*64;
  int my = ny*110;
  line(mx-128,my    ,mx- 64,my-110);
  line(mx- 64,my-110,mx+ 64,my-110);
  line(mx+ 64,my-110,mx+128,my    );
  line(mx+128,my    ,mx+ 64,my+110);
  line(mx+ 64,my+110,mx- 64,my+110);
  line(mx- 64,my+110,mx-128,my    );
  
  textSize(50);
  fill(255);
  text("Click:"+click, 860, 100);
  text("Hex:"+hex,  880, 200);
  text("C/H:",  878, 300);
  if(hex!=0)
    text(1.0*click/hex,  975, 300);

}

void mouseClicked(){
  int y = (mouseY+55)/110-1;//y of leftUpPanel
  int x = (mouseX-64+y%2*64)/128*2-y%2;//x of leftUpPanel
  //print(x);
  //println(y);
  if(x<7-2 && y<6-1){
    int tmp = field[x][y];
    if(mouseButton==LEFT){
      field[x][y] = field[x][y+1];
      field[x][y+1] = field[x+1][y+1];
      field[x+1][y+1] = field[x+2][y+1];
      field[x+2][y+1] = field[x+2][y];
      field[x+2][y] = field[x+1][y];
      field[x+1][y] = tmp;
    }else if(mouseButton==RIGHT){
      field[x][y] = field[x+1][y];
      field[x+1][y] = field[x+2][y];
      field[x+2][y] = field[x+2][y+1];
      field[x+2][y+1] = field[x+1][y+1];
      field[x+1][y+1] = field[x][y+1];
      field[x][y+1] = tmp;
    }
    deleteHex();
    click++;
  }
}

void deleteHex(){
  for(int y=0; y<6-1; y++){
    if(y%2==0){
      for(int x=0; x<7-2; x+=2){
        int n = field[x][y];
        if(n == field[x+1][y])
          if(n == field[x+2][y])
            if(n == field[x][y+1])
              if(n == field[x+1][y+1])
                if(n == field[x+2][y+1]){
                  field[x][y] = int(random(4));
                  field[x+1][y] = int(random(4));
                  field[x+2][y] = int(random(4));
                  field[x][y+1] = int(random(4));
                  field[x+1][y+1] = int(random(4));
                  field[x+2][y+1] = int(random(4));
                  hex++;
                }
      }
    }else{
      for(int x=1; x<7-3; x+=2){
        int n = field[x][y];
        if(n == field[x+1][y])
          if(n == field[x+2][y])
            if(n == field[x][y+1])
              if(n == field[x+1][y+1])
                if(n == field[x+2][y+1]){
                  field[x][y] = int(random(4));
                  field[x+1][y] = int(random(4));
                  field[x+2][y] = int(random(4));
                  field[x][y+1] = int(random(4));
                  field[x+1][y+1] = int(random(4));
                  field[x+2][y+1] = int(random(4));
                  hex++;
                }
      }
    }
  }
}