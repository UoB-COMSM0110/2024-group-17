
class weaponsystem{
  private int weapon_id;
  private int weapon_atv;
  rocket r1;
  float msx;
  float msy;
  float wx;
  float wy;
  float startx;
  float starty;
  int speed;
  boolean ishit=false;
  weaponsystem(){
  weapon_id=0;
  weapon_atv=0;
  r1 = new rocket();
  speed=10;
  }
  // basic 0 
  public void update_id(int new_id){
   weapon_id=new_id;
  }
  public int checkweapon(){
    return weapon_id ;
  }
  
  public void move(){
  if(weapon_atv==1){
  float mx=msx-startx;
  float my=msy-starty;
  float dist=sqrt(mx*mx+my*my);
  wx +=(mx/dist)*speed;
  wy +=(my/dist)*speed;
 // println(startx,starty);
 //println(msx,msy); 
  if(r1.attack(startx,starty,wx-50,wy-50)){
    hit();
    r1.rocketboom(msx-50,msy-50);
  }
  }
  }
  
  public void useweapon(boolean isactive, float x, float y){
  if(isactive){
   
    
    switch  (weapon_id)
  {
    case 0:
   if(r1.checkcd()){
      r1 = new rocket();
      
      msx=((mouseX-(width/2))/scale)+x;
      msy=((mouseY-(height/2))/scale)+y;
      wx=x;
      wy=y;
      startx=x;
      starty=y;
      weapon_atv=1;
      r1.setcd();
   }
   else {
   }
      //r1.attack(msx,msy,x-50,y-50);
      break;//
    default: 
      break;
  }
  }
  }
  
  int getR(){
    if(weapon_atv == 0){
      return -999;
    }
    if( weapon_atv == 2){
      if(time_remain()<500){
        println("called",time_remain());
      r1.rocketboom(msx-50,msy-50);
      return r1.boom_r;
      }
      else{
      weapon_atv=0;
      return -999;
      }
    }
    if(weapon_atv == 1){
    return r1.r;
   }
   return -999;
  }
  
  void hit(){
  ishit=true;
  if(weapon_atv!=2){
  weapon_atv = 2;
  time_hit();
}
}

  int time_h;
  void time_hit(){
  time_h=millis();
  }
  int time_remain(){
   int time_now=millis();
  return abs(time_now-time_h);
  }
}
