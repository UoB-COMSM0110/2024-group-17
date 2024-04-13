class Player{
  float health = 100;
  int points = 0;
  Coordinate position;
  float radius = 25;
  float control = 1;
  float xmom = 0.0;
  float ymom = 0.0;
  long ptick = 0;
  long previousTick= tick;

  boolean vuln = true;
  long dTick;

  boolean bAoncd = false;
  boolean attacking = true;
  int bAcd;
  long aTick;
  int bAlen;
  
  ArrayList<Collideable> allStructures;
  
  PImage player = loadImage("player_ufo.png");
  
  double[] trailX = new double[15];
  double[] trailY = new double[15];
  
  Weapons weaponSystem;
  
  Player(float startingX, float startingY,ArrayList<Collideable> allObjects,ArrayList<Collideable> allStructuresInput){
    allStructures = allStructuresInput;
    position = new Coordinate(startingX, startingY);
    weaponSystem = new Weapons(this,allObjects);
    player.resize(50,50);
    previousTick = tick;
    aTick = 0;
    bAcd = 100;
    bAlen = 20;
  }
  
  public void doThings(boolean[] keyspressed){
    cam.move(position.xGet(),position.yGet());
    updatecds();
    move(keyspressed);
    checkStructureCollision();
    updateTrail();
    drawTrail();
    weaponSystem.doThings(keyspressed,position);
    if(keyspressed[5]){basicAttack();}
    render();
  }
  
  public float xGet(){return position.xGet();}
  
  public float yGet(){return position.yGet();}  
  
  public float xmomGet(){return xmom;}
  
  public float ymomGet(){return ymom;}
  
  public float getRadius(){return radius;}
  
  public Coordinate getPosition(){return position;}
  
  public void getPoints(int pointsIncrease){points+=pointsIncrease;}
  
  public float getSpeed(){return sqrt(xmom*xmom + ymom*ymom);}
  
  void render(){
    weaponSystem.justDrawThings();
    fill(255, 165, 0);
    image(player,position.xGet()-radius,position.yGet()-radius);
  }
  
  void updateTrail() {
    for (int i = trailX.length - 1; i > 0; i--) {
      trailX[i] = trailX[i - 1];
      trailY[i] = trailY[i - 1];
    }
    trailX[0] = position.xGet();
    trailY[0] = position.yGet() + 20;
  }

  void drawTrail() {
    for (int i = 1; i < 15; i++) {
      fill(255, 165, 0);
      stroke(255, 165, 0);
      ellipse((int)trailX[i], (int)trailY[i], 15 - i, 15 - i);
      stroke(255);
    }
  }
  
  //Currently works frame to frame, need to switch over to tick based!
  void move(boolean[] keyspressed){
    position.move(xmom,ymom);
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
     if(attacking && tick-aTick > bAlen){attacking = false;}
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
    playerDamageSound.play();
    //dTick = tick;
  }
  
  void kill(int point){
    points += point;
  }
  
  void basicAttack(){
     if(tick -aTick < bAcd){return;}
      float mpx = (mouseX-(width/2));
      float mpy = (mouseY-(height/2));
      float mpMag = sqrt(mpx*mpx + mpy*mpy);
      xmom = 75 * (mpx)/mpMag;
      ymom = 75 * (mpy)/mpMag;
      aTick = tick;
      bAcd = 75;
      attacking = true;
  }
  
    private void checkStructureCollision(){
    for(Collideable structure : allStructures){
      float sqrDistanceBetween = sqrDistanceBetween(structure);
      if( sqrDistanceBetween < (structure.getRadius() + radius)*(structure.getRadius() + radius)){
         float xNormalVector = structure.xGet() - position.xGet();
         float yNormalVector = structure.yGet() - position.yGet();
         float magnitudeNormalVector = sqrt(xNormalVector*xNormalVector+yNormalVector*yNormalVector);
         xNormalVector = xNormalVector/magnitudeNormalVector;
         yNormalVector = yNormalVector/magnitudeNormalVector;         
         xmom -= 10 * xNormalVector;
         ymom -= 10 * yNormalVector;
         bumpSound.play();
      }
    }
  }
  
  private float sqrDistanceBetween(Collideable object){
    return (object.xGet() - position.xGet())*(object.xGet() - position.xGet()) + (object.yGet() - position.yGet())*(object.yGet() - position.yGet());
  }
 
}
