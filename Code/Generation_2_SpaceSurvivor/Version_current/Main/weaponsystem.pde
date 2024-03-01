
class weaponsystem{
  private int weapon_id;
  private boolean weapon_atv;
  rocket r1;
  float msx;
  float msy;
  float wx;
  float wy;
  float startx;
  float starty;
  int speed;
  weaponsystem(){
  weapon_id=0;
  weapon_atv=false;
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
  if(weapon_atv){
  float mx=msx-startx;
  float my=msy-starty;
  float dist=sqrt(mx*mx+my*my);
  wx +=(mx/dist)*speed;
  wy +=(my/dist)*speed;
 // println(startx,starty);
 //println(msx,msy); 
  r1.attack(msx,msy,wx-50,wy-50);
 
  }
  }
  public void useweapon(boolean isactive, float x, float y){
  if(isactive){
   
    
    switch  (weapon_id)
  {
    case 0:
   if(r1.checkcd()){
      msx=((mouseX-(width/2))/scale)+x;
      msy=((mouseY-(height/2))/scale)+y;
      wx=x;
      wy=y;
      startx=x;
      starty=y;
      weapon_atv=true;
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
    return r1.r;
  }
}
