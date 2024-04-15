class Enemy implements Collideable{
  
  int state = 0;
  int difficulty;
  int health = 12;
  Spawner home;
  Coordinate position;
  ArrayList<Enemy> localGroup;
  ArrayList<Collideable> allStructures;
  
  int radius = 20;
  float Vx = 0;
  float Vy = 0;
  float Vmag;
  float speed;
  float control = 0.1;
  
  int bounce=10;
  int damage;
  long ptick;
  boolean shouldRemove = false;

  float delx;
  float dely;
  float dist;
      
  Enemy(float startingX, float startingY, int difficultyInput, ArrayList<Enemy> localGroupInput, Spawner homeInput, ArrayList<Collideable> allStructuresInput, int startingState){
    state = startingState;
    allStructures = allStructuresInput;
    home = homeInput;
    localGroup = localGroupInput;
    position = new Coordinate( startingX,startingY+1);
    ptick=0;
    difficulty = difficultyInput;
    setStats();
  }
  
  public void dealDamage(int damage){
     health -= damage;
     hitmarkerSound.trigger();
     if(health<=0){shouldRemove = true;}
  }
  
  public int getRadius(){return radius;}
  
  public float xGet(){return position.xGet();}
  
  public float yGet(){return position.yGet();}  
  
  public Coordinate getPosition(){return position;}

  
  public void doThings(Player p1){
    switch (state){
      case 0 : 
        passive(p1);
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
    move();
    checkStructureCollision();
    render();
  }
  
  private void passive(Player p1){
    updateVector(p1.xGet(),p1.yGet());
    if(dist<400){alertGroup();}
    updateVector(home.xGet(),home.yGet());
    chase();
  }
  
  private void active(Player p1){
    updateVector(p1.xGet(),p1.yGet());
    chase();
    collideTest(p1);
    if(dist>2000){state = 0;}
  }
  
  private void setStats(){
    switch (difficulty){
       case -1 : 
        speed = 5;
        damage = 4;
        break;
      case 0 : 
        speed = 7;
        damage = 7;
        break;
      case 1:
        speed = 15;
        damage = 20;
        health = 20;
        break;
      default:
        speed=0;
        damage=0;     
     }
  }
      
  private void render(){
    image(enemyImage,position.xGet() - radius,position.yGet() - radius); 
  }
  
   private void updateVector(float xTarget, float yTarget){
     delx = position.xGet()-xTarget;
     dely = position.yGet()-yTarget;
     dist = sqrt(delx*delx + dely*dely);
   }
  

  private void collideTest(Player p1){
    if(dist < (radius + p1.getRadius())){
      if(p1.attacking){
         shouldRemove = true;
         p1.kill(1);
         return;
      } 
      if(p1.vuln){
        p1.damaged(damage);
        p1.xmom -= delx * 1/dist * bounce ;
        p1.ymom -= dely * 1/dist * bounce ;
      }
    }
  }
  
  private void chase(){
    
    float deltaVx=0.01;
    float deltaVy=0.01;
    
    for(Enemy otherEnemy : localGroup){
      if(!otherEnemy.equals(this)){
        float xOther = otherEnemy.xGet();
        float yOther = otherEnemy.yGet();
        float distance = sqrt((position.xGet() - xOther)*(position.xGet() -xOther) + (position.yGet() -yOther)*(position.yGet() - yOther));
        if(distance <500){
          deltaVx-=(otherEnemy.Vx-Vx)*0.0005;
          deltaVy-=(otherEnemy.Vy-Vy)*0.0005;        
        }
        if(distance<100 && distance!=0.0){
          deltaVx +=500000*(position.xGet()-xOther)/(distance*distance*distance); 
          deltaVy +=500000*(position.yGet()-yOther)/(distance*distance*distance); 
        }
        
        if(dist<500 && distance!=0.0){
          deltaVx -=5*(position.xGet()-xOther)/(distance); 
          deltaVy -=5*(position.yGet()-yOther)/(distance); 
        }
        
      }
    }
    
    deltaVx+=(-delx);
    deltaVy+=(-dely);
    float deltaVmag =sqrt(deltaVx*deltaVx+deltaVy*deltaVy); 

    deltaVx = control*deltaVx/deltaVmag;
    deltaVy = control*deltaVy/deltaVmag;

    Vx+=deltaVx;
    Vy+=deltaVy;
  }
  
  private void move(){
    Vmag = sqrt(Vx*Vx+Vy*Vy);
    Vx = Vx/Vmag;    
    Vy = Vy/Vmag;
  
    position.move((Vx)*speed,(Vy)*speed); 
  }

  private void checkStructureCollision(){
    for(Collideable structure : allStructures){
      float sqrDistanceBetween = sqrDistanceBetween(structure);
      if( sqrDistanceBetween < (structure.getRadius() + radius)*(structure.getRadius() + radius)){
        
         float xNormalVector = structure.xGet() - position.xGet();
         float yNormalVector = structure.yGet() - position.yGet();
         float magnitudeNormalVector = sqrt(xNormalVector*xNormalVector+yNormalVector*yNormalVector);
         xNormalVector = xNormalVector/magnitudeNormalVector;
         yNormalVector = yNormalVector/magnitudeNormalVector;         
         Vx -= 5 * xNormalVector;
         Vy -= 5 * yNormalVector;
      }
    }
  }
  
  public void alertGroup(){
    home.alertAllBoids(); 
  }
  
  private float sqrDistanceBetween(Collideable object){
    return (object.xGet() - position.xGet())*(object.xGet() - position.xGet()) + (object.yGet() - position.yGet())*(object.yGet() - position.yGet());
  }
}
