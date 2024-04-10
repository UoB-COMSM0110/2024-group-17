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
    optionsButtonImage2 = loadImage("data/options_button_2.png");
    optionsButtonImage1 = loadImage("data/options_button_1.png"); 
    exitButtonImage1 = loadImage("data/exit_button_1.png");
    exitButtonImage2 = loadImage("data/exit_button_2.png");
 }
  
  public void doThings(){
      justDrawLoop();
      checkOptions();
      checkExit();
      drawButtons();
      pTime = millis();
   }
   
   public void justDrawLoop(){
     background(0);
     drawStars();
     camera(camMat, cam.x,cam.y,0.5,0.5); 
     map.justDrawThings(); 
  }
  
  private void drawButtons(){
    textSize(100);
    fill(255);
    text("PAUSED", cam.x-32,cam.y - 200);
    image(optionsButtonImage, cam.x-180, cam.y);
    image(exitButtonImage, cam.x-180, cam.y+200);
    textSize(50);
  }
  
  public void setMap(Map mapInput){
    map = mapInput; 
  }
  
    private void checkOptions(){
     if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2) && mouseY < (height / 2 + 50)){
       optionsButtonImage = optionsButtonImage2; 
       if (mouseButton == LEFT) {
       }
       
    } else {
       optionsButtonImage = optionsButtonImage1; 
    }
    
  }
  
  private void checkExit(){
     if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2 + 100) && mouseY < (height / 2 + 150)) {
       exitButtonImage = exitButtonImage2; 
       if (mouseButton == LEFT) {
         exit();
       }
    } else {
       exitButtonImage = exitButtonImage1; 
    }
    
  }
  
}
