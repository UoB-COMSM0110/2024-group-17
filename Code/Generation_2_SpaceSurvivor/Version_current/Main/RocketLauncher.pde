public class RocketLauncher{
  long cooldown=300;
  long previousShotTick;
  ArrayList<Projectile> projectiles = new ArrayList<>();
  ArrayList<Projectile> explosions = new ArrayList<>();
  boolean[] keyspressed;
  
  RocketLauncher(){
  }
  
  public void doThings(Coordinate positionInput,boolean[] keyspressed){
    manageExplosions();
    manageRockets();
    if(keyspressed[7]){rocketFire(positionInput);}  
  }
  
  private void manageRockets(){
   for(int i = projectiles.size()-1;i>=0;i--){
       Projectile projectile = projectiles.get(i);
       projectile.doThings();
       if(projectile.shouldRemove()){
           explosions.add(new Projectile(projectile.getPosition(),500,500,0));
           projectiles.remove(projectile);
       }
    }
  }
  
  private void manageExplosions(){
   for(int i = explosions.size()-1;i>=0;i--){
       Projectile explosion = explosions.get(i);
       explosion.doThings();
       if(explosion.shouldRemove()){
           projectiles.remove(explosion);
       } 
    }
  }
  
  public void rocketFire(Coordinate positionInput){
    if(tick - previousShotTick < cooldown){return;}
    projectiles.add(new Projectile(positionInput,25,1000,10));
  }
  
}
