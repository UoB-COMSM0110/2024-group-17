class PauseScreen{
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
  
  PauseScreen(Menus menuInput){
    menu = menuInput; 
    exitButtonImage1 = loadImage("data/exit_button_1.png");
    exitButtonImage2 = loadImage("data/exit_button_2.png");
    optionsButtonImage2 = loadImage("data/options_button_2.png");
    optionsButtonImage1 = loadImage("data/options_button_1.png"); 
    restartButtonImage2 = loadImage("data/restart_button_2.png");
    restartButtonImage1 = loadImage("data/restart_button_1.png"); 
 }
  
  public void doThings(){return;}
  
  private void drawButtons(){
    camera(camMat, cam.x,cam.y,1,1);
    image(optionsButtonImage, p1.xGet()-180, p1.yGet()-200);
    image(exitButtonImage, p1.xGet()-180, p1.yGet());
    image(restartButtonImage, p1.xGet()-180, p1.yGet() + 200);
    noLoop();
  }
  
}
