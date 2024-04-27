class UI {
  float health;
  int score;
  long aTick;
  long rollstart;
  Map map;
  Camera cam;
  PImage healthBarSegment;
  PImage healthBloodimg;
  PImage clockimg;
  PImage skillZeroimg;
  PImage skillOneimg;
  PImage skillTwoimg;
  boolean missionInfoActive = false;
  int difficulty;
   
  UI(Map mapInput, Camera camInput, int difficultyInput){
    difficulty = difficultyInput;
    if(difficulty!=-1){missionInfoActive = true;}
    cam = camInput;
    map = mapInput;
    healthBarSegment = loadImage("data/health_bar_segment.png");
    healthBloodimg= loadImage("data/heart.png");
    clockimg= loadImage("data/clock.png");
    skillZeroimg=loadImage("data/shotgun.png");
    skillOneimg=loadImage("data/crash.png");
    skillTwoimg=loadImage("data/rocketui_image.png");
    
    
    healthBarSegment.resize(81,200);
    healthBloodimg.resize(100,100);
    clockimg.resize(100,100);
    skillOneimg.resize(75,75);
    skillTwoimg.resize(75,75);
    skillZeroimg.resize(75,75);
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
    rect(cam.x + 1100 , cam.y + 420, 42*2, 100*4);
    for(int i=0;i<2*health;i++){
       image(healthBarSegment, cam.x + 1100, cam.y + 420  + i );
    }
    image(healthBloodimg, cam.x + 1090, cam.y + 300  );
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
    image(clockimg,cam.x-300,cam.y-470*2-80);
        
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
     //fill(255 * cooldownFraction);
     //rect(cam.x + 1100 - 100 * slot,cam.y+850,75,75);
     if(slot ==1){
       PImage whitebox=makewhitemask(75,cooldownFraction);
       skillOneimg.mask(whitebox);
       image (skillOneimg,cam.x + 1100 - 100 * slot,cam.y+850);
       textSize(30);
       text("Boost",cam.x + 1100 - 100 * slot+30,cam.y+950);
     }
     if(slot ==2){
       PImage whitebox=makewhitemask(75,cooldownFraction);
       skillTwoimg.mask(whitebox);
       image (skillTwoimg,cam.x + 1100 - 100 * slot,cam.y+850);
       textSize(30);
       text("Rocket",cam.x + 1100 - 100 * slot+30,cam.y+950);
     }
     if(slot ==0){
       PImage whitebox=makewhitemask(75,cooldownFraction);
       skillZeroimg.mask(whitebox);
       image (skillZeroimg,cam.x + 1100 - 100 * slot,cam.y+850);
       textSize(30);
       text("ShotGun",cam.x + 1100 - 100 * slot+30,cam.y+950);
     }
  }
  
  public PImage makewhitemask(int size, float rate){
    PImage whitebox=createImage(size,size,ALPHA);
    whitebox.loadPixels();
    for(int i=0; i<whitebox.pixels.length;i++){
    whitebox.pixels[i]=color(255*rate);
    }
    return whitebox;
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
      textSize(60);
      fill(255);
      text("Destroy the flashing ", cam.x+1100,cam.y - 870);      
      fill(255, 0, 0);
      text("Boid Replicators", cam.x + 1100, cam.y - 800);
      fill(255);
      text(map.numberReplicatorsDestroyed +"/" + map.replicators.size(), cam.x + 1200, cam.y - 835);
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
