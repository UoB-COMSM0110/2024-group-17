class DeathScreen extends Screen{
  Menus menu;
  AudioPlayer deathMusic;
  PImage exitButtonImage;
  PImage exitButtonImage1;
  PImage exitButtonImage2;  
  PImage restartButtonImage;
  PImage restartButtonImage1;  
  PImage restartButtonImage2;   
  
  DeathScreen(Menus menuInput){
    deathMusic = minim.loadFile("DeathMusic.wav");
    menu = menuInput; 
    exitButtonImage1 = loadImage("data/exit_button_1.png");
    exitButtonImage2 = loadImage("data/exit_button_2.png");
    restartButtonImage2 = loadImage("data/restart_button_2.png");
    restartButtonImage1 = loadImage("data/restart_button_1.png");     
    
  }
  
  public void doThings(){
    cursor(ARROW);
    checkButtons(false);
    justDrawLoop(currentMap);
    drawButtons();
  }
  
  private void drawButtons(){
    textSize(100);
    fill(255);
    text("MISSION FAILED", cam.x,cam.y - 100);
    image(exitButtonImage, cam.x-180, cam.y+200);
    image(restartButtonImage, cam.x-180, cam.y); 
  }
  
  @Override 
  public void checkButtons(boolean isClick){
    checkRestart(isClick);
    checkExit(isClick);
  }
  

   private void checkRestart(boolean isClick){
     if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2) && mouseY < (height / 2 + 50)){
       restartButtonImage = restartButtonImage2; 
       if (isClick) {
         deathMusic.pause();
         menu.startPage.startMusic.play();
         menu.switchScreen(Page.START,menu.startPage);
       }
       
    } else {
       restartButtonImage = restartButtonImage1; 
    }
    
  }
  
  private void checkExit(boolean isClick){
     if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2 + 100) && mouseY < (height / 2 + 150)) {
       exitButtonImage = exitButtonImage2; 
       if (isClick) {
         exit();
       }
    } else {
       exitButtonImage = exitButtonImage1; 
    }
  }  
    
}
