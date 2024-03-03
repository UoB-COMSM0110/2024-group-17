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
  
  void chase(int EnemyIndex,int size){
    float deltaVx=0;
    float deltaVy=0;
    for(int i=0;i<EnemyList.size();i++){
      if(i!=EnemyIndex){
        Enemy otherEnemy = EnemyList.get(i);
        float dist = sqrt((x - otherEnemy.x)*(x - otherEnemy.x) + (y - otherEnemy.y)*(y - otherEnemy.y));
        if(dist <500){
          deltaVx-=(otherEnemy.Vx-Vx)*0.001;
          deltaVy-=(otherEnemy.Vy-Vy)*0.001;        
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
    
    deltaVx+=(-delx)*1;
    deltaVy+=(-dely)*1;
    
    float deltaVmag =sqrt(deltaVx*deltaVx+deltaVy*deltaVy); 

    deltaVx = 0.25*deltaVx/deltaVmag;
    deltaVy = 0.25*deltaVy/deltaVmag;

    Vx+=deltaVx;
    Vy+=deltaVy;
    
    Vmag = sqrt(Vx*Vx+Vy*Vy);
    
    Vy = Vy/Vmag;
    Vx = Vx/Vmag;
    x +=(Vx)*Speed;   
    y +=(Vy)*Speed;    
     
    
    
    
    /*
    int startI = i;
    float theta=0;
    Enemy otherEnemy;
    if(size==1){
      return;
    }
    do{
      if(i==size-1){
        i=-1;
      }
      i++;
      if(i==startI){
        break;
      }
      otherEnemy = EnemyList.get(i);
      float magVres = sqrt((otherEnemy.x-x)*(otherEnemy.x-x) + (otherEnemy.y-y)*(otherEnemy.y-y));
      float delTheta = Bearing - otherEnemy.Bearing;
      if(magVres<200 && delTheta < PI/4){
        theta -= 1000*(delTheta)/(magVres);     
      }
    }while(otherEnemy.Bearing - Bearing < PI/2);
    i = startI;
    do{
      if(i==0){
        i = size;
      }
      i--;
      if(i==startI){
        break;
      }
      otherEnemy = EnemyList.get(i);
      float magVres = sqrt((otherEnemy.x-x)*(otherEnemy.x-x) + (otherEnemy.y-y)*(otherEnemy.y-y));
      float delTheta = Bearing - otherEnemy.Bearing;
      if(magVres<2000 && delTheta < PI/4){
        theta -= 1000*(delTheta)/(magVres);     
      }
    }while(otherEnemy.Bearing - Bearing > PI/2);
    println(theta);
    float delx2 = delx*cos(theta) - dely*sin(theta);
    dely = delx*sin(theta) + dely*cos(theta);
    delx = delx2;
    x -= (delx/dist) * speed;
    y -= (dely/dist) * speed;
    */
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
  
  void collTest(weaponsystem w1){
    
       int ra = w1.getR();
    //println(dis,r,ra);
    if(dis < (r + ra)){
     // println("hit!");
      w1.hit();
      //println(ra);
      shouldRemove = true;
      oscP5.send(kill, myBroadcastLocationKill);
      p1.kill(1);
      return;
    }
  }
  
}
