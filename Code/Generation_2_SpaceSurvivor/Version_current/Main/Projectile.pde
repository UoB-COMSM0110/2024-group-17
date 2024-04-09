class Projectile {
 
  float xmom,ymom;
  long createTick;
  long duration;
  int radius;
  float damage;
  Colour colour;
  float velocity;
  Coordinate position;
  boolean shouldDestroy = false;
  boolean dieOnHit;
  
  Player player;
  
  Projectile(Coordinate positionInput, int radiusInput, int durationInput, float velocityInput, Player playerInput, float damageInput, Colour colourInput, boolean dieOnHitInput) {
     dieOnHit = dieOnHitInput;
     colour = colourInput;
     damage = damageInput;
     createTick = tick;
     player = playerInput;
     duration = durationInput;
     velocity = velocityInput;
     position = new Coordinate(positionInput.xGet(),positionInput.yGet());
     radius = radiusInput;
     setDirection();
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
    render();
  }
  
  private void checkCollisions(ArrayList<Collideable> allObjects){

  }
  
  private void checkTimeOut(){if(tick - createTick > duration){shouldDestroy = true;println("time to die");}}
  
  private void setDirection(){
    if(velocity==0){xmom=0;ymom=0;return;}
     xmom = (mouseX-(width/2))*velocity;
     ymom = (mouseY-(height/2))*velocity;    
     float deltaMagnitude = sqrt(xmom*xmom + ymom*ymom);
     xmom = velocity * xmom/deltaMagnitude + player.xmomGet();
     ymom = velocity * ymom/deltaMagnitude + player.ymomGet();
  }
  
  public boolean shouldRemove(){return shouldDestroy;}
  
  void move() {
    position.move(xmom,ymom);
  }
  
}
