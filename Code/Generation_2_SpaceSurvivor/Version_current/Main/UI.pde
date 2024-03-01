enum state { PAUSED, DEAD};
class UI {
  int health;
  int score;
  long aTick;
  long rollstart;

  boolean paused;
  boolean dead;
  PImage optionsImage1; 
  PImage menuImage1;
  PImage restartImage1;
  PImage optionsImage2; 
  PImage menuImage2;
  PImage restartImage2;
  PImage optionsButtonImage;
  PImage menuButtonImage;
  PImage restartButtonImage;
  
  
  UI(Player p1){
    health = p1.health;
    score = p1.points;
    paused = false;
    dead = false;
    optionsImage1 = loadImage("data/options_button_1.png");
    menuImage1 = loadImage("data/exit_button_1.png");
    restartImage1 = loadImage("data/restart_button_1.png");
    optionsImage2 = loadImage("data/options_button_2.png");
    menuImage2 = loadImage("data/exit_button_2.png");
    restartImage2 = loadImage("data/restart_button_2.png");
  }
  
  void buttonHover(state s) {
    // ultra hacky
    if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2 - 100) && mouseY < (height / 2 - 50) && s == state.PAUSED) {
       optionsButtonImage = optionsImage2; 
       
    } else {
       optionsButtonImage = optionsImage1; 
    }
    if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2) && mouseY < (height / 2 + 50)) {
       menuButtonImage = menuImage2; 
    } else {
       menuButtonImage = menuImage1; 
    }
    if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2 + 100) && mouseY < (height / 2 + 150)) {
       restartButtonImage = restartImage2; 
       if (mouseButton == LEFT) {
           restart();
       }
    } else {
       restartButtonImage = restartImage1; 
    }
    
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
    textSize(100+abs(beatdist()));
    text( score,cam.x,cam.y+470/scale);
  }
  
  void deathscreen(Camera cam){
    text("You're Dead", cam.x,cam.y - 100);
    buttonHover(state.DEAD);
    image(menuButtonImage, p1.x-180, p1.y);
    image(restartButtonImage, p1.x-180, p1.y + 200);
  }
  
  void pausescreen(Camera cam){  
    //text("Paused", cam.x,cam.y);
    buttonHover(state.PAUSED);
    image(optionsButtonImage, p1.x-180, p1.y-200);
    image(menuButtonImage, p1.x-180, p1.y);
    image(restartButtonImage, p1.x-180, p1.y + 200);
    textSize(50);
    //text("press r to restart", cam.x, cam.y+50/scale);
    textSize(100);
    
    //noLoop();
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
