//オブジェクトの配列の宣言
var walkers = [];

function setup() {
  createCanvas(800, 600);
  //オブジェクトの生成して配列に追加
  for (var i=0; i<50; i++) {
    walkers.push(new RandomWalker());
  }
}

function draw() {
  background(63);
  //配列の数だけ実行
  for (var i=0; i<walkers.length; i++) {
    //walkerオブジェクトのメソッドを実行
    walkers[i].move();
    walkers[i].draw();
  }
}

// RandomWalkerコンストラクタ関数
var RandomWalker = function() {
  this.x = random(width);
  this.y = random(height);
}

//RandomWalkerのmoveメソッド
RandomWalker.prototype.move = function() {
  this.x += random(-1, 1);
  this.y += random(-1, 1);
};

//RandomWalkerのdrawメソッド
RandomWalker.prototype.draw = function() {
  fill(31, 127, 255);
  stroke(255);
  ellipse(this.x, this.y, 20, 20);
};
