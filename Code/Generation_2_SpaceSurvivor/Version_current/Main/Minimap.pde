class Minimap{
  ArrayList<Coordinate> replicatorPositions = new ArrayList<>();
  ArrayList<Replicator> replicators;
  Player player;
  float mapSize;
  int minimapSize = 150;
  Map map;
  
  boolean hasPressedTab = false;
  
  Minimap(ArrayList<Replicator> replicatorsInput, Player playerInput,int mapSizeInput, Map mapInput){
    map = mapInput;
    replicators = replicatorsInput;
    player = playerInput;
    mapSize = (float) mapSizeInput;
    setCoordinates();
  }
  
  private void setCoordinates(){
    for(Replicator replicator : replicators){
      if(!replicator.isDestroyed){
        float x = minimapSize * replicator.xGet() / mapSize - 1125;
        float y = minimapSize * replicator.yGet() / mapSize - 875;
        replicatorPositions.add(new Coordinate(x,y));
      }
    }
  }
  
  private void translateCoordinates(boolean isTab){
    for(int i = 0 ; i<replicators.size();i++){
      Replicator replicator = replicators.get(i);
      if(!replicator.isDestroyed){
        if(!isTab){
          minimapSize = 100;
          float x = minimapSize * replicator.xGet() / mapSize - 1125;
          float y = minimapSize * replicator.yGet() / mapSize - 875;
          replicatorPositions.set(i,new Coordinate(x,y));
        }else{
          minimapSize = 200;
          float x = minimapSize * replicator.xGet() / mapSize - 1025;
          float y = minimapSize * replicator.yGet() / mapSize - 775;
          replicatorPositions.set(i,new Coordinate(x,y));
        }
        
      }else{replicatorPositions.get(i).setNotDraw();}
    }
  }
  
  
  public void drawMap(boolean isTab){
    hasPressedTab = hasPressedTab||isTab;
    translateCoordinates(isTab);
    if(!isTab){
      tint(255, 127);
      fill(40);
      circle(cam.x - 1125 , cam.y - 875,minimapSize+10);
      fill(255,0,0);
      for(Coordinate position : replicatorPositions){
        if(position.shouldDraw()){
          circle(cam.x + position.xGet(), cam.y + position.yGet(), 10);
        }
      }
      fill(255);
      circle(cam.x + minimapSize *player.xGet()/mapSize - 1125, cam.y + minimapSize * player.yGet()/mapSize - 875 , 5);
      fill(255,0,255);
      if(map.gateway.getPortalStatus()){ circle(cam.x -1125, cam.y-875,8);}
      fill(255);
      line(cam.x - 1275,cam.y-875,cam.x-975,cam.y-875);
      line(cam.x - 1125,cam.y-725,cam.x-1125,cam.y-1025); 
      tint(255, 255);
    }
    else{
      fill(40);
      circle(cam.x - 1025 , cam.y - 775,minimapSize+20);
      fill(255,0,0);
      for(Coordinate position : replicatorPositions){
        if(position.shouldDraw()){
          circle(cam.x + position.xGet(), cam.y + position.yGet(), 20);
        }
      }
      fill(255);
      circle(cam.x + minimapSize *player.xGet()/mapSize - 1025, cam.y + minimapSize * player.yGet()/mapSize - 775 , 10);
      fill(255,0,255);
      if(map.gateway.getPortalStatus()){ circle(cam.x -1025, cam.y-775,16);}
      fill(255);
      line(cam.x - 1275,cam.y-775,cam.x-775,cam.y-775);
      line(cam.x - 1025,cam.y-525,cam.x-1025,cam.y-1025); 
    }
    stroke(255);
    if(!hasPressedTab){writeToolTip();}
  }
  
  private void writeToolTip(){
    textSize(30);
    fill(255);
    text("Press TAB to enlarge", cam.x-1125,cam.y - 740);
    
    
  }
}  
