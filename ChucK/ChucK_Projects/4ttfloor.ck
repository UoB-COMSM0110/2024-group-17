120 => float bpm;

SawOsc t => Envelope e => LPF l => dac;
(0.2 * 1/bpm):: minute => e.duration;
0.9 => t.gain;
200 => l.freq;
1 => l.Q;

200::ms => dur T;
T - (now % T) => now;

while(true){
55 => t.freq;
e.keyOn();
(0.25*T*4)  => now;
e.keyOff();
0 => t.freq;
(0.75*T*4)  => now;
}
