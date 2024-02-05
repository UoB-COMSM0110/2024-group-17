OscIn attack;
6449 => attack.port;
OscMsg msg1;
attack.addAddress( "/foo/notes" );

OscIn akill;
6448 => akill.port;
OscMsg msg2;
akill.addAddress( "/foo/notes2" );

OscIn stopsignal;
6447 => stopsignal.port;
stopsignal.addAddress( "/foo/notes3" );

OscIn startsignal;
6446 => startsignal.port;
startsignal.addAddress( "/foo/notes4" );

OscOut xmit;
xmit.dest("127.0.0.1",6500);
xmit.start("/foo/notes");

global int tempo;
100 => tempo;
tempo => xmit.add;

global Gain gall => dac;
0.8 => gall.gain;

1 => global int stop;

[220.0,249.94,277.18,293.66,329.63,369.99,415.3,440.0] @=> float notes[];
            
spork ~ beat();
spork ~ attacksearch();
spork ~ killsearch();

Event a;
a=>now;

fun void beat(){
   SawOsc i => Gain g1 => LPF lf => ADSR en => global Gain gall;
   0.4 => g1.gain;
   en.set(10::ms, 50::ms,0.3, 500::ms);
   lf.set(150,0.8);
   110 => i.freq;
   xmit.send();
   while(stop==1){
     en.keyOn();
     100:: ms => now;
     en.keyOff();
     500::ms =>now;
   }   
}

fun void riff(){
   TriOsc source =>SinOsc overdrive=>Gain g=>LPF l => ADSR e =>global Gain gall;
   1 => overdrive.sync;
   1 => overdrive.gain;
   1 => g.gain;
   150 => l.freq;
   e.set( 1::ms, 8::ms, .5, 500::ms );

   for (0=>int i;i<2 ; i++) {
      e.keyOn();
      notes[Math.random2(0,7)] => source.freq;    
      150::ms => now; //compute audio for 0.3 sec
  }
  e.keyOff();
  400::ms=>now;

}

fun void kill(){
  SqrOsc k => LPF lf => HPF hf => ADSR en =>  global Gain gall;
  en.set(10::ms, 50::ms,0.5, 400::ms);
  lf.set(150,0.4);
  hf.set(1000,0.8);
  3 => k.gain;
  150::ms => dur T;
  T-(now%T) => now;
  en.keyOn();
  notes[Math.random2(0,7)]*2 => k.freq;
  1::ms => now;
  en.keyOff();
  74::ms => now; 
}

fun void attacksearch(){
  while(true){

    attack => now;
    
    attack.recv(msg1);
    
    spork ~ riff();

  }
}

fun void killsearch(){
  while(true){

    akill => now;
    
    akill.recv(msg2);
  
    spork ~ kill();

  }
}

fun void stopsearch(){
  while(true){
    stposignal => now;
    
    stop=>0;
  
    startsignal =>now;
    
    stop = 1;
  }
}