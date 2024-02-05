
OscIn oin;
6449 => oin.port;
OscMsg msg;
oin.addAddress( "/foo/notes" );

StifKarp inst=>SinOsc overdrive=>LPF l =>Gain g=> dac;

1 =>  overdrive.sync;
0.32=> inst.gain;

g=> Delay d1 => dac;
g=> Delay d2 => dac;
g=> Delay d3 => dac;

d1=>d1;
d2=>d2                      ;
d3=>d3;

0.1=>d1.gain =>d2.gain=>d3.gain;

0.06::second =>d1.max=>d1.delay;
0.08::second =>d2.max=>d2.delay;

0.10::second =>d3.max=>d3.delay;

0.6=>d1.gain =>d2.gain=>d3.gain;

4000 =>l.freq;
1.3 => l.Q;


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
            
spork ~ riff();
fun void riff(){
  for (0=>int i;true ; i++) { //infinite loop
    Std.mtof(  3*12 + 9 + scale( mel[i%mel.cap()], minor )) => inst.freq; //set the note
   inst.noteOn( 0.5 ); //play a note at half volume
    T => now; //compute audio for 0.3 sec
  }
}

while(true){
    float i;

    oin => now;
    
    oin.recv(msg);
    msg.getInt(0) => i;

    if(i == 1){        
         <<<"We have recieved!">>>;
       
        1000=> global float freq => l.freq;
    }
    if(i == 2){   
         <<<"We have recieved!">>>;
       
        4000=> global float freq => l.freq;
    }
}


