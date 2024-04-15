class Projectile {
 
  float xmom,ymom;
  long createTick;
  long duration;
  int radius;
  int damage;
  Colour colour;
  float velocity;
  Coordinate position;
  boolean shouldDestroy = false;
  boolean dieOnHit;
  Player player;

  
  Projectile(Coordinate positionInput, Player playerInput, int radiusInput, int durationInput, float velocityInput, int damageInput, Colour colourInput, boolean dieOnHitInput ,  float spread ) {
     player = playerInput;
     dieOnHit = dieOnHitInput;
     colour = colourInput;
     damage = damageInput;
     createTick = tick;
     duration = durationInput;
     velocity = velocityInput;
     position = new Coordinate(positionInput.xGet(),positionInput.yGet());
     radius = radiusInput;
     setDirection(spread);
  }
  
  public Coordinate getPosition(){return position;}
  
  private void render(){
     fill(colour.r, colour.g, colour.b);
     circle(position.xGet(),position.yGet(),radius);
  }
  
  public void doThings(ArrayList<Collideable> allObjects){
    move();
    checkCollisions(allObjects);
    checkTimeOut();
    //render();
  }
  
  private void checkCollisions(ArrayList<Collideable> allObjects){
     for(Collideable object : allObjects){
       float sqrDistanceBetween = sqrDistanceBetween(object);
       if(sqrDistanceBetween < (object.getRadius() + radius)*(object.getRadius() + radius)){
         object.dealDamage(damage);
         if(dieOnHit){shouldDestroy = true;}
         object.alertGroup();
       }
     }
  }
  
  private float sqrDistanceBetween(Collideable object){
   return (object.xGet() - position.xGet())*(object.xGet() - position.xGet()) + (object.yGet() - position.yGet())*(object.yGet() - position.yGet());
  }
  
  private void checkTimeOut(){if(tick - createTick > duration){shouldDestroy = true;}}
  
  private void setDirection(float spread){
    if(velocity==0){xmom=0;ymom=0;return;}
     xmom = (mouseX  -(width/2));
     ymom = (mouseY  -(height/2));    
     if(spread != 0){modifySpread(spread);}
     float deltaMagnitude = sqrt(xmom*xmom + ymom*ymom);
     xmom = velocity * xmom/deltaMagnitude;
     ymom = velocity * ymom/deltaMagnitude;
  }
  
  private void modifySpread(float spread){
    float distance = distanceFromPlayer();
    println(distance);
    xmom+= (rand.nextInt()%spread) * distance/100;
    ymom+= (rand.nextInt()%spread) * distance/100;
  }
  
  private float distanceFromPlayer(){
     float xPlayer = player.xGet();
     float yPlayer = player.yGet();
     return sqrt( (xmom - xPlayer + cam.x)*(xmom - xPlayer + cam.x) + (ymom - yPlayer + cam.y)*(ymom - yPlayer + cam.y));   
  }
  
  public boolean shouldRemove(){return shouldDestroy;}
  
  void move(){
    position.move(xmom,ymom);
  }
  
}
