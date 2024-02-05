class BackManager{
 Backtile topleft;
 Backtile top;
 Backtile topright;
 Backtile left;
 Backtile mid;
 Backtile right;
 Backtile bottomleft;
 Backtile bottom;
 Backtile bottomright;
      
 int size;
 PImage image;
 int currentTx;
 int currentTy;
 
 
 BackManager(PImage simage){
   size = 2560;
   currentTx = 0;
   currentTy = 0;
   image = simage;
   firstadd();
 }
 
 void firstadd(){
   topleft = new Backtile(0-size,0-size,image,size);  
   top = new Backtile(0,0-size,image,size);
   topright = new Backtile(0+size,0-size,image,size);
   left = new Backtile(0-size,0,image,size); 
   mid = new Backtile(0,0,image,size);
   right = new Backtile(0+size,0,image,size); 
   bottomleft = new Backtile(0-size,0+size,image,size);  
   bottom = new Backtile(0,0+size,image,size);
   bottomright = new Backtile(0+size,0+size,image,size);
 }
  
  
 void renderall(){
   topleft.render();
   top.render();
   topright.render();
   left.render();
   mid.render();
   right.render();
   bottomleft.render();
   bottom.render();
   bottomright.render();
 }
 
 
 void isdiff(Player player){
   if(player.x>currentTx+size){
      shiftright();
   }
   else{
     if(player.x<currentTx){
       shiftleft();
     }
   }
   if(player.y>currentTy +size){
      shiftdown();
   }
   else{
     if(player.y<currentTy){
       shiftup();
     }
   }
 }
 
 void shiftright(){
   topleft = top;
   top = topright;
   topright =  new Backtile(currentTx+size+size,currentTy-size,image,size);
   left = mid;
   mid = right;
   right =  new Backtile(currentTx+size+size,currentTy,image,size);
   bottomleft = bottom;
   bottom = bottomright;
   bottomright =  new Backtile(currentTx+size+size,currentTy+size,image,size);
   currentTx = mid.x;
   currentTy = mid.y;
 }
 
 void shiftleft(){
   topright = top;
   top = topleft;
   topleft =  new Backtile(currentTx-size-size,currentTy-size,image,size);
   right= mid;
   mid = left;
   left = new Backtile(currentTx-size-size,currentTy,image,size);
   bottomright = bottom;
   bottom = bottomleft;
   bottomleft = new Backtile(currentTx-size-size,currentTy+size,image,size);
   currentTx = mid.x;
   currentTy = mid.y;
 }
 
 void shiftdown(){
   topleft = left;
   left = bottomleft;
   bottomleft =  new Backtile(currentTx-size,currentTy+size+size,image,size);
   top = mid;
   mid = bottom;
   bottom =  new Backtile(currentTx,currentTy+size+size,image,size);
   topright = right;
   right = bottomright;
   bottomright =  new Backtile(currentTx+size,currentTy+size+size,image,size);
   currentTx = mid.x;
   currentTy = mid.y;
 }
 
 void shiftup(){
   bottomleft = left;
   left = topleft;
   topleft =  new Backtile(currentTx-size,currentTy-size-size,image,size);
   bottom = mid;
   mid = top;
   top =  new Backtile(currentTx,currentTy-size-size,image,size);
   bottomright = right;
   right = topright;
   topright =  new Backtile(currentTx+size,currentTy-size-size,image,size);
   currentTx = mid.x;
   currentTy = mid.y;
  }
  
}
