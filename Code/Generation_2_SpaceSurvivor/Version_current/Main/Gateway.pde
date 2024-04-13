public class Gateway{
  Coordinate position = new Coordinate(0,0);
  Map map;
  private boolean portalActive = true;
  private boolean firstTime = true;
  public boolean shouldExtract = false;
  float playerDistance = 100000;
   
  Gateway(Map mapInput){
    portalTravelSound.play();
    map = mapInput;
    
  }
  
  public void doThings(boolean[] keyspressed){
    renderBottomLayer(); 
    updateExtract(keyspressed);
    if(portalIdleSound.isPlaying()){
      float amp;
      if(playerDistance<=500){
        amp = 1;
      }else{
        amp = 500/(playerDistance);
      }
      portalIdleSound.amp(amp);
    }
  }
  
  public void setPortalStatus(boolean bool){
    portalActive = bool;
    firstTime = firstTime && bool;
    if(bool == true){if(!portalIdleSound.isPlaying()){portalIdleSound.play();}}
  }
  
  public boolean getPortalStatus(){return portalActive;}
  
  public void renderBottomLayer(){
    fill(40);
    rect(100,100,50,50);
    rect(100,-100,50,50);
    rect(-100,100,50,50);
    rect(-100,-100,50,50);
  }
  
  private void updateExtract(boolean[] keyspressed){
    playerDistance = sqrt(sqrDistanceBetween(map.player.getPosition()));
    if(keyspressed[8] && portalActive && !firstTime && playerDistance <= 300 ){
       portalTravelSound.play();
       shouldExtract = true;     
    }
  }
  
  public boolean getOutActive(){return portalActive && !firstTime;}
  
  private float sqrDistanceBetween(Coordinate otherPosition){
    return (otherPosition.xGet() - position.xGet())*(otherPosition.xGet() - position.xGet()) + (otherPosition.yGet() - position.yGet())*(otherPosition.yGet() - position.yGet());
  }  
  
  public void renderPortal(){
    fill(255,0,255);
    circle(0,0,300);
    textSize(50);
    fill(255);
    if(portalActive && !firstTime){text("Press SPACE to extract.",0,-350);}
  }
  
  
  
}
