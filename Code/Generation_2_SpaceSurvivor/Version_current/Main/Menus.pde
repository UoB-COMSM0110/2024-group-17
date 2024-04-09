public class Menus{

  DifficultyPage difficultyPage = new DifficultyPage(this);
  PauseScreen  pauseScreen= new PauseScreen(this);
  OptionsScreen optionsScreen = new OptionsScreen(this);
  WinScreen winScreen = new WinScreen(this);
  DeathScreen deathScreen;
  StartPage startPage;
  Page activePage = Page.START;
  
  Menus(Main main){
      startPage = new StartPage(this,main);
      deathScreen = new DeathScreen(this,main);
  }
  
  public void doThings(){
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
         return;
    }
  }
  
  public void switchScreen(Page nextPage){
    activePage = nextPage; 
  }
  
  public boolean isPlaying(){ 
    if(activePage != Page.PLAYING){
      return false;
    }else{return true;}
  }
  
}
