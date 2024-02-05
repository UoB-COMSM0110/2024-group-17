class Player{
  float x; 
  float y;
  float w;
  float h;
  float speed;
  long ptick;
  
  int rolllength; 
  int cooldown;
  long rollstart;
  boolean rolling;
  boolean rw;
  boolean ra;
  boolean rs;
  boolean rd;
  
  boolean canmoveU;
  boolean canmoveL;
  boolean canmoveD;
  boolean canmoveR;
  
  PImage player;
  
  Player(float startingX, float startingY,PImage inplayer){
    x = startingX;
    y = startingY;
    h = 45;
    w = 45;
    ptick=0;
    speed = 2;
    rolllength = 30;
    cooldown = 100;
    player = inplayer;
    canmoveU = true;
    canmoveL = true;
    canmoveD = true;
    canmoveR = true;
    
  }
  
  void render(){
    image(player,x,y);
  }
  
  void move(boolean[] keyspressed){
    float change = (tick-ptick)*speed/2;
    ptick = tick;
    if(keyspressed[0]&&canmoveU){
      y-=change;
    }
    if(keyspressed[1]&&canmoveL){
      x-=change;
    }
    if(keyspressed[2]&&canmoveD){
      y+=change;
    }
    if(keyspressed[3]&&canmoveR){
      x+=change;
    }
    if(rolling){
    if(rw&&canmoveU){
      y-=change;
    }
    if(ra&&canmoveL){
      x-=change;
    }
    if(rs&&canmoveD){
      y+=change;
    }
    if(rd&&canmoveR){
      x+=change;
    }
      if(tick - rollstart >=rolllength){
        rolling = false;
        speed = 2;
        return;
      }
    }
    canmoveU = true;
    canmoveL = true;
    canmoveD = true;
    canmoveR = true;
  }  
  
  void roll(boolean[] keyspressed){
    if(tick-cooldown >rollstart){
      rollstart = tick;
      speed = 3;
      rolling = true;
      rw = keyspressed[0];
      ra = keyspressed[1];
      rs = keyspressed[2];
      rd = keyspressed[3];
    }
  }
  

}
