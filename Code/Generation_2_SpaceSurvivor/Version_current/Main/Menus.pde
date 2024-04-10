public class Menus{

  DifficultyPage difficultyPage = new DifficultyPage(this);
  OptionsScreen optionsScreen = new OptionsScreen(this);
  WinScreen winScreen = new WinScreen(this);
  PlayingScreen playingScreen;
  PauseScreen  pauseScreen= new PauseScreen(this);
  DeathScreen deathScreen;
  StartPage startPage;
  Page activePage = Page.START;
  
  Map currentMap;
  Camera cam;
  
  Menus(Main main, Camera camInput){
      cam = camInput;
      startPage = new StartPage(this,main);
      deathScreen = new DeathScreen(this,main);
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
  
  public void switchScreen(Page nextPage){
    activePage = nextPage; 
  }
  
  public void pauseGame(){
     pauseScreen.setMap(playingScreen.getMap());
     switchScreen(Page.PAUSE);
  }
  
  public void deathOverlay(){
     deathScreen.setMap(playingScreen.getMap()); 
     switchScreen(Page.DEATH);
  }
  
  public void newGame(int difficulty){
    playingScreen.newGame(difficulty, cam); 
  }
  
  public boolean isPlaying(){ 
    if(activePage != Page.PLAYING){
      return false;
    }else{return true;}
  }
  
}
