class Backtile{
  int x;
  int y;
  int size;
  PImage image;
  
  Backtile(int sx,int sy,PImage simage,int ssize){
    x = sx;
    y = sy;
    size = ssize;
    image = simage;
  }
  
  
  void render(){
    image(image,x,y);
  }
  
}
