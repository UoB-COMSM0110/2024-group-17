
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
  weaponsystem(){
  weapon_id=0;
  weapon_atv=false;
  r1 = new rocket();
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
  float mx=msx-wx;
  float my=msy-wy;
  float dist=sqrt(mx*mx+my*my);
  wx -=(mx/dist)*5;
  wy -=(my/dist)*5;
  
  r1.attack(msx,msy,wx-50,wy-50);
 
  }
  }
  public void useweapon(boolean isactive, float x, float y){
  if(isactive){
     msx=mouseX;
     msy=mouseY;
 image(weaponrocket,msx,msy);
    weapon_atv=true;
    switch  (weapon_id)
  {
    case 0:
      wx=x;
      wy=y;
      startx=x;
      starty=y;
      //r1.attack(msx,msy,x-50,y-50);
      break;//
    default: 
      break;
  }
  }
  }
  

}
