public class RocketLauncher extends Weapon{

  ArrayList<Projectile> projectiles = new ArrayList<>();
  ArrayList<Projectile> explosions = new ArrayList<>();

  RocketLauncher(Player playerInput, ArrayList<Collideable> allObjectsInput){
    player = playerInput;
    allObjects = allObjectsInput;
    cooldown = 300;
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
           explosions.add(new Projectile(projectile.getPosition(),200,100,0,player,1, new Colour(255, 165, 0),false));
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
    projectiles.add(new Projectile(positionInput,10,150,10,player,20,new Colour(255, 165, 0),true));
    previousShotTick = tick;
  }
  
}
