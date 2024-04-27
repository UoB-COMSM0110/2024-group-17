public class Replicator implements Collideable{
   private Coordinate position;
   ArrayList<Enemy> boids = new ArrayList<Enemy>();
   ArrayList<Collideable> allObjects;
   Player player;
   Spawner spawner;
   int radius=80;
   int health=100;
   int maxHealth;
   int mapSize;
   int difficulty;
   int imageIndex = 0; 
   long lastToggleTime = 0;
   int flashInterval = 500;
   boolean isDestroyed = false;
   ArrayList<Collideable> allStructures;
   PImage replcator;
   PImage replcator2;
   PImage replcator3;
   
   Replicator(int mapSizeInput, int difficultyInput,ArrayList<Collideable> allObjectsInput,Player playerInput,ArrayList<Collideable> allStructuresInput){
     allStructures = allStructuresInput;
     player = playerInput;
     allObjects = allObjectsInput;
     mapSize = mapSizeInput;
     difficulty = difficultyInput;
     if(difficulty == -1){health = 20;}
     maxHealth = health;
     position = new Coordinate(0,0);
     position.setRandomOnCircle(mapSize);
     while(!uniquePosition()){
        position.setRandomOnCircle(mapSize);
     }
     spawner = new Spawner(boids,position,difficulty,allObjectsInput,allStructures);
     replcator = loadImage("data/constructor.png");
     replcator2 = loadImage("data/constructor2.png");
     replcator3 = loadImage("data/constructor3.png");
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
      int currentTime = millis();
      if (!isPause && (currentTime - lastToggleTime > flashInterval)) {
        imageIndex = (imageIndex + 1) % 3; // Increment and wrap around the image index
        lastToggleTime = currentTime; // Update the last toggle time
      }
      fill(255,0,0);
      switch(imageIndex) {
        case 0:
          replcator.resize(200,200);
          image(replcator, position.xGet()-95,position.yGet()-60);
          break;
        case 1:
          replcator2.resize(200,200);
          image(replcator2, position.xGet()-95,position.yGet()-60);
          break;
        case 2:
          replcator3.resize(200,200);
          image(replcator3, position.xGet()-95,position.yGet()-60);
          break;
       }
      //replcator.resize(200,200);
      //image(replcator, position.xGet()-95,position.yGet()-60);
      if(health<maxHealth){
        noFill();
        rect(position.xGet()-50,position.yGet() + 70,100,10);
        fill(255,0,0);
        rect(position.xGet()-50,position.yGet() + 70,100 * health/maxHealth,10);
      }
   }
  
}
