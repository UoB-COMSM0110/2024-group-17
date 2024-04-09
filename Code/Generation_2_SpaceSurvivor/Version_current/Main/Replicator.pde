public class Replicator implements Collideable{
   private Coordinate position;
   ArrayList<Enemy> boids = new ArrayList<Enemy>();
   Spawner spawner;
   int radius=100;
   int health;
   int mapSize;
   int difficulty;
   
   Replicator(int mapSizeInput, int difficultyInput,ArrayList<Collideable> allObjectsInput){
     mapSize = mapSizeInput;
     difficulty = difficultyInput;
     position = new Coordinate(0,0);
     position.setRandomOnCircle(mapSize);
     spawner = new Spawner(boids,position,difficulty,allObjectsInput);
   }
   
  public float xGet(){return position.xGet();}
  
  public float yGet(){return position.yGet();}
   
   public int getRadius(){return radius;}
   
   public void doThings(){
     spawner.doThings();
     render();
   }
   
   private void render(){
      fill(255,0,0);
      circle(position.xGet(),position.yGet(),radius);
   }
  
}
