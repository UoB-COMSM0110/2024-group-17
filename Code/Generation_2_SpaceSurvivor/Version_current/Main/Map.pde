public class Map{
  int radius = 5000;
  int difficulty;
  long timeLeft;
  long previousTick;
  ArrayList<Replicator> replicators;
  ArrayList<Asteroid> asteroids;
  ArrayList<Collideable> allStructures = new ArrayList<Collideable>();
  Gateway gateway;
  boolean isTimePassing = false;;
  ArrayList<Collideable> allObjects = new ArrayList<Collideable> ();
  Minimap minimap;
  Tutorial tutorial;
  Player player;
  AudioPlayer gameMusic;
  UI userInterface;
  public int numberReplicatorsDestroyed = 0;
  
  
  Map(int difficultyInput, Camera cam){
    gameMusic = minim.loadFile("GameMusic.wav"); 
    player = new Player(0,0,allObjects,allStructures);
    gameMusic.loop();
    difficulty = difficultyInput;
    generateRandomAsteroids(); 
    generateRandomReplicators(); 
    minimap = new Minimap(replicators,player,radius,this);
    userInterface = new UI(this,cam,difficulty);
    gateway = new Gateway(this);
    tutorial = new Tutorial(difficulty,cam,this);
    timeLeft = 20000;
    previousTick = 0;
    isTimePassing = true;
    flyingSoundEffect.loop();
  }
  
  public void justDrawThings(){
    for(Asteroid asteroid : asteroids){
      asteroid.render();
    }
    for(Replicator replicator : replicators){
      replicator.justDraw();
    }
    gateway.renderBottomLayer();
    player.render();
    if(gateway.getPortalStatus()){gateway.renderPortal();}
    minimap.drawMap(keyspressed[4]);
    userInterface.doThings();
    tutorial.doThings(keyspressed);
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
    numberReplicatorsDestroyed=0;
    for(int i = replicators.size()-1;i>=0;i--){
      Replicator replicator = replicators.get(i);
      replicator.doThings();
      if(replicator.isDestroyed){
        allObjects.remove(replicator);
        allStructures.remove(replicator);
        numberReplicatorsDestroyed++;
      }else{allDestroyed = false;}
    }
    if(allDestroyed){
      gateway.setPortalStatus(true);
    }
    gateway.doThings(keyspressed);
    player.doThings(keyspressed);
    updateMusic();
    if(player.isDead() || (timeLeft < 0 && difficulty!=-1)){gameMusic.pause();menu.die();}
    if(gateway.getPortalStatus()){gateway.renderPortal();}
    minimap.drawMap(keyspressed[4]);
    userInterface.doThings();
    tutorial.doThings(keyspressed);
    previousTick = tick;
  }
  
  private void updateMusic(){
     rateControl.value.setLastValue((player.getSpeed()+40)/30);
  }
  
  public void stopMusic(){
    gameMusic.pause();
  }
  
  public void setTime(){
     timeLeft -= (tick - previousTick);
     if(timeLeft <= 19900 && timeLeft >= 19700){gateway.setPortalStatus(false);}
  }
  
  public long timeRemaining(){
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
