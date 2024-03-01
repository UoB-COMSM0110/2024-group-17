class Enemy{
  int x;
  int y;
  int r;
  int bounce;
  int speed;
  int damage;
  long ptick;
  boolean shouldRemove;

  float delx;
  float dely;
  float dist;
  float Rx;
  float Ry;
  float dis;
  char character;
  
  int colr;
  int colg;
  int colb;
  
  PImage enemyImage1;
  PImage enemyImage2;
  PImage enemyImage;
  int animCounter;
  ParticleSystem ps;
  
  Enemy(int startingX, int startingY,Player p1,levelManager management){
   x = startingX;
   y = startingY;
   ptick=0;
   animCounter = 0;
   shouldRemove = false;
   characterattributes(management);
   updateVector(p1);
   updateRock(w1);
  }
  
  void characterattributes(levelManager management){
    speed = 5*management.currentlevel.fast;
    colr = management.currentlevel.colr;
    colg = management.currentlevel.colg;
    colb = management.currentlevel.colb;
    bounce = management.currentlevel.bounce;
    damage = management.currentlevel.doubledamage;
    r = 25;
    character = management.currentlevel.character;
  }

  
  void updateVector(Player p1){
     delx = x-p1.x;
     dely = y-p1.y;
     dist = sqrt(delx*delx + dely*dely);
  } 
      
  void render(){
    // noFill();
    // strokeWeight(10);
    // ellipse(x,y,r,r);
    //image(asymbol,x-500,y-500);
    // fill(colr,colg,colb);
    // text(character,x,y+r/2);
  }
  
  void chase(){
    x -= (delx/dist) * speed;
    y -= (dely/dist) * speed;
  }
  
  void collideTest(Player p1){    
    if(dist < (r + p1.r)){
      //Collision detected
      p1.xmom -= delx * 1/dist * bounce ;
      p1.ymom -= dely * 1/dist * bounce ;
      if(p1.rolling || p1.attacking){
         shouldRemove = true;
         oscP5.send(kill, myBroadcastLocationKill);
         p1.kill(1);
         return;
      }
      if(p1.vuln){
        p1.damaged(1);
      }
    }
  }
  
    void updateRock(weaponsystem w1){
     Rx = x-w1.wx;
     Ry = y-w1.wy;
     dis = sqrt(Rx*Rx + Ry*Ry);
  }
  
  void collTest(weaponsystem w1){
    int ra = w1.getR();
    println(dis,r,ra);
    if(dis < (r + ra)){
      println("hit!");
      shouldRemove = true;
      oscP5.send(kill, myBroadcastLocationKill);
      p1.kill(1);
      return;
    }
  }
  
}
