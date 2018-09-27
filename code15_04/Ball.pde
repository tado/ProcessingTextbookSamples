class Ball{
  PVector pos;
  PVector velocity;
  int size;
  Rectangle rect;

  void setPos(PVector p){
    pos = p;
  }

  void setVel(PVector v){
    velocity = v;
  }

  void move(){
    pos.add(velocity);
    rect.x = (int)pos.x;
    rect.y = (int)pos.y;
  }
  
  void moveX(){
    pos.x += velocity.x;
    rect.x = (int)pos.x;
  }
  
  void moveY(){
    pos.y += velocity.y;
    rect.y = (int)pos.y;
  }
  
  void moveInverse(){
    pos.sub(velocity);
    rect.x = (int)pos.x;
    rect.y = (int)pos.y;
  }
  
  void moveInverseX(){
    pos.x -= velocity.x;
    rect.x = (int)pos.x;
  }
  
  public void moveInverseY(){
    pos.y -= velocity.y;
    rect.y = (int)pos.y;
  }

  public void setSize(int w){
    size = w;
    rect = new Rectangle((int)pos.x, (int)pos.y, w, w);
  }
}