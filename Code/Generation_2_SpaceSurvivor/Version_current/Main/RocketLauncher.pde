public class RocketLauncher extends Weapon{

  ArrayList<Projectile> projectiles = new ArrayList<>();
  ArrayList<Projectile> explosions = new ArrayList<>();

  RocketLauncher(Player playerInput, ArrayList<Collideable> allObjectsInput){
    player = playerInput;
    allObjects = allObjectsInput;
    cooldown = 300;
  }
  
  public void justDrawThings(){
    for(Projectile projectile : projectiles){
       projectile.render();
    }
    for(Projectile explosion : explosions){
      explosion.render(); 
    }
  }
  
  @Override
  public void doThings(Coordinate positionInput,boolean[] keyspressed){
    manageExplosions();
    manageRockets();
    if(keyspressed[7]){rocketFire(positionInput);}  
  }
  
  private void manageRockets(){
   for(int i = projectiles.size()-1;i>=0;i--){
       Projectile projectile = projectiles.get(i);
       projectile.doThings(allObjects);
       if(projectile.shouldRemove()){
           explosions.add(new Projectile(projectile.getPosition(),player,100,50,0,1, new Colour(255, 165, 0),false,0));
           explosionSound.play();
           projectiles.remove(projectile);
       }
    }
  }
  
  private void manageExplosions(){
   for(int i = explosions.size()-1;i>=0;i--){
       Projectile explosion = explosions.get(i);
       explosion.doThings(allObjects);
       if(explosion.shouldRemove()){
           explosions.remove(explosion);
       } 
    }
  }
  
  public void rocketFire(Coordinate positionInput){
    if(tick - previousShotTick < cooldown){return;}
    launcherFire.play();
    projectiles.add(new Projectile(positionInput,player,7,150,18,20,new Colour(255, 165, 0),true,0));
    previousShotTick = tick;
  }
  
}
