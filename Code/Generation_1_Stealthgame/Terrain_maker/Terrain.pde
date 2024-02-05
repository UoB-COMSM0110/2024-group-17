class Terrain{
  int x;
  int y;
  int size;
  int colR, colG, colB;
  
  Terrain(int startingX, int startingY, int incolR, int incolG, int incolB,int nsize){
    x = startingX;
    y = startingY;
    colR = incolR;
    colG = incolG;
    colB = incolB;
    size = nsize;
  }
  void render(){
    fill(colR,colG,colB);
    rect(x,y,size,size,0);
  }
  
}
