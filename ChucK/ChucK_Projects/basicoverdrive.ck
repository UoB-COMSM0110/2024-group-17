SawOsc signal => SinOsc overdrive => dac;
1 => overdrive.sync; // set sync option to Phase Mod.
0.03 => signal.gain;
440 => signal.freq;
while(true){
    4::second => now;
}