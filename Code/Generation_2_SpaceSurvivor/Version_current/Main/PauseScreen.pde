class PauseScreen extends Screen{
  Menus menu;
  PImage exitButtonImage;  
  PImage exitButtonImage1;
  PImage exitButtonImage2;
  PImage optionsButtonImage; 
  PImage optionsButtonImage1;    
  PImage optionsButtonImage2;  
  PImage restartButtonImage;
  PImage restartButtonImage1;  
  PImage restartButtonImage2; 
  Map map;
  
  PauseScreen(Menus menuInput){
    menu = menuInput; 
    exitButtonImage1 = loadImage("data/exit_button_1.png");
    exitButtonImage2 = loadImage("data/exit_button_2.png");
    optionsButtonImage2 = loadImage("data/options_button_2.png");
    optionsButtonImage1 = loadImage("data/options_button_1.png"); 
    restartButtonImage2 = loadImage("data/restart_button_2.png");
    restartButtonImage1 = loadImage("data/restart_button_1.png"); 
 }
  
  public void doThings(boolean[] keyspressed){
      mainDrawLoop(keyspressed);
      drawButtons();
   }
   
   public void mainDrawLoop(boolean[] keyspressed){
     background(0);
     updateStarPositions();
     drawStars();
     camera(camMat, cam.x,cam.y,0.5,0.5); 
     map.doThings(keyspressed); 
  }
  
  private void drawButtons(){
    camera(camMat, cam.x,cam.y,1,1);
    image(optionsButtonImage, cam.x-180, cam.y-200);
    image(exitButtonImage, cam.x-180, cam.y);
    image(restartButtonImage,cam.x-180,cam.y + 200);
  }
  
  public void setMap(Map mapInput){
    map = mapInput; 
  }
  
}
