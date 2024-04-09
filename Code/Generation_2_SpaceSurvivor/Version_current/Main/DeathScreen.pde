class DeathScreen{
  Menus menu;
  SoundFile deathMusic;
  boolean deathMusicPlaying = false;
  PImage exitButtonImage;
  PImage exitButtonImage1;
  PImage exitButtonImage2;  
  PImage restartButtonImage;
  PImage restartButtonImage1;  
  PImage restartButtonImage2;    
  
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
    drawButtons();
  }
  
  private void playMusic(){
    deathMusic.play();
    deathMusicPlaying = true;
  }
  
  private void drawButtons(){
    fill(255);
    text("You're Dead", cam.x,cam.y - 100);
    image(exitButtonImage, p1.xGet()-180, p1.yGet());
    image(restartButtonImage, p1.xGet()-180, p1.yGet() + 200); 
  }
}
