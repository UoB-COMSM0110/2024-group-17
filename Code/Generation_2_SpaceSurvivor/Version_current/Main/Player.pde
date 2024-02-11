class Player{
  //Player characteristics
  int health;
  int points;
  float x;
  float y;
  float r;
  float control = 0.5;
  float xmom;
  float ymom;
  long ptick;
  
  //Damage cooldowns
  boolean vuln;
  long dTick;
  int grace;
  
  //Roll attributes
  float rollboost;
  int rolllength; 
  int Rcd;
  long rollstart;
  boolean rolling;
  boolean rw;
  boolean ra;
  boolean rs;
  boolean rd;

  //Attack attributes
  boolean bAoncd;
  boolean attacking;
  int bAcd;
  long aTick;
  int bAlen;
  
  //Animation counter 
  int animCounter = 0;
  PImage player;
  
  Player(float startingX, float startingY,PImage inplayer){
    x = startingX;
    y = startingY;
    xmom = 0.0;
    ymom = 0.0;
    r = 25.0;
    points = 0; 
    grace = 100;
    vuln = true;
    bAoncd = false;
    attacking = false;
    ptick=0;
    aTick = 0;
    bAcd = 75;
    bAlen = 20;
    rollboost =3;
    rolllength = 50;
    Rcd = 100;
    player = inplayer;
    health = 3;
  }
  
  void render(){
    fill(255);
    if (xmom > 0 && (ymom >= 0 || ymom < 0)) {
       counter++;
       if (player == playerLeftWalk1 || player == playerLeftWalk2 || player == playerLeftWalk3) {
         player = playerRightWalk1; 
       }
       if (counter % 5 == 0) {
       if (player == playerRightWalk1) {
          player = playerRightWalk2; 
          counter = 0;
       } else if (player == playerRightWalk2) {
          player = playerRightWalk3; 
          counter = 0;
       } else if (player == playerRightWalk3) {
          player = playerRightWalk1; 
          counter = 0;
       }
      } 
     }
     if (xmom < 0 && (ymom >= 0 || ymom < 0)) {
       counter++;
       if (player == playerRightWalk1 || player == playerRightWalk2 || player == playerRightWalk3) {
         player = playerLeftWalk1; 
       }
       if (counter % 5 == 0) {
       if (player == playerLeftWalk1) {
          player = playerLeftWalk2; 
          counter = 0;
       } else if (player == playerLeftWalk2) {
          player = playerLeftWalk3; 
          counter = 0;
       } else if (player == playerLeftWalk3) {
          player = playerLeftWalk1; 
          counter = 0;
       }
      } 
     }
    image(player,x-50,y-50);
  }
  
  //Currently works frame to frame, need to switch over to tick based!
  void move(boolean[] keyspressed){
    x +=xmom;
    y +=ymom;
    if(!rolling){
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
    else{
      if(rw){
        ymom -= rollboost;
      }
      if(ra){
        xmom -= rollboost;
      }
      if(rs){
        ymom += rollboost;
      }
      if(rd){
        xmom += rollboost;
      }
     if(tick - rollstart >=rolllength){
        rolling = false;
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
   }
    
  void updatecds(){
     if(attacking){
       if(tick-aTick > bAlen){
         attacking = false;
       }
     }
     if(!vuln){
       if(tick-dTick > grace){
         vuln = true;
       }
     } 
  }
  
  void damaged(int dam){
    health-=dam;
    vuln = false;
    dTick = tick;
  }
  
  void kill(int point){
    points += point;
  }
    
  
  void roll(boolean[] keyspressed){
    if(tick-Rcd >rollstart){
      rollstart = tick;
      rolling = true;
      rw = keyspressed[0];
      ra = keyspressed[1];
      rs = keyspressed[2];
      rd = keyspressed[3];
    }
  }
  
  void basicAttack(float mpx, float mpy){
      xmom = (mpx-x)/10;
      ymom = (mpy-y)/10;
      aTick = tick;
      bAcd = 75 + abs(beatdist());
      println(bAcd);
      attacking = true;
  }
 
}