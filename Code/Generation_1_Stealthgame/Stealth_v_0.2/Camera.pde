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
/*
    if(delx<3 && delx>-3){
      x = (float)px;
      y = (float)py;
      return;
    }
     if(dely<3 && dely>-3){
      x = (float)px;
      y = (float)py;
      return;
    }
*/
    x-=delx/4;
    y-=dely/4;
  }
}
