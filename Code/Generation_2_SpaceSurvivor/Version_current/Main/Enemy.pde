class Enemy implements Comparable<Enemy>{
  float x;
  float y;
  int r;
  Float Bearing;
  float Vx;
  float Vy;
  float Vmag;
  float Speed = 8;
  
  int bounce;
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
      
  Enemy(float startingX, float startingY,Player p1,levelManager management){
   x = startingX;
   y = startingY;
   ptick=0;
   animCounter = 0;
   shouldRemove = false;
   characterattributes(management);
   updateVector(p1);
   Vx = -delx;
   Vy = -dely;
   updateRock(w1);
  }
  
  void characterattributes(levelManager management){
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
     modifyBearing();
  }
  
  void modifyBearing(){ 
    if(dely>0){
      Bearing = atan(dely/delx);
      return;
    }
    if(dely<0){
      Bearing = -atan(dely/delx);
      return;
    }
    if(dely==0 && delx>0){
      Bearing = 0.0;
      return;
    }
    if(dely==0 && delx<0){
      Bearing = PI;
      return;
    } 
  }
      
  void render(){
    // noFill();
    // strokeWeight(10);
    // ellipse(x,y,r,r);
    //image(asymbol,x-500,y-500);
    // fill(colr,colg,colb);
    // text(character,x,y+r/2);
  }
  
  void chase(int EnemyIndex,int size, int knockMod){
    float deltaVx=0;
    float deltaVy=0;
    for(int i=0;i<size;i++){
      if(i!=EnemyIndex){
        Enemy otherEnemy = EnemyList.get(i);
        float dist = sqrt((x - otherEnemy.x)*(x - otherEnemy.x) + (y - otherEnemy.y)*(y - otherEnemy.y));
        if(dist <500){
          deltaVx-=(otherEnemy.Vx-Vx)*0.0005;
          deltaVy-=(otherEnemy.Vy-Vy)*0.0005;        
        }
        if(dist<100){
          deltaVx +=500000*(x-otherEnemy.x)/(dist*dist*dist); 
          deltaVy +=500000*(y-otherEnemy.y)/(dist*dist*dist); 
        }
        if(abs(otherEnemy.Bearing-Bearing) < 0.3){
          deltaVx -=5*(x-otherEnemy.x)/(dist); 
          deltaVy -=5*(y-otherEnemy.y)/(dist); 
        }
      }
    }
    
    deltaVx+=knockMod*(-delx)*1;
    deltaVy+=knockMod*(-dely)*1;
    
    float deltaVmag =sqrt(deltaVx*deltaVx+deltaVy*deltaVy); 

    deltaVx = deltaVx/deltaVmag;
    deltaVy = deltaVy/deltaVmag;

    Vx+=deltaVx;
    Vy+=deltaVy;
    
    Vmag = sqrt(Vx*Vx+Vy*Vy);
    
    Vy = Vy/Vmag;
    Vx = Vx/Vmag;

    if(knockMod<1){
      x +=(Vx)*Speed*-knockMod*800/(dist);   
      y +=(Vy)*Speed*-knockMod*800/(dist); 
    }
    else{
      x +=(Vx)*Speed;   
      y +=(Vy)*Speed;      
    }
  }
  
  void collideTest(Player p1){
    if(dist < (r + p1.r)){
      //Collision detected
      //p1.xmom -= delx * 1/dist * bounce ;
      //p1.ymom -= dely * 1/dist * bounce ;
      if(p1.rolling || p1.attacking){
         shouldRemove = true;
         p1.kill(1);
         return;
      }
      if(p1.vuln){
        p1.damaged(1);
      }
    }
  }
  public int compareTo(Enemy other){
    return Bearing.compareTo(other.Bearing); 
  }
  
    void updateRock(weaponsystem w1){
     Rx = x-w1.wx;
     Ry = y-w1.wy;
     dis = sqrt(Rx*Rx + Ry*Ry);
  }
  
  void collTest(weaponsystem w1,int ra){
    //println(dis,r,ra);
    if(dis < (r + ra)){
     // println("hit!");
      w1.hit();
      //println(ra);
      shouldRemove = true;

      p1.kill(1);
      return;
    }
  }
  
}
