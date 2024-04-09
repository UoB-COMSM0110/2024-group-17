public class Weapons{
   RocketLauncher launcher = new RocketLauncher();
   boolean launcherActive=true;
  
  
  Weapons(){
    
  }
  
  public void doThings(boolean[] keyspressed, Coordinate position){
    if(launcherActive){
      launcher.doThings(position,keyspressed);
    }
  }
  
  
  
  
  
  
}
