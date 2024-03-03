//This is the title sequence, inspired by Daft Punks Contact
//Lets try for a Gmajor chord first!
SawOsc n1 => Gain gall=>JCRev reverb=> HPF highpass=>ResonZ lowpass => ADSR en => dac;
SawOsc n2 => gall;
SawOsc n3 => gall;
SawOsc n4 => gall;
SawOsc n5 => gall;
SawOsc n6 => gall;

SawOsc melody => JCRev melrev => HPF melhp => LPF mellp => ADSR melen => Gain on => dac;

0.1=>gall.gain;
0.05 => reverb.mix;

lowpass.set(50,0.1);
highpass.set(200,0.5);
//reson.set(196,0.9);
en.set(3000::ms, 50::ms,1, 500::ms);

0=>on.gain;


spork ~ drone();

246.94 => melody.freq;
1 => on.gain;


Event wait;
wait =>now;


fun void drone(){ 
 while(true){
      98 => n4.freq;
      1.4 => n4.gain;
      49 => n5.freq;
      196 => n1.freq;
      246.94 => n2.freq;
      1.4 => n2.gain;
      293.66 => n3.freq;
      220=>n6.freq;
      en.keyOn();
      100::second => now;   
  }    
}