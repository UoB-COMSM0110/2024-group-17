public class Tutorial{
  int step = 0;
  float xCoord;
  float yCoord;
  Camera cam;
  Map map;
  long waitStartTick;
  bool hasWaitedMoving = new bool(false);
  boolean hasMoved = false;
  bool hasWaitedShotgun = new bool(false);
  boolean hasShotgunned = false;
  bool hasWaitedRightclick = new bool(false);
  boolean hasRightclicked = false;
  bool hasWaitedRocketlauncher  = new bool(false);
  boolean hasRocketlaunched = false;
  bool hasWaitedgoKill  = new bool(false);
  boolean waitActive = false;
  
  boolean doTutorial;
        
  Tutorial(int difficultyInput,Camera camInput, Map mapInput){
    doTutorial = difficultyInput==-1;
    cam = camInput;
    map = mapInput;
    updateCoords();
  }
  
  public void doThings(boolean[] keyspressed){
    if(!doTutorial){return;}
    updateCoords();
    switch(step){
      case 0 : 
        checkIfStart();
        return;
      case 1 : 
        moving(keyspressed);
        return;
      case 2 : 
        shotgun(keyspressed);
        return;
      case 3 : 
        rightClick(keyspressed);
        return;
      case 4 : 
        rocketLauncher(keyspressed);
        return;
      case 5 : 
        goKill();
        return;
      case 6 : 
        return;
      default : return;   
    } 
  }  
   
  private void updateCoords(){
    xCoord = cam.x + 500;
    yCoord = cam.y - 300;
    
  }
    
  private void checkIfStart(){
     if(map.timeRemaining() <  19900){step++;}
  }
  
  private void moving(boolean[] keyspressed){
    textSize(50);
    fill(255);
    text("Press\nW\nA S D\nto move",xCoord,yCoord); 

    if(!hasMoved){
      if(keyspressed[0]||keyspressed[1]||keyspressed[2]||keyspressed[3]){hasMoved = true;}
      else{return;}
    }
    if(wait(100,hasWaitedMoving)){step++;}
  }
  
  private void shotgun(boolean[] keyspressed){
    textSize(50);
    fill(255);
    text("Use left-click to fire your shotgun",xCoord,yCoord);
    if(!hasShotgunned){
      if(keyspressed[6]){hasShotgunned = true;}
      else{return;}
    }
    if(wait(100,hasWaitedShotgun)){step++;}    
  }
  private void rightClick(boolean[] keyspressed){
    textSize(50);
    fill(255);
    text("Use right-click to dash",xCoord,yCoord); 
    if(!hasRightclicked){
      if(keyspressed[5]){hasRightclicked = true;}
      else{return;}
    }
    if(wait(100,hasWaitedRightclick)){step++;}        
  }
  private void rocketLauncher(boolean[] keyspressed){
    textSize(50);
    fill(255);
    text("While dashing, you hurt enemies instead of enemies hurting you\nPress e to fire your rocket launcher",xCoord,yCoord); 
    if(!hasRocketlaunched){
      if(keyspressed[7]){hasRocketlaunched = true;}
      else{return;}
    }
    if(wait(200,hasWaitedRocketlauncher)){step++;}        
  }
  private void goKill(){
    textSize(50);
    fill(255);
    text("Thats all the controls\nDestroy those red boid replicators!\nGood luck soldier",xCoord,yCoord); 
    if(!wait(500,hasWaitedMoving)){return;}
    map.userInterface.setMissionInfoActive();
    step++; 
  }
  
  private boolean wait(int ticks, bool hasWaited){
    if(waitActive){
      if(tick - waitStartTick > ticks){
        hasWaited.setValue(true);
        waitActive = false;
        return true;
      }
      return false;
    }
    waitActive = true;
    waitStartTick = tick;
    return false;
  }
  
  
  
  
}
