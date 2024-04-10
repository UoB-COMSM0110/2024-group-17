public class Map{
  int radius = 5000;
  int difficulty;
  long timeLeft;
  long previousTick;
  ArrayList<Replicator> replicators;
  ArrayList<Asteroid> asteroids;
  ArrayList<Collideable> allStructures = new ArrayList<Collideable>();
 // Gateway gateway;
  boolean isTimePassing = false;;
  ArrayList<Collideable> allObjects = new ArrayList<Collideable> ();
  Minimap minimap;
  Player player;
  SoundFile gameMusic;
  
  
  Map(int difficultyInput, Main main, Camera cam){
    gameMusic = new SoundFile(main,"GameMusic.wav"); 
    player = new Player(0,0,allObjects,cam,allStructures);
    gameMusic.play();
    difficulty = difficultyInput;
    generateRandomAsteroids(); 
    generateRandomReplicators(); 
    minimap = new Minimap(replicators,player,radius);
   // gateway = new Gateway();
    timeLeft = 30000;
    previousTick = tick;
    isTimePassing = true;
  }
  
  public void justDrawThings(){
    for(Asteroid asteroid : asteroids){
      asteroid.render();
    }
    for(Replicator replicator : replicators){
      replicator.render();
    }
    player.render();
  }
  
  public void doThings(boolean[] keyspressed){
    setTime();
    for(int i = asteroids.size()-1;i>=0;i--){
      Asteroid asteroid = asteroids.get(i);
      asteroid.doThings();
      if(asteroid.shouldDestroy){
        asteroids.remove(asteroid);
        allObjects.remove(asteroid);
        allStructures.remove(asteroid);
      }
    }
    boolean allDestroyed = true;
    for(int i = replicators.size()-1;i>=0;i--){
      Replicator replicator = replicators.get(i);
      replicator.doThings();
      if(replicator.isDestroyed){
        allDestroyed = false;
        allObjects.remove(replicator);
        allStructures.remove(replicator);
      }
    }
    if(allDestroyed){
      menu.switchScreen(Page.WIN);
    }
    player.doThings(keyspressed);
    minimap.drawMap();
  }
  
  public void stopMusic(){
    gameMusic.stop();
  }
  
  public void setTime(){
     timeLeft = (tick - previousTick);
  }
  
  public long getTime(){
    return  timeLeft;
  }
  
  private void generateRandomAsteroids(){
    asteroids = new ArrayList<Asteroid>();
    for( int i=0;i<25;i++){
      Asteroid asteroid = new Asteroid(radius,allStructures);
      asteroids.add(asteroid); 
      allObjects.add(asteroid);
      allStructures.add(asteroid);
    }
  }
  
  private void generateRandomReplicators(){
    int number;
    switch (difficulty){
      case 1 : number = 3;
        break;
      case 2 : number = 5;
        break;
      default : number = 3;
    }
    replicators = new ArrayList<Replicator> ();
    for(int i=0;i<number;i++){
      Replicator replicator = new Replicator(radius, difficulty, allObjects,player,allStructures);
      replicators.add(replicator); 
      allObjects.add(replicator);
      allStructures.add(replicator);
    }
  }
    
  
}
