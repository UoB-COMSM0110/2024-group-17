public class Spawner{
   ArrayList<Enemy> boids;
   ArrayList<Collideable> allObjects;
   int populationCap;
   boolean isStartup;
   long previousSpawnTick;
   long stableSpawnCD;
   Coordinate position;
   int difficulty;
   int numberOfBoidsSpawned=0;
   long startTick;
   
   Spawner(ArrayList<Enemy> boidsInput,Coordinate positionInput,int difficultyInput,ArrayList<Collideable> allObjectsInput){
     allObjects = allObjectsInput;
     startTick = tick;
     difficulty = difficultyInput;
     isStartup = false;
     boids = boidsInput;
     position = positionInput;
     
   }
   
   public void doThings(){
     if(!isStartup){
       if(tick-previousSpawnTick>stableSpawnCD && boids.size()<populationCap){spawn();}
     }else{
       startUp();
       if(tick-startTick>=12000){
         isStartup = false; 
       }
     }  
   }
   
   private void startUp(){
      int goal = populationGoal();
      int difference = goal - numberOfBoidsSpawned;
      for(int i=0;i<difference;i++){
        spawn();
      }
   }
   
   private int populationGoal(){
      return floor(200.0/(1.0 + exp((-0.009* (float)(tick-startTick-6000))))); 
   }
  
   private void spawn(){
     Enemy enemy = new  Enemy(position.xGet(),position.yGet(),difficulty,boids);
     boids.add(enemy);
     allObjects.add(enemy);
     previousSpawnTick = tick; 
   }
  
  
}
