class rocket{
  int r;
  int MAXdist = 600;
  int boom_time;
  boolean bm=false;
  int cdtime = 200;
  long startTick;
  
  float x;
  float y;
  float mousex;
  float mousey;
  float startx;
  float starty;
  
  PImage rocketImage;
  PImage exploImage;
  
  rocket(float inpmousex, float inpmousey, float inpstartx,float inpstarty,PImage weaponrocket,PImage explo){
    startTick = tick;
    rocketImage = weaponrocket;
    exploImage = explo;
    mousex = inpmousex;
    mousey = inpmousey;
    startx = inpstartx;
    starty = inpstarty;
    x = inpstartx;
    y = inpstarty;
    r=25;
  }
  
  void move(){
    x += (mousex - x)*10;
    y += (mousey - y)*10;
  }
  
  void render(){
    image(rocketImage,x,y);
  }
  
  void Explode(){
    image(exploImage,x,y);
  }
  
  void checkBoom(){
    boomTime();
     if(sqrt(sq(startx-x)+sq(starty-y))>MAXdist||bm){
       Explode();
       boom_time=millis();
       r= 200;
     }
  }
  
  void boomTime(){
    long nowTick=tick;
    if (nowTick - startTick>=cdtime){
       bm = true;
    }
  }
}
