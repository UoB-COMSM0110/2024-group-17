public class PlayingScreen extends Screen{
  Menus menu;
  Main main;
  
  PlayingScreen(Menus menuInput, Main mainInput){
    menu = menuInput; 
    main = mainInput;
  }
  
  public void doThings(boolean[] keyspressed){
     setTicks();
     mainDrawLoop(keyspressed);
  }
  
  public void mainDrawLoop(boolean[] keyspressed){
     setTicks();
     background(0);
     updateStarPositions();
     drawStars();
     camera(camMat, cam.x,cam.y,0.5,0.5); 
     currentMap.doThings(keyspressed);
     if(currentMap.gateway.shouldExtract){menu.winGame();}
  }
  
  public Map getMap(){return currentMap;}
  
  void setTicks(){
    tick +=floor((millis() - pTime)/10);
    pTime = millis();

  }
  
}
