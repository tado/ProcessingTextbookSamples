// 初期設定のサーバを設定する。SCでは小文字は変数。変数sにサーバを設定する。
s = Server.default;

// サーバを起動する。変数sとメソッド.bootで起動。
s.boot;

// SCのサーバ部へ入るすべてのOSCメッセージを表示する。
s.dumpOSC;

//------------------

// シンセサイザをサーバに設定する。引数は"freq"
(
SynthDef("test_osc_SC", {
	arg freq=440;
	Out.ar(0, SinOsc.ar(freq, 0, 0.1) !2);
}).store;
)


// ハイハット音のシンセサイザーを設定する。
(
SynthDef("SC_hat", {
	arg gate=1.0, amp=1;
	a = Env.perc(0.01,0.03,1,-3);
	x = WhiteNoise.ar(1);
	b = EnvGen.kr(a,gate,doneAction: 2) * x;
	Out.ar(0, Pan2.ar(b, 0, amp));

}).store;
)

// アラーム音のシンセサイザーを設定する。
(
SynthDef("SC_alarm",  {
	arg freq= 1500;
	x = SinOsc.ar(freq, 0, 0.2) * LFPulse.ar(2);
	Out.ar(0, x !2);
}).store
)

//------------------

//メッセージ（OSCデータ）をサーバ（SCsynth）に送って鳴らす。送る先のポートは57110
n = NetAddr.new("127.0.0.1", 57110);

// 初期値440Hzでサイン波が鳴る。
n.sendMsg("/s_new", "test_osc_SC", s.nextNodeID, 0, 1);

// 引数freqに入れる数値で1000Hzでサイン波が鳴る。
n.sendBundle(0.2, ["/s_new", "test_osc_SC", x = s.nextNodeID, 0, 1],["/n_set", x, "freq", 800]);

// ハイハット風の音が鳴る。
n.sendMsg("/s_new", "SC_hat", s.nextNodeID, 0, 1);

// アラーム音が鳴る。
n.sendMsg("/s_new", "SC_alarm", s.nextNodeID, 0, 1);


//------------------

//クライアント側（SClang）のSynthクラスで鳴らす。
// 初期値440Hzでサイン波が鳴る。
Synth("test_osc_SC");


// 引数freqに入れる数値で1000Hzでサイン波が鳴る。
Synth("test_osc_SC", ["freq", 1300]);

// ハイハット風の音が鳴る。
Synth("SC_hat");

// アラーム音が鳴る。
Synth("SC_alarm");





//------------------

// SuperCollider側から送信する。
b = NetAddr.new("127.0.0.1", 12000);
b.sendMsg("/hello", "I am SuperCollider");
b.sendMsg("/hello", "How are you?");

// サーバを停止する。
s.quit;