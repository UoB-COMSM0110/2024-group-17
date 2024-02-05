class Enemy{
  int x;
  int y;
  int r;
  int speed;
  long ptick;
  boolean shouldRemove;
  //movement path
  
  Enemy(int startingX, int startingY){
   x = startingX;
   y = startingY;  
   r = 500;
   speed = 3;
   ptick=0;
   shouldRemove = false;
  }
  
  void render(){
    ellipse(x,y,r,r);
  }
  
  void move(){
    float change = (tick-ptick)*speed/2;
    ptick = tick;
    x+=change;
  }
  
//Still only works for if the player is smaller than the object, we need to make another one for if the object is smaller. 
  void collideTest(Player p1){
    float delx = x-p1.x;
    float dely = y-p1.y;
    float dist  = abs(delx) + abs(dely);
    if(dist < (r + p1.r)*(r+p1.r)){
      //Collision detected
      p1.xmom -= delx;
      p1.ymom -= dely;
    }
  }
}
