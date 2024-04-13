public abstract class Weapon{
  boolean[] keyspressed;
  Player player;
  long cooldown;
  long previousShotTick=-100000;
  ArrayList<Collideable> allObjects;
  
  
  public void doThings(Coordinate positionInput,boolean[] keyspressed){

  }
  
}
