class UI{
  int health;
  int score;
  long aTick;
  long rollstart;

  boolean paused;
  boolean dead;
  
  UI(Player p1){
    health = p1.health;
    score = p1.points;
    paused = false;
    dead = false;
  }
    
  void update(Player p1){
    health = p1.health;
    score = p1.points;
    rollstart = p1.rollstart;
    aTick = p1.aTick;
    if(health <= 0){
      dead = true;
    }
  }
  
  void healthbar(Camera cam){
    for(int i=0;i<health;i++){
       fill(0,255,255);
       ellipse(cam.x - 500/scale,cam.y-470/scale + i*75/scale,25/scale,25/scale);
    }
  } 
  
  void score(Camera cam){
    textAlign(CENTER);
    textSize(100);
    text( score,cam.x,cam.y+470/scale);
  }
  
  void deathscreen(Camera cam){
    text("You're Dead", cam.x,cam.y);
  }
  
  void pausescreen(Camera cam){  
    text("Paused", cam.x,cam.y);
    textSize(50);
    text("press r to restart", cam.x, cam.y+50/scale);
    textSize(100);
    noLoop();
  }
  
  void cooldowns(Camera cam,Player p1){
    float aBright = ((float)(tick - aTick))/(float)p1.bAcd;
    if(aBright>1){
      aBright = 1;
    }
    fill((int)((float)255*aBright),0,0);
    rect(cam.x + 500/scale,cam.y-470/scale,25/scale,25/scale);
    
    float rBright = ((float)(tick - rollstart))/(float)p1.Rcd;
    if(rBright>1){
      rBright = 1;
    }
    fill(0,0,(int)((float)255*rBright));
    rect(cam.x + 500/scale,cam.y-470/scale + 75/scale,25/scale,25/scale);
      
  }
}
