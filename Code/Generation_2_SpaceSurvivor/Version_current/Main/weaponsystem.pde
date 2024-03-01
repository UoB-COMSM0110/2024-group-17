
class weaponsystem{
  private int weapon_id;
  // basic 0 
  public void update_id(int new_id){
   weapon_id=new_id;
  }
  public int checkweapon(){
    return weapon_id ;
  }
  public void useweapon(float mpx, float mpy){
  switch  (weapon_id)
  {
    case 0:
     // r1 = new rocket();
      //r1.attack(mpx,mpy,x,y);
      break;//
    default: 
      break;
  }
  
  }
  

}
