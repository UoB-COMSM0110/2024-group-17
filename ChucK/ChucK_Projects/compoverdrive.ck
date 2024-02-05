SinOsc signal => dac;

// define transfer function
fun void AtanDrive(UGen input, UGen output)
{
    Step result => output;
    do{
      (Math.atan(input.last()) / pi) => result.next;
    }while (samp => now);   
}

spork ~ AtanDrive(signal, dac);
.35 => dac.gain; // keep the level down

// test various sinosc gain and freq
do
{
     440=> signal.freq;
     1.15=> signal.gain;
   
    .8::second => now;
}
while (true);