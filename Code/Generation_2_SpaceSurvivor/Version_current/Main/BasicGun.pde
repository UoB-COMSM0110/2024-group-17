public class BasicGun extends Weapon{
  
    ArrayList<Projectile> bullets = new ArrayList<>();
  
  BasicGun (Player playerInput,ArrayList<Collideable> allObjectsInput){
    cooldown  = 10; 
    player = playerInput;
    allObjects = allObjectsInput;

  }
  
  public void justDrawThings(){
    for(Projectile bullet : bullets){
      bullet.render(); 
    }
  }
  
  @Override
  public void doThings(Coordinate positionInput,boolean[] keyspressed){
    manageBullets();
    if(keyspressed[6]){shotgunFire(positionInput);}  
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
    bullets.add(new Projectile(positionInput,player,10,350,20,6,new Colour(50,0,255),true,0));
    previousShotTick = tick;
  }
  
  private void shotgunFire(Coordinate positionInput){

    cooldown = 100;
    if(tick - previousShotTick < cooldown){return;}
    shotgunSound.play();
    playerImpulse(-40.0);
    for(int i = 0 ; i< 10; i++){
      bullets.add(new Projectile(positionInput,player,5,60,25,4,new Colour(50,0,255),true,30));
    }
    previousShotTick = tick;
    

  }
  
  private void playerImpulse(float magnitude){
      float mpx = (mouseX-(width/2));
      float mpy = (mouseY-(height/2));
      float mpMag = sqrt(mpx*mpx + mpy*mpy);
      player.xmom = magnitude * (mpx)/mpMag;
      player.ymom = magnitude * (mpy)/mpMag;
    // player.impulse(xmom,ymom);
    
    
  }
  
  
}
