class Player{
  float x; 
  float y;
  float w;
  float h;
  float speed;
 
  Player(float startingX, float startingY){
    x = startingX;
    y = startingY;
    speed = 2;
  }
  
  void render(){
    rect(x,y,10,10); 
  }
  
  void move(boolean[] keyspressed){
    float change = speed;
    if(keyspressed[0]){
      y-=change;
    }
    if(keyspressed[1]){
      x-=change;
    }
    if(keyspressed[2]){
      y+=change;
    }
    if(keyspressed[3]){
      x+=change; 
    }
  }
}
