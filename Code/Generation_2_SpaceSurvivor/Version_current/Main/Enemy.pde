class Enemy implements Collideable{
  
  int state = 0;
  int difficulty;
  Spawner home;
  Coordinate position;
  ArrayList<Enemy> localGroup;
  
  int r = 50;
  float Vx;
  float Vy;
  float Vmag;
  float speed;
  
  int bounce=0;
  int damage;
  long ptick;
  boolean shouldRemove = false;

  float delx;
  float dely;
  float dist;
      
  Enemy(float startingX, float startingY,int difficultyInput, ArrayList<Enemy> localGroupInput){
   localGroup = localGroupInput;
   position = new Coordinate( startingX,startingY);
   ptick=0;
   difficulty = difficultyInput;
   setStats();
  }
  
  public int getRadius(){return r;}
  
  public float xGet(){return position.xGet();}
  
  public float yGet(){return position.yGet();}
  
  public void doThings(Player p1){
    switch (state){
      case 0 : 
        passive();
        break;
      case 1 : 
        active(p1);
        break;
      case 2 : 
       // searching();
        break;
      case 3 : 
       // alerting();
        break;
    }
    render();
  }
  
  private void passive(){
    updateVector(position.xGet(),position.yGet());
    chase();
  }
  
  private void active(Player p1){
    updateVector(p1.xGet(),p1.yGet());
    chase();
    //collideTest(p1);
  }
  
  private void setStats(){
    switch (difficulty){
      case 0 : 
        speed = 7;
        damage = 5;
        break;
      case 1:
        speed = 15;
        damage = 10;
        break;
      default:
        speed=0;
        damage=0;     
     }
  }
      
  private void render(){
    image(enemyImage,position.xGet() - 50,position.yGet() - 50); 
  }
  
   private void updateVector(float xTarget, float yTarget){
     delx = position.xGet()-xTarget;
     dely = position.yGet()-yTarget;
     dist = sqrt(delx*delx + dely*dely);
   }
  
  /*
  private void collideTest(Player p1){
    if(dist < (r + p1.r)){
      //Collision detected
      //p1.xmom -= delx * 1/dist * bounce ;
      //p1.ymom -= dely * 1/dist * bounce ;
      if(p1.attacking){
         shouldRemove = true;
         p1.kill(1);
         return;
      }
      if(p1.vuln){
        p1.damaged(1+(3*selectedDifficulty));
      }
    }
  }
  /
  */
  
  private void chase(){
    float deltaVx=0;
    float deltaVy=0;
    for(Enemy otherEnemy : localGroup){
      if(!otherEnemy.equals(this)){
        float xOther = otherEnemy.xGet();
        float yOther = otherEnemy.yGet();
        float dist = sqrt((position.xGet() - xOther)*(position.xGet() -xOther) + (position.yGet() -yOther)*(position.xGet() - yOther));
        if(dist <500){
          deltaVx-=(otherEnemy.Vx-Vx)*0.0005;
          deltaVy-=(otherEnemy.Vy-Vy)*0.0005;        
        }
        if(dist<100){
          deltaVx +=500000*(position.xGet()-xOther)/(dist*dist*dist); 
          deltaVy +=500000*(position.yGet()-yOther)/(dist*dist*dist); 
        }
        /*
        if(abs(otherEnemy.Bearing-Bearing) < 0.3){
          deltaVx -=5*(x-otherEnemy.x)/(dist); 
          deltaVy -=5*(y-otherEnemy.y)/(dist); 
        }
        */
      }
    }
    
    deltaVx+=(-delx)*1;
    deltaVy+=(-dely)*1;
    
    float deltaVmag =sqrt(deltaVx*deltaVx+deltaVy*deltaVy); 

    deltaVx = deltaVx/deltaVmag;
    deltaVy = deltaVy/deltaVmag;

    Vx+=deltaVx;
    Vy+=deltaVy;
    
    Vmag = sqrt(Vx*Vx+Vy*Vy);
    
    Vy = Vy/Vmag;
    Vx = Vx/Vmag;
    /*
    if(knockMod<1){
      x +=(Vx)*Speed*-knockMod*800/(dist);   
      y +=(Vy)*Speed*-knockMod*800/(dist); 
    }
    */
    position.setPosition((Vx)*speed,(Vy)*speed);  
  }

  
  
  /*
  
  void updateRock(weaponsystem w1){
     Rx = x-w1.wx;
     Ry = y-w1.wy;
     dis = sqrt(Rx*Rx + Ry*Ry);
  }
  
  void collTest(weaponsystem w1,int ra){
    if(dis < (r + ra)){
      w1.hit();
      shouldRemove = true;
      p1.kill(1);
      return;
    }
  }
  */
}
