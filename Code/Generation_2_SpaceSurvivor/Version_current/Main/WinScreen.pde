class WinScreen extends Screen{
  
  Menus menu;
  PImage exitButtonImage;
  PImage exitButtonImage1;
  PImage exitButtonImage2;  
  PImage restartButtonImage;
  PImage restartButtonImage1;  
  PImage restartButtonImage2;
  
  WinScreen(Menus menuInput){
    menu = menuInput; 
    exitButtonImage1 = loadImage("data/exit_button_1.png");
    exitButtonImage2 = loadImage("data/exit_button_2.png");
    restartButtonImage2 = loadImage("data/restart_button_2.png");
    restartButtonImage1 = loadImage("data/restart_button_1.png");
  }
  
  public void doThings(){
    cursor(ARROW);
    background(0);
    drawStars();
    camera(camMat, cam.x,cam.y,0.5,0.5); 
    textSize(100);
    fill(255);
    checkButtons(false);
    text("MISSION SUCCESS", cam.x,cam.y - 600);
    text("POINTS : "+currentMap.player.points + "\nTIME REMAINING : " + currentMap.timeRemaining() / 100 + "\nFINAL SCRORE = " + calculateFinalScore()  , cam.x,cam.y-400);
    image(exitButtonImage, cam.x-180, cam.y+200);
    image(restartButtonImage, cam.x-180, cam.y); 
    //To do 
    // Play again and exit buttons!!
  }
  
  @Override 
  public void checkButtons(boolean isClick){
    checkRestart(isClick);
    checkExit(isClick);
  }
  
  private int calculateFinalScore(){
    return currentMap.player.points + (int) (currentMap.timeRemaining() /100);
    
  }

  private void checkRestart(boolean isClick){
     if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2) && mouseY < (height / 2 + 50)){
       restartButtonImage = restartButtonImage2; 
       if (isClick) {
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
