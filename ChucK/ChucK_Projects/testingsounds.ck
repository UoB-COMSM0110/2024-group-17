 
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
[220.0,249.94,277.18,293.66,329.63,369.99,415.3,440.0] @=> float notes[];


while(true){
   150::ms => dur T;
 //  T - (now % T) => now;
   TriOsc source =>SinOsc overdrive=>Gain g=>LPF l => ADSR e => dac;
   1 => overdrive.sync;
   1 => overdrive.gain;
   2 => g.gain;
   150 => l.freq;
   e.set( 1::ms, 8::ms, .5, 500::ms );
   attack => now;
   for (0=>int i;i<2 ; i++) {
      e.keyOn();
      notes[Math.random2(0,7)] => source.freq;    
      T => now; //compute audio for 0.3 sec
  }
  e.keyOff();
//  600::ms => now;
}
 
 

            