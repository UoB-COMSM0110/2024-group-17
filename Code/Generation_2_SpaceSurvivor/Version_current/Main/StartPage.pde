public class StartPage extends Screen{
  PImage beginButtonImage;
  PImage beginButtonImage1;
  PImage beginButtonImage2;
  PImage exitButtonImage;  
  PImage exitButtonImage1;
  PImage exitButtonImage2;
  PImage optionsButtonImage; 
  PImage optionsButtonImage1;    
  PImage optionsButtonImage2;    
  PImage logo;
  Menus menus; 
  AudioPlayer startMusic;
  
  StartPage(Menus menusInput, Main main){
    menus = menusInput;
    startMusic = minim.loadFile("TitleScreen.wav");
    startMusic.play();
    beginButtonImage1 = loadImage("data/start_button_1.png");
    beginButtonImage2 = loadImage("data/start_button_2.png");
    exitButtonImage1 = loadImage("data/exit_button_1.png");
    exitButtonImage2 = loadImage("data/exit_button_2.png");
    optionsButtonImage2 = loadImage("data/options_button_2.png");
    optionsButtonImage1 = loadImage("data/options_button_1.png");
    logo = loadImage("data/spacegamelogo.png");
  }
  
  
  public void doThings(){
    background(0);
    drawStars();
    cam.move(0,0);
    camera(camMat, cam.x,cam.y,0.5,0.5);
    checkButtons(false);
    drawButtons();
  }
  
  private void drawButtons(){
    textSize(100);
    fill(255);
    logo.resize(800, 300);
    image(logo, cam.x-430,cam.y - 650);
    
    image(beginButtonImage, cam.x-180, cam.y-200);
    image(optionsButtonImage, cam.x-180, cam.y);
    image(exitButtonImage, cam.x-180, cam.y+200);
    textSize(50);
  }
  @Override
  public void checkButtons(boolean isClick){
    checkBegin(isClick);
    checkOptions(isClick);
    checkExit(isClick); 
  }

  private void checkBegin(boolean isClick){
    if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2 - 100) && mouseY < (height / 2 - 50)) {
       beginButtonImage = beginButtonImage2; 
       if (isClick) {
         menus.switchScreen(Page.DIFFICULTY,menu.difficultyPage);
       }
    } else{beginButtonImage = beginButtonImage1;}
  }
  
  private void checkOptions(boolean isClick){
     if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2) && mouseY < (height / 2 + 50)){
       optionsButtonImage = optionsButtonImage2; 
       if (isClick) {
       }
       
    } else {
       optionsButtonImage = optionsButtonImage1; 
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
