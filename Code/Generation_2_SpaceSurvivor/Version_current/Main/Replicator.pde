public class Replicator implements Collideable{
   private Coordinate position;
   ArrayList<Enemy> boids = new ArrayList<Enemy>();
   ArrayList<Collideable> allObjects;
   Player player;
   Spawner spawner;
   int radius=50;
   int health=100;
   int mapSize;
   int difficulty;
   boolean isDestroyed = false;
   ArrayList<Collideable> allStructures;
   
   Replicator(int mapSizeInput, int difficultyInput,ArrayList<Collideable> allObjectsInput,Player playerInput,ArrayList<Collideable> allStructuresInput){
     allStructures = allStructuresInput;
     player = playerInput;
     allObjects = allObjectsInput;
     mapSize = mapSizeInput;
     difficulty = difficultyInput;
     if(difficulty == -1){health = 20;}
     position = new Coordinate(0,0);
     position.setRandomOnCircle(mapSize);
     while(!uniquePosition()){
        position.setRandomOnCircle(mapSize);
     }
     spawner = new Spawner(boids,position,difficulty,allObjectsInput,allStructures);
   }
   
  public boolean uniquePosition(){
    for(Collideable structure : allStructures){
      float sqrDistanceBetween = sqrDistanceBetween(structure.getPosition());
      if( sqrDistanceBetween < (structure.getRadius() + radius)*(structure.getRadius() + radius)){    
        return false;
      }
    }
    if(sqrDistanceBetween(new Coordinate(0,0))< 8500000){return false;}
    return true;
  }
  
  private float sqrDistanceBetween(Coordinate otherPosition){
    return (otherPosition.xGet() - position.xGet())*(otherPosition.xGet() - position.xGet()) + (otherPosition.yGet() - position.yGet())*(otherPosition.yGet() - position.yGet());
  }  
   
   public void dealDamage(int damage){
      health -= damage;
      hitmarkerSound.trigger();
      if(health<=0){
        player.getPoints(50);
        replicatorDestroyed.trigger();
        isDestroyed = true;
      }
   }
     
  public void alertGroup(){}
   
  public float xGet(){return position.xGet();}
  
  public float yGet(){return position.yGet();}
   
  public int getRadius(){return radius;}
     
  public Coordinate getPosition(){return position;}

   
   public void doThings(){
     for(int i=boids.size()-1;i>=0;i--){
       Enemy boid = boids.get(i);
       boid.doThings(player);
       if(boid.shouldRemove){
          boids.remove(boid);
          allObjects.remove(boid);
          player.getPoints(1);
       }     
     }
     if(!isDestroyed){
       spawner.doThings();
       render();
     }
   }
   
   public void justDraw(){
     render(); 
     for(Enemy boid : boids){
       boid.render();   
     }
   }
   
   public void render(){
      fill(255,0,0);
      circle(position.xGet(),position.yGet(),radius);
   }
  
}
