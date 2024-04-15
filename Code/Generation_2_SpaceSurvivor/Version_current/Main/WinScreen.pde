class WinScreen extends Screen{
  
  Menus menu;
  
  WinScreen(Menus menuInput){
    menu = menuInput; 
  }
  
  public void doThings(){
    cursor(ARROW);
    background(0);
    drawStars();
    camera(camMat, cam.x,cam.y,0.5,0.5); 
    textSize(100);
    fill(255);
    text("MISSION SUCCESS", cam.x-32,cam.y - 200);
    text("POINTS : "+currentMap.player.points + "\nTIME REMAINING : " + currentMap.timeRemaining() / 100 + "\nFINAL SCRORE = " + calculateFinalScore()  , cam.x-32,cam.y);
    //To do 
    // Play again and exit buttons!!
  }
  
  private int calculateFinalScore(){
    return currentMap.player.points + (int) (currentMap.timeRemaining() /100);
    
  }
}
