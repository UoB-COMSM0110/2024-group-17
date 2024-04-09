class Player{
  //Player characteristics
  float health = 100;
  int points = 0;
  Coordinate position;
  float r = 25;
  float control = 1;
  float xmom = 0.0;
  float ymom = 0.0;
  long ptick = 0;
  long previousTick= tick;
  
  //Damage cooldowns
  boolean vuln = false;
  long dTick;
  
  //Attack attributes
  boolean bAoncd = false;
  boolean attacking = true;
  int bAcd;
  long aTick;
  int bAlen;
  
  PImage player = loadImage("player_ufo.png");
  
  int knockbackCD=500;
  int knockbackMag=-2;
  int knockbackTime=50;
  long knockbackTriggerTime=0;
  boolean knockbackOnCD = false;
  boolean knockbackActive = false;
  
  Weapons weaponSystem;
  UI userInterface;
  
  Player(float startingX, float startingY,ArrayList<Collideable> allObjects,Camera cam){
    position = new Coordinate(startingX, startingY);
    weaponSystem = new Weapons(this,allObjects);
    userInterface = new UI(this,cam);
    player.resize(50,50);
    previousTick = tick;
    aTick = 0;
    bAcd = 75;
    bAlen = 20;
  }
  
  public void doThings(boolean[] keyspressed){
    updatecds();
    move(keyspressed);
    weaponSystem.doThings(keyspressed,position);
    if(keyspressed[5]){basicAttack();}
    userInterface.doThings();
    render();
  }
  
  public float xGet(){return position.xGet();}
  
  public float yGet(){return position.yGet();}  
  
  public float xmomGet(){return xmom;}
  
  public float ymomGet(){return ymom;}
  
  void render(){
    fill(255, 165, 0);
    image(player,position.xGet()-50,position.yGet()-50);
  }
  
  //Currently works frame to frame, need to switch over to tick based!
  void move(boolean[] keyspressed){
    position.move(xmom,ymom);
    if(true){
      if(keyspressed[0]){
        ymom -= control;
      }
      if(keyspressed[1]){
        xmom -= control;
      }
      if(keyspressed[2]){
        ymom += control;
      }
      if(keyspressed[3]){
        xmom += control;
      }
    }
    xmom = 0.9*xmom;
    ymom = 0.9*ymom;
    if(xmom<0.1 && xmom>-0.1){
      xmom = 0;
    }
    if(ymom<0.1 && ymom>-0.1){
      ymom = 0;
    }
    
   }
       
  void updatecds(){
     if(attacking){
       if(tick-aTick > bAlen){
         attacking = false;
         r = 25;
       }
     }
     if(health<100){
       println(tick,previousTick);
       health += ((float)(tick-previousTick))*0.05;
     }
     previousTick = tick;
  }
  
  public boolean isDead(){return health<=0;}
  
  void damaged(int dam){
    health-=dam;
    vuln = true;
    //dTick = tick;
  }
  
  void kill(int point){
    points += point;
  }
  
    
  void basicAttack(){
     if(tick -aTick < bAcd){return;}
      float mpx = (mouseX-(width/2))*2;
      float mpy = (mouseY-(height/2))*2;
      xmom = (mpx)/10;
      ymom = (mpy)/10;
      r = 100;
      aTick = tick;
      bAcd = 75;
      attacking = true;
  }
 
}
