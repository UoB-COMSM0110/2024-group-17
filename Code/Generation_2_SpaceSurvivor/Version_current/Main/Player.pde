class Player{
  //Player characteristics
  float health = 100;
  int points = 0;
  Coordinate position;
  float r = 25;
  float control = 1;
  float xmom = 0.0;
  float ymom = 0.0;
  long ptick = 0;
  long previousTick= tick;
  
  //Damage cooldowns
  boolean vuln = false;
  long dTick;
  
  //Attack attributes
  boolean bAoncd = false;
  boolean attacking = true;
  int bAcd;
  long aTick;
  int bAlen;
  
  PImage player;
  
  int knockbackCD=500;
  int knockbackMag=-2;
  int knockbackTime=50;
  long knockbackTriggerTime=0;
  boolean knockbackOnCD = false;
  boolean knockbackActive = false;
  
  Weapons weaponSystem = new Weapons();
  
  Player(float startingX, float startingY,PImage inplayer){
    position = new Coordinate(startingX, startingY);
    previousTick = tick;
    aTick = 0;
    bAcd = 75;
    bAlen = 20;
    player = inplayer; 
  }
  
  public void doThings(boolean[] keyspressed){
    updatecds();
    move(keyspressed);
    weaponSystem.doThings(keyspressed,position);
    if(keyspressed[5]){basicAttack();}
    render();
  }
  
  public float xGet(){return position.xGet();}
  
  public float yGet(){return position.yGet();}
  
  void render(){
    fill(255, 165, 0);
    image(player,position.xGet()-50,position.yGet()-50);
  }
  
  //Currently works frame to frame, need to switch over to tick based!
  void move(boolean[] keyspressed){
    position.move(xmom,ymom);
    if(true){
      if(keyspressed[0]){
        ymom -= control;
      }
      if(keyspressed[1]){
        xmom -= control;
      }
      if(keyspressed[2]){
        ymom += control;
      }
      if(keyspressed[3]){
        xmom += control;
      }
    }
    xmom = 0.9*xmom;
    ymom = 0.9*ymom;
    if(xmom<0.1 && xmom>-0.1){
      xmom = 0;
    }
    if(ymom<0.1 && ymom>-0.1){
      ymom = 0;
    }
    
  
    knockBackField();
    
   }
   
  void knockBackField(){
    if(!knockbackOnCD && keyspressed[5]){
      knockbackTriggerTime = tick;
      knockbackModifier = knockbackMag;
      knockbackOnCD = true;
      knockbackActive = true;
    }
  }
    
  void updatecds(){
     if(attacking){
       if(tick-aTick > bAlen){
         attacking = false;
         r = 25;
       }
     }
     if(knockbackOnCD){
       if(tick - knockbackTriggerTime>knockbackCD){
         knockbackOnCD = false;
       }
     }
     if(knockbackActive){
       if(tick-knockbackTriggerTime>knockbackTime){
         knockbackModifier = 1;
         knockbackActive = false;
       }
     }
     if(health<100){
       println(tick,previousTick);
       health += ((float)(tick-previousTick))*0.05;
     }
     previousTick = tick;
  }
  
  void damaged(int dam){
    health-=dam;
    vuln = true;
    //dTick = tick;
  }
  
  void kill(int point){
    points += point;
  }
    
  void basicAttack(){
    
     if(tick -aTick < bAcd){return;}

     float mpx = (mouseX-(width/2))*2;
     float mpy = (mouseY-(height/2))*2;
      xmom = (mpx)/10;
      ymom = (mpy)/10;
      r = 100;
      aTick = tick;
      bAcd = 75;
      attacking = true;
  }
 
}
