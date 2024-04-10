class Minimap{
  ArrayList<Coordinate> replicatorPositions = new ArrayList<>();
  boolean isTab = false;
  Player player;
  float mapSize;
  int minimapSize = 100;
  
  Minimap(ArrayList<Replicator> replicators, Player playerInput,int mapSizeInput){
    player = playerInput;
    mapSize = (float) mapSizeInput;
    for(Replicator replicator : replicators){
       translateCoordinate(replicator); 
    }
  
  }
  
  private void translateCoordinate(Replicator replicator){
    float x = minimapSize * replicator.xGet() / mapSize - 1125;
    float y = minimapSize * replicator.yGet() / mapSize - 875;
    println("replicator position : ",x,y);
    replicatorPositions.add(new Coordinate(x,y));
  }
  
  
  public void drawMap(){
    if(!isTab){
      tint(255, 127);
      fill(40);
      circle(cam.x - 1125 , cam.y - 875,100);
      fill(255,0,0);
      for(Coordinate position : replicatorPositions){
        circle(cam.x + position.xGet(), cam.y + position.yGet(), 10);
      }
      fill(255);
      circle(cam.x + minimapSize *player.xGet()/mapSize - 1125, cam.y + minimapSize * player.yGet()/mapSize - 875 , 5);
    
      tint(255, 255);
    }
    else{
      
      
      
    }
  }
  
}
