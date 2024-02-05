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
       int x,y, r =abs(rand.nextInt())%4;
       switch(r){
         case 0:
           x = (rand.nextInt()%1500 - 750);
           y = -600;
           break;
         case 1:
           x = -800;
           y = (rand.nextInt()%1000 - 500);
           break;
         case 2:
           x = (rand.nextInt()%1500-750);
           y = 600;
           break;
           case 3:
           x = 800;
           y = (rand.nextInt()%1000-500);
           break;
       }
       enemylist.add(new Enemy((int)(p1.x+x),(int)(p1.y+y),p1,management ));
       pspawn = tick;
    }
  }
  
  void addenemy(ArrayList<Enemy> enemylist, int x, int y){
     enemylist.add(new Enemy(x,y,p1,management));
     
  }
}
