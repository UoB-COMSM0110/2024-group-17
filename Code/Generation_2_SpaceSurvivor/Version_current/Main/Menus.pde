public class Menus{

  DifficultyPage difficultyPage = new DifficultyPage(this);
  OptionsScreen optionsScreen = new OptionsScreen(this);
  WinScreen winScreen = new WinScreen(this);
  PlayingScreen playingScreen;
  PauseScreen  pauseScreen= new PauseScreen(this);
  DeathScreen deathScreen;
  StartPage startPage;
  Page activePage = Page.START;
  Screen activeScreen = startPage;
  
  Map currentMap;
  Camera cam;
  Main main;
  
  Menus(Main mainInput, Camera camInput){
      main = mainInput;
      cam = camInput;
      startPage = new StartPage(this,main);
      activeScreen = startPage;
      deathScreen = new DeathScreen(this);
      playingScreen = new PlayingScreen(this,main);
  
  }
  public void doThings(boolean[] keyspressed){
    switch(activePage){
      case START : 
        startPage.doThings();
        return;
      case DIFFICULTY : 
        difficultyPage.doThings();
        return;
      case PAUSE : 
        pauseScreen.doThings();
        return;      
      case DEATH : 
        deathScreen.doThings();
        return;
      case WIN : 
        winScreen.doThings();
        return;        
      case PLAYING : 
        playingScreen.doThings(keyspressed);
        return;
    }
  }
  
  public void startGamge(Map mapInput){
    currentMap = mapInput;
    switchScreen(Page.START,playingScreen);
  }
  
  public void switchScreen(Page nextPage, Screen nextScreen){
    activeScreen = nextScreen;
    activePage = nextPage; 
  }
  
  public void pauseGame(){
     pauseScreen.setMap(playingScreen.getMap());
     switchScreen(Page.PAUSE,pauseScreen);
  }
  
  public void winGame(){
     winScreen.setMap(playingScreen.getMap());
     switchScreen(Page.WIN,winScreen);
  }
  
  public void die(){
     deathScreen.setMap(playingScreen.getMap()); 
     deathScreen.deathMusic.play();
     switchScreen(Page.DEATH,deathScreen);
  }
  
  public void newGame(int difficulty){
    currentMap = new Map(difficulty,cam);
    startPage.startMusic.pause();
    playingScreen.setMap(currentMap);
    tick = 0;
    pTime = millis();
    switchScreen(Page.PLAYING,playingScreen);
  }
  
  public boolean isPlaying(){ 
    if(activePage != Page.PLAYING){
      return false;
    }else{return true;}
  }
  
  public void doClick(){
    activeScreen.clickButton(); 
    //startPage.clickButton();
  }
  
}
