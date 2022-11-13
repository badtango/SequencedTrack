s.boot;

//First evaluate the buffers below. Ensure your file directories are correct.
a = Buffer.read(s,"/Users/williamrailton/Desktop/SequencedTrack/BufferSamples/Kick.wav");
b = Buffer.read(s,"/Users/williamrailton/Desktop/SequencedTrack/BufferSamples/Snare.wav");
c = Buffer.read(s,"/Users/williamrailton/Desktop/SequencedTrack/BufferSamples/HiHat1.wav");
g = Buffer.read(s,"/Users/williamrailton/Desktop/SequencedTrack/BufferSamples/HiHat2.wav");

//Then evaluate this next section.
(
var randorg ;
var rand1, rand2, rand3, rand4;
var sine1;
var rand11, rand21, rand31, rand41;
var gate;
var sine2;
var rander1, rander2, rander3, rander4;
var boo1;
var build, build2;
var bass1;
var k4, s5, h6, h7;
var h1;

//synth1
SynthDef(\willsynth, { arg i_out = 0, freq; var out; out = RHPF.ar(
		                Saw.ar( freq, mul: EnvGen.kr( Env.perc, levelScale: 0.07, doneAction: 2 )),
		                LFNoise1.kr(4, 36, 90).midicps, 0.1);
		                4.do({ out = AllpassN.ar(out, 0.05, [0.05.rand, 0.05.rand], 4) });
		                Out.ar( i_out, out );}).send(s);
	
randorg = [48, 0, 60, 0, 0, 63, 0, 67, 62, 63, 65, 67, 68, 70, 68, 0].midicps;

~mybeat2 = Task({
var myCount = 0; 
	   loop({
		myCount = 0;
		16.do({	

Synth(\willsynth, [\freq, ([randorg].choose[myCount])]);
		
		myCount = myCount + 1;
		0.2.wait
		});
	});
	0.2.wait;
});

rand1 = [48, 50, 51, 53, 55, 56, 58, 60, 62, 63, 65, 67, 68, 70, 72, 74].midicps;
rand2 = [74, 72, 70, 68, 67, 65, 63, 62, 60, 58, 56, 55, 53, 51, 50, 48].midicps;
rand3 = [60, 58, 56, 55, 53, 51, 50, 48, 74, 72, 70, 68, 67, 65, 63, 62].midicps;	
rand4 = [75, 77, 79, 80, 82, 84, 86, 82, 79, 77, 75, 74, 72, 86, 84, 82].midicps;

~mybeat9 = Task({
var myCount = 0; 
	   loop({
		myCount = 0;
		16.do({	

Synth(\willsynth, [\freq, ([rand1, rand2, rand3, rand4].choose[myCount])]);
		
		myCount = myCount + 1;
		[0.2, 0.2, 0.2, 0.4, 0.4, 0.8].choose.wait
		});
	});
	0.2.wait;
});

//synth2
SynthDef(\Sine, { arg i_out = 0, freq = 0; var out; out = 
                  RLPF.ar(SinOsc.ar(freq, 0, EnvGen.kr(Env.perc(0.005, 2), 
                  levelScale: 0.1, doneAction: 2 )));
                  4.do({ out = AllpassN.ar(out, 0.05, [0.05, 0.05], 4) });
                  Out.ar( i_out, out );}).send(s);

sine1 =  [79, 0, 0, 75, 0, 0, 86, 0, 0, 79, 0, 74, 0, 70, 79, 77].midicps;
	
~mybeat4 = Task({
var myCount = 0; 
	   loop({
		myCount = 0;
		16.do({	

Synth(\Sine, [\freq, ([sine1].choose[myCount])]);

		myCount = myCount + 1;
		0.2.wait
		});
	});
	0.2.wait;
});

rand11 = [48, 50, 51, 53, 55, 56, 58, 60, 62, 63, 65, 67, 68, 70, 72, 74].midicps;
rand21 = [74, 72, 70, 68, 67, 65, 63, 62, 60, 58, 56, 55, 53, 51, 50, 48].midicps;
rand31 = [60, 58, 56, 55, 53, 51, 50, 48, 74, 72, 70, 68, 67, 65, 63, 62].midicps;	
rand41 = [75, 77, 79, 80, 82, 84, 86, 82, 79, 77, 75, 74, 72, 86, 84, 82].midicps;

~mybeat11 = Task({
var myCount = 0; 
	   loop({
		myCount = 0;
		16.do({	

Synth(\Sine, [\freq, ([rand11, rand21, rand31, rand41].choose[myCount])]);
		
		myCount = myCount + 1;
		[0.2, 0.2, 0.2, 0.4, 0.4, 0.8].choose.wait
		});
	});
	0.2.wait;
});

//synth3
SynthDef(\Noise, { arg out = 0, vol = 0.5; var o, mul, lfo, lfo1;             
                   mul = vol * EnvGen.ar(Env.perc(0, 16, 1, 4), 1.0, doneAction: 2);                
                  lfo1 = SinOsc.kr(XLine.kr(100, 2.5, 6.5), 0, 0.2);
                   lfo = XLine.kr(18000, 4000, 13);
                     o = { RHPF.ar(PinkNoise.ar(lfo1), lfo, 0.1) }; 
                   Out.ar(out, Pan2.ar(o, 0, mul))}).send(s);               

gate = [0.3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	
~mybeat7 = Task({
var myCount = 0; 
	   loop({
		myCount = 0;
		16.do({	

Synth(\Noise, [\vol, ([gate].choose[myCount])]);

		myCount = myCount + 1;
		3.2.wait
		});
	});
	0.8.wait;
});

//synth4
SynthDef(\Sine2, { arg i_out = 0, freq = 0; var out; out = 
                  RHPF.ar(PMOsc.ar(freq, freq, 5, 0, EnvGen.kr(Env.perc(0.005, 3), 
                  levelScale: 0.05, doneAction: 2 )));
                  4.do({ out = AllpassN.ar(out, 0.2, 0.025, 4) });
                  Out.ar( i_out, out );}).send(s);

sine2 =  [75, 0, 0, 72, 0, 0, 0, 0, 79, 0, 0, 74, 0, 0, 0, 0].midicps;
	
~mybeat10 = Task({
var myCount = 0; 
	   loop({
		myCount = 0;
		16.do({	

Synth(\Sine2, [\freq, ([sine2].choose[myCount])]);

		myCount = myCount + 1;
		0.2.wait
		});
	});
	0.2.wait;
});

rander1 = [48, 50, 51, 53, 55, 56, 58, 60, 62, 63, 65, 67, 68, 70, 72, 74].midicps;
rander2 = [74, 72, 70, 68, 67, 65, 63, 62, 60, 58, 56, 55, 53, 51, 50, 48].midicps;
rander3 = [60, 58, 56, 55, 53, 51, 50, 48, 74, 72, 70, 68, 67, 65, 63, 62].midicps;	
rander4 = [75, 77, 79, 80, 82, 84, 86, 82, 79, 77, 75, 74, 72, 86, 84, 82].midicps;

~mybeat13 = Task({
var myCount = 0; 
	   loop({
		myCount = 0;
		16.do({	

Synth(\Sine2, [\freq, ([rander1, rander2, rander3, rander4].choose[myCount])]);
		
		myCount = myCount + 1;
		[0.2, 0.2, 0.2, 0.4, 0.4, 0.8].choose.wait
		});
	});
	0.2.wait;
});

//Boomer
SynthDef(\Boom, { arg i_out = 0, vol = 0; var out; out = 
                  Pan2.ar(RLPF.ar((SinOsc.ar(XLine.kr(40.midicps, 2.midicps, 6), 0, 
                  EnvGen.kr(Env.perc(0.005, 8), levelScale: 0.15, doneAction: 2 ))), 70), 0);                 
                  Out.ar( i_out, out );}).send(s);

boo1 =  [0.3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0].midicps;
	
~mybeat8 = Task({
var myCount = 0; 
	   loop({
		myCount = 0;
		16.do({	

Synth(\Boom, [\vol, ([boo1].choose[myCount])]);

		myCount = myCount + 1;
		6.4.wait
		});
	});
	0.4.wait;
});
	
//build1
SynthDef(\Drop, { arg out = 0, vol = 0.5; var m, mul;              
                  mul = vol * EnvGen.ar(Env.perc(0, 6.55, 1, 90), 1.0, doneAction: 2);                  
                  m = RHPF.ar(Saw.ar(FSinOsc.kr(XLine.kr(10.midicps, 90.midicps, 8), 0, 20.midicps, 60.midicps), 0.1),
                  FSinOsc.kr(XLine.kr(0.7, 50, 8), 0, 120.midicps, 120.midicps), 0.2); 
                  Out.ar(out, Pan2.ar(m, 0, mul))}).send(s);               

build =  [0.4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	
~mybeat5 = Task({
var myCount = 0; 
	   loop({
		myCount = 0;
		16.do({	

Synth(\Drop, [\vol, ([build].choose[myCount])]);

		myCount = myCount + 1;
		0.8.wait
		});
	});
	0.4.wait;
});

//Bass
SynthDef(\Bass, { arg i_out = 0, freq = 0; var out; out = 
                  Pan2.ar(RLPF.ar((PMOsc.ar(freq, freq, 1, 0,
                  EnvGen.kr(Env.perc(0.005, 1.5), levelScale: 0.2, doneAction: 2 ))), 400), 0);                 
                  Out.ar( i_out, out );}).send(s);
              
bass1 =  [39, 0, 43, 0, 39, 0, 43, 0, 39, 0, 43, 0, 39, 0, 43, 0,
          38, 0, 43, 0, 38, 0, 43, 0, 38, 0, 43, 0, 38, 0, 34, 0].midicps;

~mybeat12 = Task({
var myCount = 0; 
	   loop({
		myCount = 0;
		32.do({	

Synth(\Bass, [\freq, ([bass1].choose[myCount])]);

		myCount = myCount + 1;
		0.2.wait
		});
	});
	0.2.wait;
});

//build2
SynthDef(\Imp, { arg out = 0, vol = 0.5; var n, mul, line, line2;              
                  mul = vol * EnvGen.ar(Env.perc(0, 3.22, 1, 90), 1.0, doneAction: 2);                 
                 line = XLine.kr(300, 1, 3.5);
                line2 = XLine.kr(5000, 10, 3.5);
                    n = { RHPF.ar(Impulse.ar(line, 0.4, 0.5), line2, 0.1) }; 
                 Out.ar(out, Pan2.ar(n, 0, mul))}).send(s);            	

build2 =  [0.3, 0, 0, 0, 0, 0, 0, 0, 0.3, 0, 0, 0, 0, 0, 0, 0];
	
~mybeat6 = Task({
var myCount = 0; 
	   loop({
		myCount = 0;
		16.do({	

Synth(\Imp, [\vol, ([build2].choose[myCount])]);

		myCount = myCount + 1;
		3.2.wait
		});
	});
	0.8.wait;
});

//drums
SynthDef("kick", { arg out = 0, bufnum = 0, vol = 0.2; var d, mul;
	mul = vol * EnvGen.ar(Env.perc(0.005, 0.4), 1.0, doneAction: 2);	
	d = PlayBuf.ar(1, bufnum, 1, BufRateScale.kr(bufnum), trigger: 0, loop: 0);
	Out.ar(out, Pan2.ar(d, 0, mul))}).send(s);	

SynthDef("snare", { arg out = 0, bufnum = 1, vol = 0.3; var e, mul;
	mul = vol * EnvGen.ar(Env.perc(0.005, 0.4), 1.0, doneAction: 2);	
	e = PlayBuf.ar(1, bufnum, 1, BufRateScale.kr(bufnum), trigger: 0, loop: 0);
	Out.ar(out, Pan2.ar(e, 0, mul))}).send(s);	

SynthDef("hihat1", { arg out = 0, bufnum = 2, vol = 0.2; var f, mul;
	mul = vol * EnvGen.ar(Env.perc(0.005, 0.4), 1.0, doneAction: 2);	
	f = PlayBuf.ar(1, bufnum, 1, BufRateScale.kr(bufnum), trigger: 0, loop: 0);
	Out.ar(out, Pan2.ar(f, 0, mul))}).send(s);	

SynthDef("Hhat2", { arg out = 0, bufnum = 3, vol = 0.2; var h, mul;
	mul = vol * EnvGen.ar(Env.perc(0.005, 0.4), 1.0, doneAction: 2);	
	h = PlayBuf.ar(1, bufnum, 1, BufRateScale.kr(bufnum), trigger: 0, loop: 0);
	Out.ar(out, Pan2.ar(h, 0, mul))}).send(s);	

h1 =  [0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2];

~mybeat1 = Task({
var myCount = 0; 
	   loop({
		myCount = 0;
		16.do({
		
		Synth("Hhat2", [\vol, ([h1].choose[myCount])]);
		
		myCount = myCount + 1;
		0.4.wait
		});
	});
	0.2.wait;
});

k4 =  [0.2, 0, 0, 0, 0, 0.2, 0, 0, 0.2, 0.2, 0, 0.2, 0, 0.2, 0, 0.2];
s5 =  [0, 0, 0.4, 0, 0, 0, 0.4, 0, 0, 0, 0.4, 0, 0, 0, 0.4, 0];
h6 =  [0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0, 0.4, 0.4, 0.4, 0, 0.4, 0];
h7 =  [0, 0.3, 0, 0.3, 0.3, 0, 0, 0.3, 0, 0.3, 0.3, 0, 0, 0.3, 0, 0.3];

~mybeat3 = Task({
var myCount = 0; 
	   loop({
		myCount = 0;
		16.do({
		
		Synth("kick", [\vol, ([k4].choose[myCount])]);
		Synth("snare", [\vol, ([s5].choose[myCount])]);
		Synth("hihat1", [\vol, ([h6, h7].choose[myCount])]);
		Synth("Hhat2", [\vol, ([h7, h6].choose[myCount])]);
		
		myCount = myCount + 1;
		0.4.wait
		});
	});
	0.2.wait;
});
)

d = Synth(\kick);
e = Synth(\snare);
f = Synth(\hihat1);
h = Synth(\Hhat2);
j = Synth(\Sine);	
a = Synth(\willsynth);
o = Synth(\Noise);
j = Synth(\Sine2);
p = Synth(\Boom);	
m = Synth(\Drop);
n = Synth(\Imp);
q = Synth(\Bass);	

//Finally evaluate this last section of code to play the piece from start to finish.
(
Task({
~sCount = 0; 
	loop({
		
	if ( ~sCount == 0,   { ~mybeat4.play; } );
	if ( ~sCount == 32,  { ~mybeat7.play; ~mybeat8.play; } );		
	if ( ~sCount == 64,  { ~mybeat3.play; } );
	if ( ~sCount == 112, { ~mybeat6.play; } );
	if ( ~sCount == 127, { ~mybeat3.stop; ~mybeat8.stop; ~mybeat4.stop;} );
	if ( ~sCount == 128, { ~mybeat1.play; ~mybeat2.play;  } );		
	if ( ~sCount == 191, { ~mybeat2.stop; ~mybeat1.stop; } );
	if ( ~sCount == 192, { ~mybeat9.play; ~mybeat8.play; ~mybeat3.play; } );
	if ( ~sCount == 255, { ~mybeat9.stop; ~mybeat1.stop; } );
	if ( ~sCount == 256, { ~mybeat10.play; ~mybeat11.play; } );
	if ( ~sCount == 287, { ~mybeat6.stop; ~mybeat10.stop; } );
	if ( ~sCount == 288, { ~mybeat5.play; ~mybeat13.play; } );
	if ( ~sCount == 351, { ~mybeat3.stop; ~mybeat10.stop; ~mybeat8.stop; ~mybeat13.stop; ~mybeat11.stop; } );
	if ( ~sCount == 352, { ~mybeat1.play; ~mybeat12.play; } );
	if ( ~sCount == 383, { ~mybeat1.stop; } );
	if ( ~sCount == 384, { ~mybeat3.play; ~mybeat11.play; ~mybeat10.play; } );
	if ( ~sCount == 415, { ~mybeat10.stop; } );
	if ( ~sCount == 416, { ~mybeat13.play; ~mybeat9.play; } );
	if ( ~sCount == 445, { ~mybeat3.stop; ~mybeat13.stop; ~mybeat9.stop; ~mybeat11.stop; ~mybeat12.stop; } );
	if ( ~sCount == 448, { ~mybeat4.play; ~mybeat8.play; } );
	if ( ~sCount == 479, { ~mybeat4.stop; ~mybeat8.stop; } );
	if ( ~sCount == 494, { ~mybeat5.stop; ~mybeat7.stop; } );
	
	~sCount = ~sCount + 1;	
	~sCount.postln;
	0.2.wait;	
	});
	}).play;
)
