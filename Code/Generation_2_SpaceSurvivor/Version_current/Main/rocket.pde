class rocket implements weapon{
int ms=-1;
int cdtime=2000;
void attack(float mpx, float mpy,float x, float y){
 image(weaponrocket,x,y);
 float xrok = mpx;
 float yrok = mpy;
}
void setcd(){
ms=millis();
}
boolean checkcd(){
int ms_now=millis();
if (ms_now-ms>=cdtime){
  return true;
}
else{
  return false;
}
}
float getcd(){ 
int ms_now=millis();
ms_now=(ms_now-ms)/1000;
return ms_now;
}
}
