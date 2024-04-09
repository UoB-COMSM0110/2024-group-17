public class StartPage{
  PImage beginButtonImage;
  PImage beginButtonImage1;
  PImage beginButtonImage2;
  PImage exitButtonImage;  
  PImage exitButtonImage1;
  PImage exitButtonImage2;
  PImage optionsButtonImage; 
  PImage optionsButtonImage1;    
  PImage optionsButtonImage2;    
  Menus menus; 
  boolean musicStarted = true;
  SoundFile startMusic;
  
  StartPage(Menus menusInput, Main main){
    menus = menusInput;
    startMusic = new SoundFile(main,"TitleScreen.wav");
    startMusic.play();
    beginButtonImage1 = loadImage("data/start_button_1.png");
    beginButtonImage2 = loadImage("data/start_button_2.png");
    exitButtonImage1 = loadImage("data/exit_button_1.png");
    exitButtonImage2 = loadImage("data/exit_button_2.png");
    optionsButtonImage2 = loadImage("data/options_button_2.png");
    optionsButtonImage1 = loadImage("data/options_button_1.png");
  }
  
  
  public void doThings(){
    background(0);
    for (int i = 0; i < 1000; i++) {
      fill(255);
      stroke(255);
      ellipse((int)starsX[i], (int)starsY[i], 1, 1);
    }
    cam.move(0,0);
    camera(camMat, cam.x,cam.y,0.5,0.5);
    if(!musicStarted){
      startMusic.play();
      musicStarted = true;
    }
    checkBegin();
    checkOptions();
    checkExit(); 
    drawButtons();
  }
  
  private void drawButtons(){
    textSize(100);
    text("SPACE SURVIVORS", cam.x - 400,cam.y - 400);
    image(beginButtonImage, cam.x-180, cam.y-200);
    image(optionsButtonImage, cam.x-180, cam.y);
    image(exitButtonImage, cam.x-180, cam.y+200);
    textSize(50);
  }

  private void checkBegin(){
    if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2 - 100) && mouseY < (height / 2 - 50)) {
       beginButtonImage = beginButtonImage2; 
       if (mouseButton == LEFT) {
         menus.switchScreen(Page.DIFFICULTY);
       }
    } else{beginButtonImage = beginButtonImage1;}
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
