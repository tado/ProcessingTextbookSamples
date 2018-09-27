PImage[] img = new PImage[10];
int[] books = new int[10];
int click = 0;

void setup(){
  size(1280,1024);
  noFill();
  strokeWeight(10);
  stroke(255,64,64);
  randomSeed(0);
  for(int i=0; i<10; i++){
    img[i] = loadImage("processingBook"+str(i)+".png");
    books[i] = i;
  }
  shuffle();
}

void draw(){
  background(255);
  for(int i=0; i<10; i++){
    image(img[books[i]],i*128,0);
  }
  
  noFill();
  rect(((mouseX-64)/128)*128,0,256,1024);

  textSize(100);
  fill(255);
  text("Count:"+click, 750, 100);

  
  if(books[0]==0)//check complete
    if(books[1]==1)
      if(books[2]==2)
        if(books[3]==3)
          if(books[4]==4)
            if(books[5]==5)
              if(books[6]==6)
                if(books[7]==7)
                  if(books[8]==8)
                    if(books[9]==9){
                      textSize(200);
                      fill(255);
                      text("complete !", 130, 560);
                    }
                      
}

void mouseClicked(){
  int i = ((mouseX-64)/128);
  int j = i+1;
  if(j<10){
    int tmp = books[i];
    books[i] = books[j];
    books[j] = tmp;
    click++;
  }
}

void shuffle(){
  for(int n=0; n<10; n++){
    int i = int(random(10));
    int j = int(random(10));
    int tmp = books[i];
    books[i] = books[j];
    books[j] = tmp;
  }
}  