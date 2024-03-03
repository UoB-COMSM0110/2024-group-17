class rocket implements weapon{
int ms=-1;
int cdtime=2000;
int r ;
int boom_r=200;
int MAX = 600;
rocket(){
r=25;
}
boolean attack(float mpx, float mpy,float x, float y){
 image(weaponrocket,x,y);
 if(sqrt(sq(mpx-x)+sq(mpy-y))>=MAX){
  // println("reach");
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
void rocketboom(float msx,float msy){
  int size = 400;
image(explo, msx-size/2, msy-size/2,size,size);
}
}
