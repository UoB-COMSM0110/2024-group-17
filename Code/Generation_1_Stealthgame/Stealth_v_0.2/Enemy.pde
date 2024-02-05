class Enemy{
  int x;
  int y;
  int w;
  int h;
  int speed;
  long ptick;
  boolean shouldRemove;
  //movement path
  
  Enemy(int startingX, int startingY){
   x = startingX;
   y = startingY;  
   w = 20;
   h = 20;
   speed = 3;
   ptick=0;
   shouldRemove = false;
  }
  
  void render(){
    rect(x,y,w,h);
  }
  
  void move(){
    float change = (tick-ptick)*speed/2;
    ptick = tick;
    x+=change;
  }
  
//Still only works for if the player is smaller than the object, we need to make another one for if the object is smaller. 
  void playercollision(Player p1){
    boolean ain = p1.x>=x && p1.x<=x+w && p1.y>=y && p1.y<=y+h;
    boolean bin = p1.x+p1.w>=x && p1.x+p1.w<=x+w && p1.y>y && p1.y<=y+h;
    boolean cin = p1.x>=x && p1.x<=x+w && p1.y+p1.h>=y && p1.y+p1.h<=y+h;
    boolean din = p1.x+p1.w>=x && p1.x+p1.w<=x+w && p1.y+p1.h>=y && p1.y+p1.h<=y+h;
    if(!(ain||bin||cin||din)){
      return;
    }
    if(p1.rolling){
      shouldRemove = true;
      return;
    }
    if(ain&&bin){
      p1.canmoveU = false;
      p1.y = y + h;
      return;
    }
    if(ain&&cin){
      p1.canmoveL = false;
      p1.x = x + w;
      return;
    }
    if(bin&&din){
      p1.canmoveR = false;
      p1.x = x -p1.w;
      return;
    }
    if(cin&&din){
      p1.canmoveD = false;
      p1.y = y-p1.h;
      return;
    }
    if(ain){
      if(p1.x-x+h>p1.y-y+w){
        p1.canmoveL = false;
        p1.x = x + w;    
      return;
      }
      else{
        p1.canmoveU = false;
        p1.y = y + h;
        return;
      }
    }
    if(bin){
      if(p1.x+p1.w-x>y+h-p1.y){
        p1.canmoveU = false;
        p1.y = y + h;    
        return;
      }
      else{
        p1.canmoveR = false;
        p1.x  = x -p1.w;
        return;
      }
    }
    if(cin){
      if(x+w-p1.x<p1.y-y+p1.h){
        p1.canmoveL = false;
        p1.x = x + w;    
        return;
      }
      else{
        p1.canmoveD = false;
        p1.y = y-p1.h;
        return;
      }
    }
    if(din){
      if(p1.x-x+p1.w>p1.y-y+p1.h){
        p1.canmoveD = false;
        p1.y = y - p1.h;    
        return;
      }
      else{
        p1.canmoveR = false;
        p1.x = x-p1.w;
        return;
      }
    }
  }
}
