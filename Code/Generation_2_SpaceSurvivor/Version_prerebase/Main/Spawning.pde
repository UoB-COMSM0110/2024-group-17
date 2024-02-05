class Spawning{
  long pspawn;
  int spawncd;
  
  
  
  Spawning(){ 
    pspawn = 0;
    spawncd = 100;
  }
  
  
  void randspawn(Player p1, ArrayList<Enemy> enemylist){

    if(tick-pspawn > spawncd){
      
       spawncd = management.currentlevel.morespawns;
       int r =abs(rand.nextInt())%4;
  //     println(r);
       int x = 0;
       int y = 0;
       switch(r){
         case 0:
           x = (rand.nextInt()%1500 - 750) * 4;
           y = -600*4;
           break;
         case 1:
           x = -800*4;
           y = (rand.nextInt()%1000 - 500)* 4;
           break;
         case 2:
           x = (rand.nextInt()%1500-750)*4;
           y = 600*4;
           break;
           case 3:
           x = 800*4;
           y = (rand.nextInt()%1000-500)*4;
           break;
       }
 //      println(x,y);
       enemylist.add(new Enemy((int)(p1.x+x),(int)(p1.y+y),p1,management ));
  //     println(" A new Challenger approaches");
       pspawn = tick;
    }
  }
  
  void addenemy(ArrayList<Enemy> enemylist, int x, int y){
     enemylist.add(new Enemy(x,y,p1,management));
     
  }
 /* 
  void firstspawn(ArrayList<Enemy> enemylist){
    int dist = 2500;
    for(int i=0; i< 9; i++){
      enemylist.add(new Enemy(0,dist*i,p1));
    }
    for(int i=0; i< 9; i++){
      enemylist.add(new Enemy(dist*i,0,p1));
    }
    for(int i=0; i< 9; i++){
      enemylist.add(new Enemy(dist*i,dist*10,p1));
    }  
    for(int i=0; i< 9; i++){
      enemylist.add(new Enemy(dist*10,dist*i,p1));
    }  
  }
 */
 
}
