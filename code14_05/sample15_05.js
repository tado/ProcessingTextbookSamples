var headText; //見出し
var pText;    //段落
var slider;   //スライダー

function setup() {
  createCanvas(800, 600);
  //見出しテキストを生成して配置
  headText = createElement('h2', 'HTML要素の動的な生成');
  headText.position(20, 5);
  //段落テキストを生成して配置
  pText = createElement('p', 'このテキストはp5.jsから動的に生成されたHTML要素です。');
  pText.position(20, 60);
  //スライダーを生成して配置
  slider = createSlider(0, 255, 0);
  slider.position(20, 120);
  slider.style('width', '200px');
}

function draw() {
  //スライダーの値で背景色を変化
  var val = slider.value();
  background(val, 255, 255-val);
}