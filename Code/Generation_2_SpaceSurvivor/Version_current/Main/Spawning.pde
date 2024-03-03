 class Spawning{
  long pspawn;
  int spawncd;
  int groupSizeIndex;
  boolean GroupSet = false;
  int x,y,r;
  
  Spawning(){ 
    pspawn = 0;
    spawncd = 10;
    groupSizeIndex = 3;
  }
  
  void randspawn(Player p1){
    if(tick-pspawn > spawncd){
       //spawncd = management.currentlevel.morespawns;

       if(!GroupSet){
         x=0;
         y=0;
         r =abs(rand.nextInt())%12;
         switch(r){
           case 0:
             x = (rand.nextInt()%1280 - 2560);
             y = (rand.nextInt()%1280 - 2560);
             break;
           case 1:
             x = (rand.nextInt()%1280 - 2560);
             y = (rand.nextInt()%1280 - 1280);
             break;
           case 2:
             x = (rand.nextInt()%1280 - 2560);
             y = (rand.nextInt()%1280);
             break;
           case 3:
             x = (rand.nextInt()%1280 - 2560);
             y = (rand.nextInt()%1280 + 1024);
             break;
           case 4:
             x = (rand.nextInt()%1280 - 1024);
             y = (rand.nextInt()%1280 - 2560);
             break;
           case 5:
             x = (rand.nextInt()%1280 - 1024);
             y = (rand.nextInt()%1280 + 1024);
             break;
           case 6:
             x = (rand.nextInt()%1280);
             y = (rand.nextInt()%1280 - 2560);
             break;
           case 7:
             x = (rand.nextInt()%1280);
             y = (rand.nextInt()%1280 + 2560);
             break;
           case 8:
             x = (rand.nextInt()%524 + 1524);
             y = (rand.nextInt()%1280 - 2560);
             break;
           case 9:
             x = (rand.nextInt()%524 + 1524);
             y = (rand.nextInt()%1280 - 1280);
             break;
           case 10:
             x = (rand.nextInt()%524 + 1524);
             y = (rand.nextInt()%1280);
             break;
           case 11:
             x = (rand.nextInt()%524 + 1524);
             y = (rand.nextInt()%1024 + 2560);
             break;
         }
         if(r>=5){
           r+=2;
         }
         if(r>=9){
           r+=2;
         }
         GroupSet = true;
       }
       
       float offset = (int)rand.nextInt()%10 - 5 ;
       EnemyList.add(new Enemy((p1.x+x+offset),(p1.y+y+offset),p1,management));
       
       if(groupSizeIndex-- < 0){
         GroupSet = false;
         pspawn = tick;
         groupSizeIndex = rand.nextInt()%18 + 2;
       }
    }
  }
  
}
