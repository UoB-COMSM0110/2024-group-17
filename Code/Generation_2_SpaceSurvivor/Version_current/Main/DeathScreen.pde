class DeathScreen extends Screen{
  Menus menu;
  SoundFile deathMusic;
  boolean deathMusicPlaying = false;
  PImage exitButtonImage;
  PImage exitButtonImage1;
  PImage exitButtonImage2;  
  PImage restartButtonImage;
  PImage restartButtonImage1;  
  PImage restartButtonImage2;   
  Map map;
  
  DeathScreen(Menus menuInput,Main main){
    deathMusic = new SoundFile(main,"DeathMusic.wav");
    menu = menuInput; 
    exitButtonImage1 = loadImage("data/exit_button_1.png");
    exitButtonImage2 = loadImage("data/exit_button_2.png");
    restartButtonImage2 = loadImage("data/restart_button_2.png");
    restartButtonImage1 = loadImage("data/restart_button_1.png");     
    
  }
  
  public void doThings(){
    if(!deathMusicPlaying){playMusic();}
    justDrawLoop();
    drawButtons();
  }
  
  public void justDrawLoop(){
     background(0);
     drawStars();
     camera(camMat, cam.x,cam.y,0.5,0.5); 
     map.justDrawThings();
  }
  
  private void playMusic(){
    deathMusic.play();
    deathMusicPlaying = true;
  }
  
  private void drawButtons(){
    fill(255);
    text("You're Dead", cam.x,cam.y - 100);
    image(exitButtonImage, cam.x-180, cam.y);
    image(restartButtonImage, cam.x-180, cam.y + 200); 
  }
  
  public void setMap(Map mapInput){
    map = mapInput; 
  }
}
