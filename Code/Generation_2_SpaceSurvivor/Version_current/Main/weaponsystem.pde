
class weaponsystem{
  private int weapon_id;
  ArrayList<rocket> Rockets;
  
  long currentTick;
  long rocketCD;
  boolean rocketAvailable = true;
  
  float msx;
  float msy;
  float wx;
  float wy;
  float startx;
  float starty;
  int speed;
  
  PImage rocketImage;
  PImage exploImage;
  boolean rocketActive;
  long rocketFireTime;
  
  weaponsystem(PImage weaponrocket,PImage explo){
    weapon_id=0;
    speed=10;
    rocketImage = weaponrocket;
    exploImage = explo;
  }
  
/*
  public void update_id(int new_id){
   weapon_id=new_id;
  }

  public int checkweapon(){
    return weapon_id ;
  }
*/
     
  public void useweapon(float x, float y){
    println("lets goo");
    switch  (weapon_id){
    case 0:
      if(rocketAvailable){
        println("time to fire");
        rocketAvailable = false;
        msx=((mouseX-(width/2))/scale)+x;
        msy=((mouseY-(height/2))/scale)+y;
        r1=new rocket(msx,msy,x,y,rocketImage,exploImage);
        rocketFireTime = tick;
        rocketActive = true;
      }
       break;
     default: 
       break;
    
    }
  }
  
  void weaponUpdates(){
    currentTick = tick;
    checkRocketCD();
    if(rocketActive){
      println("rocket is moving");
      r1.move();
      r1.boomTime();
      r1.checkBoom();
      r1.render();
    }   
  }
    
  void checkRocketCD(){
     if(currentTick - rocketFireTime > rocketCD){
        rocketAvailable = true;
     }
  }
    
}
