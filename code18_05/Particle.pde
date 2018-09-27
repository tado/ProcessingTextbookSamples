class Particle {
  //PVector変数
  PVector location;
  PVector velocity;
  PVector acceleration;
  //パーティクルの透明度
  float lifespan;

  Particle(float x, float y) {
    acceleration = new PVector(random(-0.2, 0.2),random(-0.2, 0.2));
    velocity = new PVector(random(-0.3, 0.3), random(-0.3, 0.3));
    location = new PVector(x, y);
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

//
  void update() {
    //散る方向
    velocity.add(acceleration);
    //引数のx,yの座標にvelocityを加えると座標が移動する
    location.add(velocity);
    //徐々に消える（薄くなる）ためにlifespanを減らしていく
    lifespan -= 20.0;
  }


  void display() {
    stroke(255, lifespan);
    fill(255, lifespan);
    //線の描画
    line(location.x, location.y, location.x+random(-10,10), location.y+random(-10, 10));
  }

//パーティクルの寿命の判定
  boolean finished() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}