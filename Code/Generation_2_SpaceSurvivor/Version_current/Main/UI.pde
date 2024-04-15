class UI {
  float health;
  int score;
  long aTick;
  long rollstart;
  Map map;
  Camera cam;
  PImage healthBarSegment;
  boolean missionInfoActive = false;
  int difficulty;
   
  UI(Map mapInput, Camera camInput, int difficultyInput){
    difficulty = difficultyInput;
    if(difficulty!=-1){missionInfoActive = true;}
    cam = camInput;
    map = mapInput;
    healthBarSegment = loadImage("data/health_bar_segment.png");
    healthBarSegment.resize(81,200);
  }
  
  public void doThings(){
    update(); 
    healthbar();
    score();
    weaponCooldowns(map.player.weaponSystem);
    drawMissionInfo();
    if(difficulty!=-1){timer();}
  }
  
  void update(){
    health = map.player.health;
    score =  map.player.points;
    aTick = map.player.aTick;
  }
  
  void healthbar(){
    fill(48,25,52);
    rect(cam.x - 1200 , cam.y + 470, 42*2, 100*4);
    for(int i=0;i<2*health;i++){
       image(healthBarSegment, cam.x - 1200, cam.y + 470  + i );
    }
  } 
  
  void score(){
    textSize(100);
    fill(255);
    text(score,cam.x,cam.y+470*2);
  }
  
  void timer(){
    textSize(100);
    fill(255);
    text(((float)map.timeRemaining())/100.0,cam.x,cam.y-470*2);
        
  }
  
  private void weaponCooldowns(Weapons weaponSystem){
    if(weaponSystem.launcherActive){
      drawCDIcon(2, (float)(tick - weaponSystem.launcher.previousShotTick) / weaponSystem.launcher.cooldown );
    }
    if(weaponSystem.gunActive){
      drawCDIcon(0, (float)(tick - weaponSystem.gun.previousShotTick) / weaponSystem.gun.cooldown );
    }
    drawCDIcon(1, ((float)(tick - aTick))/(float)map.player.bAcd ) ; 
  }
  
  public void drawCDIcon(int slot, float cooldownFraction){
     if(cooldownFraction >1){ cooldownFraction = 1;}
     fill(255 * cooldownFraction);
     rect(cam.x + 1100 - 100 * slot,cam.y+850,75,75);
  }
  
  public void setMissionInfoActive(){missionInfoActive = true;}
  
  private void drawMissionInfo(){
    textAlign(RIGHT);
    if(map.gateway.getOutActive()){
      textSize(35);
      fill(255);
      text("Return to The Gateway for extraction.",cam.x+1200,cam.y - 850); 
      drawExtractionPointer();
    }else{
      textSize(35);
      fill(255);
      text("Destroy Boid Replicators: " + map.numberReplicatorsDestroyed +"/" + map.replicators.size(),cam.x+1200,cam.y - 850);      
    }
   textAlign(CENTER);
  }
  
  private void drawExtractionPointer(){
    float xPoint = map.player.xGet() - map.player.xGet()/2;
    float yPoint = map.player.yGet() - map.player.yGet()/2;
    if(abs(map.player.xGet()) < 700 && abs(map.player.yGet()) < 700){return;}
    float pointMagnitude = sqrt(xPoint*xPoint + yPoint*yPoint);
    float xPoint1 = 600*  xPoint/pointMagnitude;
    float yPoint1 = 600*  yPoint/pointMagnitude;
    float xPoint2 = 580*  xPoint/pointMagnitude;
    float yPoint2 = 580*  yPoint/pointMagnitude;
    xPoint2 = (xPoint2*cos(PI/20)-yPoint2*sin(PI/20));
    yPoint2 = (xPoint2*sin(PI/20) + yPoint2*cos(PI/20));
    float xPoint3 = 580*  xPoint/pointMagnitude;
    float yPoint3 = 580*  yPoint/pointMagnitude;
    xPoint3 = (xPoint3*cos(-PI/20)-yPoint3*sin(-PI/20));
    yPoint3 = (xPoint3*sin(-PI/20) + yPoint3*cos(-PI/20));
    triangle(map.player.xGet() - xPoint1,map.player.yGet() - yPoint1,map.player.xGet() - xPoint2,map.player.yGet() - yPoint2,map.player.xGet() - xPoint3,map.player.yGet() - yPoint3 );
  }
}
