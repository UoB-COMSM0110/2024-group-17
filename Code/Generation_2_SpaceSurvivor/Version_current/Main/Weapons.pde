public class Weapons{
   RocketLauncher launcher;
   boolean launcherActive = true;
   BasicGun gun;
   boolean gunActive = true;
   Player player;
  
  Weapons(Player playerInput, ArrayList<Collideable> allObjects){
    launcher = new RocketLauncher(playerInput,allObjects);
     gun = new BasicGun(playerInput, allObjects);
  }
  
  public void doThings(boolean[] keyspressed, Coordinate position ){
    if(launcherActive){
      launcher.doThings(position,keyspressed);
    }
    if(gunActive){
      gun.doThings(position,keyspressed); 
    }
  }
  
  
  
  
  
  
}
