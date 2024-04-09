public class BasicGun extends Weapon{
  
    ArrayList<Projectile> bullets = new ArrayList<>();
  
  BasicGun (Player playerInput,ArrayList<Collideable> allObjectsInput){
    cooldown  = 10; 
    player = playerInput;
    allObjects = allObjectsInput;

  }
  
  @Override
  public void doThings(Coordinate positionInput,boolean[] keyspressed){
    manageBullets();
    if(keyspressed[6]){bulletFire(positionInput);}  
  }
  
  private void manageBullets(){
     for(int i = bullets.size()-1;i>=0;i--){
       Projectile bullet = bullets.get(i);
       bullet.doThings(allObjects);
       if(bullet.shouldRemove()){
           bullets.remove(bullet);
       } 
    }
  }
  
  private void bulletFire(Coordinate positionInput){
    if(tick - previousShotTick < cooldown){return;}
    bullets.add(new Projectile(positionInput,10,150,20,player,5,new Colour(50,0,255),true));
    previousShotTick = tick;
  }
  
  
}
