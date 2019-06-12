var input; //テキスト入力欄
var button; //ボタン
var headText; //タイトルテキスト

function setup() {
  //キャンバス作成
  createCanvas(800, 600);
  //カラーモードをHSBに
  colorMode(HSB, 100);
  //テキスト入力欄を生成
  input = createInput();
  input.position(20, 65);
  //「入力」ボタンを生成
  button = createButton('入力');
  button.position(150, 65);
  button.mousePressed(showName);
  //見出しテキストを生成
  headText = createElement('h2', 'こんにちは、お名前は何ですか?');
  headText.position(20, 5);
}

function showName() {
  //テキストをセンタリング
  textAlign(CENTER);
  //入力欄からテキストを取り出し
  var name = input.value();
  //見出しテキストを変更
  headText.html('こんにちは、'+name+'!');
  //入力欄を空に
  input.value('');
  //500回くりかえして、入力されたテキストを描画
  for (var i=0; i<500; i++) {
    push();
    textSize(random(10, 50));
    fill(random(100), 70, 100);
    translate(random(width), random(height));
    rotate(random(2*PI));
    text(name, 0, 0);
    pop();
  }
}