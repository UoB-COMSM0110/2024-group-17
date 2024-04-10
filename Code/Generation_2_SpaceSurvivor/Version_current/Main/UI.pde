class UI {
  float health;
  int score;
  long aTick;
  long rollstart;
  Player player;
  Camera cam;
  PImage healthBarSegment;
   
  UI(Player playerInput, Camera camInput){
    cam = camInput;
    player = playerInput;
    healthBarSegment = loadImage("data/health_bar_segment.png");
    healthBarSegment.resize(81,200);
  }
  
  public void doThings(){
    update(); 
    healthbar();
    score();
    cooldowns();
  }
  
  void update(){
    health = player.health;
    score = player.points;
    aTick = player.aTick;
  }
  
  void healthbar(){
    fill(48,25,52);
    rect(cam.x - 1200 , cam.y + 470, 42*2, 100*4);
    for(int i=0;i<2*health;i++){
       image(healthBarSegment, cam.x - 1200, cam.y + 470  + i );
    }
  } 
  
  void score(){
    textAlign(CENTER);
    textSize(100);
    text(score,cam.x,cam.y+470*2);
  }
  
  void cooldowns(){
    float aBright = ((float)(tick - aTick))/(float)player.bAcd;
    if(aBright>1){
      aBright = 1;
    }
    fill((int)((float)255*aBright),0,0);
    rect(cam.x + 1000,cam.y-940,50,50);
     
  }
}
