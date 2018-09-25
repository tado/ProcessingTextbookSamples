//オブジェクトの宣言
var walker;

function setup() {
  createCanvas(640, 480);
  //オブジェクトの生成
  walker = new RandomWalker();
}

function draw() {
  background(63);
  //walkerオブジェクトのメソッドを実行
  walker.move();
  walker.draw();
}

//RandomWalkerコンストラクタ関数
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
