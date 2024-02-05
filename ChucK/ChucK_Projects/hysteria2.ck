StifKarp inst=>SinOsc overdrive=> LPF l  => dac;
1 => overdrive.sync;
1=> inst.gain;
1 =>  overdrive.sync;
0.32=> inst.gain;
180::ms => dur T;
T - (now % T) => now;

fun int scale(int a, int sc[]) {
  sc.cap() => int n; //number of degrees in scale
  a/n => int o; //octave being requested, number of wraps
  a%n => a; //wrap the note within first octave

  if ( a<0 ) { //cover the negative border case
    a + 12 => a;
    o - 1 => o;
  }
  //each octave contributes 12 semitones, plus the scale
  return o*12 + sc[a];
}
[0,0,6,0,6,7,0,6,0,4,0,5,5,4,3,4] @=> int mel[]; //sequence data
[0,2,3,5,7,8,10,12] @=> int minor[]; //minor scale

for (0=>int i;true ; i++) { //infinite loop
  Std.mtof(  3*12 + -3 + scale( mel[i%mel.cap()], minor )) => inst.freq; //set the note
  inst.noteOn( 0.5 ); //play a note at half volume
  T => now; //compute audio for 0.3 sec
}