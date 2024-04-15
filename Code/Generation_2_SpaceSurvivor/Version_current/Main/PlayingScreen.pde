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
     drawCursor();
  }
  
  private void drawCursor(){
    //This kinda sucks but it works for now ?? yall can change it if u want
    strokeWeight(3);
    noCursor();
    float transformedMouseX = cam.x + mouseX*2 - (width);
    float transformedMouseY = cam.y + mouseY*2 - (height);
    float xPos = cam.x/2 + currentMap.player.xGet()/2 + (mouseX*2  - (width))/1.2;
    float yPos = cam.y/2 + currentMap.player.yGet()/2 + (mouseY*2- (height))/1.2;
    float xPos2 = cam.x/2 + currentMap.player.xGet()/2 + (mouseX*2  - (width))/1.4;
    float yPos2 = cam.y/2 + currentMap.player.yGet()/2 +(mouseY*2- (height))/1.4;
    //float xPos3 = cam.x/2 + currentMap.player.xGet()/2 + (mouseX*2  - (width))/2;
   // float yPos3 = cam.y/2 + currentMap.player.yGet()/2 +(mouseY*2- (height))/2;
    float clockwiseXPos = ((xPos2- currentMap.player.xGet())*cos(PI/20) - (yPos2-currentMap.player.yGet())*sin(PI/20))+ currentMap.player.xGet();
    float clockwiseYPos = ((xPos2- currentMap.player.xGet())*sin(PI/20) + (yPos2-currentMap.player.yGet())*cos(PI/20))+ currentMap.player.yGet();
    float antiXPos = ((xPos2- currentMap.player.xGet())*cos(-PI/20) - (yPos2-currentMap.player.yGet())*sin(-PI/20)) + currentMap.player.xGet();
    float antiYPos = ((xPos2- currentMap.player.xGet())*sin(-PI/20) + (yPos2-currentMap.player.yGet())*cos(-PI/20)) + currentMap.player.yGet();
    line(transformedMouseX , transformedMouseY, cam.x/2 + currentMap.player.xGet()/2 + (mouseX*2  - (width))/2 ,cam.y/2 + currentMap.player.yGet()/2 +(mouseY*2- (height))/2);
    quad(transformedMouseX,transformedMouseY,clockwiseXPos, clockwiseYPos, xPos, yPos, antiXPos, antiYPos);
    strokeWeight(1);
  }
  
  public Map getMap(){return currentMap;}
  
  void setTicks(){
    tick +=floor((millis() - pTime)/10);
    pTime = millis();

  }
  
}
