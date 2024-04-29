public class Spawner{
   ArrayList<Enemy> boids;
   ArrayList<Collideable> allObjects;
   int populationCap;
   boolean isStartup;
   long previousSpawnTick;
   long stableSpawnCD = 10000;
   Coordinate position;
   int difficulty;
   int startingState = 0;
   int numberOfBoidsSpawned=0;
   long startTick;
   ArrayList<Collideable> allStructures;
   
   Spawner(ArrayList<Enemy> boidsInput,Coordinate positionInput,int difficultyInput,ArrayList<Collideable> allObjectsInput,ArrayList<Collideable> allStructuresInput){
     allStructures = allStructuresInput;
     allObjects = allObjectsInput;
     startTick = 0;
     difficulty = difficultyInput;
     isStartup = true;
     boids = boidsInput;
     position = positionInput;
     
   }
   
   public void doThings(){
     startUp();
     if(boids.isEmpty()){pacifyAllBoids();}
   }
   
   public float xGet(){
     return position.xGet();
   }
   public float yGet(){
     return position.yGet();
   }
   
   private void startUp(){
      int goal = populationGoal();
      println(goal, tick , startTick);
      int difference = goal - numberOfBoidsSpawned;
      for(int i=0;i<difference;i++){
        numberOfBoidsSpawned++;
        spawn();
      }
   }
   
   private int populationGoal(){
     switch(difficulty){
        case 0:
          return floor( 7500.0/(1.0 + exp((-0.0004* (float)(tick-startTick-18000)))));      
        case 1:
           return floor( 7500.0/(1.0 + exp((-0.0004* (float)(tick-startTick-16000)))));      
        case 2:
           return floor( 7500.0/(1.0 + exp((-0.0004* (float)(tick-startTick-14000)))));      
      default:
         return floor( 7500.0/(1.0 + exp((-0.0004* (float)(tick-startTick-18000)))));      
       
     }
      
   }
  
   private void spawn(){
     Enemy enemy = new  Enemy(position.xGet(),position.yGet(),difficulty,boids,this,allStructures,startingState);
     boids.add(enemy);
     allObjects.add(enemy);
     previousSpawnTick = tick; 
   }
   
   public void alertAllBoids(){
     startingState = 1;
      for(Enemy boid : boids){
         boid.state = 1;
      } 
   }
   
   
   public void pacifyAllBoids(){
     startingState = 0;
   }
  
  
}
