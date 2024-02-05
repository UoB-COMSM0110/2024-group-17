class Enemy{
  int x;
  int y;
  int r;
  int bounce;
  int speed;
  int damage;
  long ptick;
  boolean shouldRemove;
  //movement path
  float delx;
  float dely;
  float dist;
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
  }
  
  void characterattributes(levelManager management){
    speed = 5*management.currentlevel.fast;
    colr = management.currentlevel.colr;
    colg = management.currentlevel.colg;
    colb = management.currentlevel.colb;
    bounce = management.currentlevel.bounce;
    damage = management.currentlevel.doubledamage;
    r = 50;
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
  
  
//Still only works for if the player is smaller than the object, we need to make another one for if the object is smaller. 
  void collideTest(Player p1){
    
    if(dist < (r + p1.r)){
      //Collision detected
      p1.xmom -= delx * 1/dist * bounce ;
      p1.ymom -= dely * 1/dist * bounce ;
      println("collision detected");
      if(p1.rolling || p1.attacking){
         println("time to kill the object");
         shouldRemove = true;
         oscP5.send(kill, myBroadcastLocationKill);
         p1.kill(1);
         return;
      }
      if(p1.vuln){
        println("time to kill the player",p1.attacking);
        p1.damaged(1);
      }
    }
  }
}
