class rocket implements weapon{
int ms=-1;
int cdtime=2000;
int r = 25;
int MAX = 600;
boolean attack(float mpx, float mpy,float x, float y){
 image(weaponrocket,x,y);
 if(mpx-x <= 500 && mpy-y <= 500){
   println("reach");
   r = 200;
   return true;
 }
 return false;
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
