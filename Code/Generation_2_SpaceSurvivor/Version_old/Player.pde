class Player{
  float x;
  float y;
  float r;
  
  float xmom;
  float ymom;
  boolean mommode;
  
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
    r = 500.0;

    ptick=0;
    speed = 2;
    rolllength = 30;
    cooldown = 100;
    player = inplayer;
    mommode = true;
    canmoveU = true;
    canmoveL = true;
    canmoveD = true;
    canmoveR = true;
    
  }
  
  void render(){
    image(player,x-250,y-250);
  }
  
  void move(boolean[] keyspressed){
    //i think we might need vector/momementum based movement 
    
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
    
    //momemtum mode???
    float control = 10;
    if(mommode){
      x +=xmom;
      y +=ymom;
      
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
      
      xmom = 0.9*xmom;
      ymom = 0.9*ymom;
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
