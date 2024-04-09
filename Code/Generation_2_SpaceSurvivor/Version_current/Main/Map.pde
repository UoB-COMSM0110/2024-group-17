public class Map{
  int radius;
  int difficulty;
  long timeLeft;
  long previousTick;
  ArrayList<Replicator> replicators;
  ArrayList<Asteroid> asteroids;
 // Gateway gateway;
  boolean isTimePassing = false;;
  ArrayList<Collideable> allObjects = new ArrayList<Collideable> ();
  //Player player = new Player(0,0,allObjects);
  SoundFile gameMusic;
  
  
  Map(int difficultyInput, Main main){
    gameMusic = new SoundFile(main,"GameMusic.wav"); 
    gameMusic.play();
    difficulty = difficultyInput;
    generateRandomAsteroids(); 
    generateRandomReplicators(); 
   // gateway = new Gateway();
    timeLeft = 30000;
    previousTick = tick;
    isTimePassing = true;
  }
  
  public void doThings(){
    setTime();
    for(Asteroid asteroid : asteroids){
      asteroid.doThings();
    }
    for(Replicator replicator : replicators){
      replicator.doThings();
    }
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
      Asteroid asteroid = new Asteroid(radius);
      asteroids.add(asteroid); 
      allObjects.add(asteroid);
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
      Replicator replicator = new Replicator(radius, difficulty, allObjects);
      replicators.add(replicator); 
      allObjects.add(replicator);
    }
  }
    
  
}
