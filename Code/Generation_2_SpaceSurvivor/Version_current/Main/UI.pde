enum state { MAINMENU,PAUSED, DEAD, OPTIONS, DIFFICULTY};
class UI {
  float health;
  int score;
  long aTick;
  long rollstart;

  boolean paused;
  boolean dead;
  boolean difficulty;
  boolean mainMenu;
  
  PImage optionsImage1; 
  PImage menuImage1;
  PImage beginImage1; 
  PImage beginImage2;
  PImage difficultyImage1;
  PImage difficultyImage2;
  PImage normalImage1;
  PImage normalImage2;
  PImage insaneImage1;
  PImage insaneImage2;
  PImage exitImage1; 
  PImage exitImage2;
  PImage restartImage1;
  PImage optionsImage2; 
  PImage menuImage2;
  PImage restartImage2;
  PImage optionsButtonImage;
  PImage menuButtonImage;
  PImage restartButtonImage;
  PImage beginButtonImage;
  PImage exitButtonImage;
  PImage healthBarSegment;
  PImage difficultyButtonImage;
  PImage normalButtonImage;
  PImage insaneButtonImage;
  
  
  
  UI(Player p1){
    health = p1.health;
    score = p1.points;
    paused = false;
    dead = false;
    difficulty=false;
    mainMenu=true;
    healthBarSegment = loadImage("data/health_bar_segment.png");
    optionsImage1 = loadImage("data/options_button_1.png");
    menuImage1 = loadImage("data/exit_button_1.png");
    restartImage1 = loadImage("data/restart_button_1.png");
    beginImage1 = loadImage("data/start_button_1.png");
    beginImage2 = loadImage("data/start_button_2.png");
    exitImage1 = loadImage("data/exit_button_1.png");
    exitImage2 = loadImage("data/exit_button_2.png");
    normalImage1 = loadImage("data/normal_button_1.png");
    normalImage2 = loadImage("data/normal_button_2.png");
    insaneImage1 = loadImage("data/insane_button_1.png");
    insaneImage2 = loadImage("data/insane_button_2.png");
    difficultyImage1 = loadImage("data/difficulty_button_1.png");
    difficultyImage2 = loadImage("data/difficulty_button_2.png");
    optionsImage2 = loadImage("data/options_button_2.png");
    menuImage2 = loadImage("data/exit_button_2.png");
    restartImage2 = loadImage("data/restart_button_2.png");
  }
  
  void buttonHover(state s) {
    
    if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2 - 100) && mouseY < (height / 2 - 50) && mainMenu) {
       beginButtonImage = beginImage2; 
       if (mouseButton == LEFT) {
         difficulty=true;
         mainMenu=false;
         return;
       }
       
    } else {
       beginButtonImage = beginImage1; 
    }
    
    if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2) && mouseY < (height / 2 + 50) &&(difficulty)) {
       normalButtonImage = normalImage2; 
       if (mouseButton == LEFT) {
         selectedDifficulty =0;
         difficulty=false;
         return;
         //restart();
         
       }
       
    } else {
       normalButtonImage = normalImage1; 
    }
    
    if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2 + 100) && mouseY < (height / 2 + 150) && (difficulty)) {
       insaneButtonImage = insaneImage2; 
       if (mouseButton == LEFT) {
         selectedDifficulty = 1;
         difficulty=false;
         //restart();
         return;
       }
       
    } else {
       insaneButtonImage = insaneImage1; 
    }
    
    if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2 + 100) && mouseY < (height / 2 + 150) &&(mainMenu)) {
       optionsButtonImage = optionsImage2; 
       if (mouseButton == LEFT) {
       }
       
    } else {
       optionsButtonImage = optionsImage1; 
    }
    
    if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2 - 100) && mouseY < (height / 2 - 50) &&(paused)) {
       optionsButtonImage = optionsImage2; 
       if (mouseButton == LEFT) {
       }
       
    } else {
       optionsButtonImage = optionsImage1; 
    }
    
    if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2) && mouseY < (height / 2 + 50) &&(mainMenu||dead||paused)) {
       exitButtonImage = exitImage2; 

       if (mouseButton == LEFT && mousePressed &&!difficulty) {
         exit();
       }
    } else {
       exitButtonImage = exitImage1; 
    }
    
    if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2 + 100) && mouseY < (height / 2 + 150) && (paused||dead)) {
       restartButtonImage = restartImage2; 

       if (mouseButton == LEFT) {
           paused=false;
           dead=false;
           restart();
           return;
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
    fill(48,25,52);
    rect(cam.x - 500 / scale, cam.y - 470 / scale, 42, 100/scale);
    for(int i=0;i<health;i++){
       fill(0,255,255);
       image(healthBarSegment, cam.x - 500 / scale, cam.y - 470 / scale + i / scale);
       //ellipse(cam.x - 500/scale,cam.y-470/scale + i*75/scale,25/scale,25/scale);
    }
  } 
  
  void score(Camera cam){
    textAlign(CENTER);
    textSize(100);
    text( score,cam.x,cam.y+470/scale);
  }
  
  void deathscreen(Camera cam){
    text("You're Dead", cam.x,cam.y - 100);
    buttonHover(state.DEAD);
    image(exitButtonImage, p1.x-180, p1.y);
    image(restartButtonImage, p1.x-180, p1.y + 200);
  }
  
  void mainmenu(Camera cam) {
    buttonHover(state.MAINMENU);
    textSize(100);
    text("SPACE SURVIVORS", cam.x - 400,cam.y - 400);
    image(beginButtonImage, p1.x-180, p1.y-200);
    image(exitButtonImage, p1.x-180, p1.y);
    image(optionsButtonImage, p1.x-180, p1.y + 200);
    textSize(50);
  }
  
  void pausescreen(Camera cam){  
    //text("Paused", cam.x,cam.y);
    buttonHover(state.PAUSED);
    image(optionsButtonImage, p1.x-180, p1.y-200);
    image(exitButtonImage, p1.x-180, p1.y);
    image(restartButtonImage, p1.x-180, p1.y + 200);
    textSize(50);
    //text("press r to restart", cam.x, cam.y+50/scale);
    textSize(100);
    
    //noLoop();
  }
  
  void optionsscreen(Camera cam) {
    buttonHover(state.OPTIONS);
    image(difficultyButtonImage, p1.x-180, p1.y-200);
  }
  
  void difficultyscreen(Camera cam) {
    buttonHover(state.DIFFICULTY);
    image(normalButtonImage, p1.x-180, p1.y);
    image(insaneButtonImage, p1.x-180, p1.y+200);
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
