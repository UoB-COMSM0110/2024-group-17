class Camera{
  float x;
  float y;
  int speed;
  
  Camera(float startingx, float startingy){
    x = startingx;
    y = startingy;
  }
  
  void move(float px, float py){
    float delx = x-px;
    float dely = y-py;
    
    x-=delx/4;
    y-=dely/4;
  }
}
