class PauseScreen extends Screen{
  Menus menu;
  PImage exitButtonImage;  
  PImage exitButtonImage1;
  PImage exitButtonImage2;
  PImage restartButtonImage;
  PImage restartButtonImage1;  
  PImage restartButtonImage2; 
  Map map;
  
  PauseScreen(Menus menuInput){
    menu = menuInput; 
    restartButtonImage2 = loadImage("data/restart_button_2.png");
    restartButtonImage1 = loadImage("data/restart_button_1.png");   
    exitButtonImage1 = loadImage("data/exit_button_1.png");
    exitButtonImage2 = loadImage("data/exit_button_2.png");
 }
  
  public void doThings(){
      justDrawLoop(map);
      checkButtons(false);
      drawButtons();
      pTime = millis();
   }
  
  private void drawButtons(){
    textSize(100);
    fill(255);
    text("PAUSED", cam.x-32,cam.y - 200);
    image(restartButtonImage, cam.x-180, cam.y);
    image(exitButtonImage, cam.x-180, cam.y+200);
    textSize(50);
  }
  
  public void setMap(Map mapInput){
    map = mapInput; 
  }
  
   private void checkRestart(boolean isClick){
     if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2) && mouseY < (height / 2 + 50)){
       restartButtonImage = restartButtonImage2; 
       if (isClick) {
         map.gameMusic.pause();
         menu.startPage.startMusic.play();
         menu.switchScreen(Page.START,menu.startPage);
       }
       
    } else {
       restartButtonImage = restartButtonImage1; 
    }
    
  }
  @Override 
  public void checkButtons(boolean isClick){
    //TODO below!1
    // checkResume(isClick);
    checkRestart(isClick);
    checkExit(isClick);
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
