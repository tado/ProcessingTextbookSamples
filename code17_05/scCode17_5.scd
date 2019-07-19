// サーバを起動
s = Server.default;
s.boot;

// SCのサーバ部へ入るすべてのOSCメッセージを表示する。
s.dumpOSC;

// シンセサイザー"snow_synth"をサーバに設定する。引数は"pitch"（MIDIノートナンバー）
(
SynthDef("snow_synth", {
	arg pitch=60;
	var out1, out2, env;
	env = Env.perc(0.01, 0.5, 0.2);
	out1 = SinOsc.ar(((pitch).midicps.round(1)), 0, 0.3) * EnvGen.kr(env, doneAction:2);
	out2 = Pan2.ar(out1, Rand(-1.0, 1.0));
	Out.ar(0, out2);
}).add;
)

//クライアント側で動作するSynth。サーバ上のシンセノードの表示として機能する。
Synth("snow_synth", [pitch:60]);

//メッセージを送って動かす場合。
s.sendMsg("/s_new", "snow_synth", s.nextNodeID);


(
//入力された0-11をドリア旋法の割当てに変換する。
//配列を扱う変数choicesを宣言して0-11の数値を特定のMIDIノートナンバー（ピッチ）に変換する。
var choices = [62, 64, 65, 67, 69, 71, 72, 74, 76 ,77, 79, 81];

//OSCデータを受けつけるOSCdefクラス。OSCデータを振り分けるための"srcID"は"/snowfall_SC"。
OSCdef('portlistener', {
	arg msg;
	msg.postln;
	Synth("snow_synth", [pitch:choices[msg[1]]]);
}, "/snowfall_SC")
)

s.quit;