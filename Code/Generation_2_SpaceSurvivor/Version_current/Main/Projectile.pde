class Projectile {
 
  float xmom,ymom;
  long createTick;
  long duration;
  int radius;
  int velocity;
  Coordinate position;
  boolean shouldDestroy = false;
  
  Projectile(Coordinate positionInput, int radiusInput, int durationInput, int velocityInput) {
     createTick = tick;
     duration = durationInput;
     velocity = velocityInput;
     position = new Coordinate(positionInput.xGet(),positionInput.yGet());
     radius = radiusInput;
     setDirection();
  }
  
  public Coordinate getPosition(){return position;}
  
  private void render(){
     circle(position.xGet(),position.yGet(),radius);
  }
  
  public void doThings(){
    move(); 
    checkCollisions();
    checkTimeOut();
    render();
  }
  
  private void checkCollisions(){

  }
  
  private void checkTimeOut(){if(tick - createTick > duration){shouldDestroy = true;}}
  
  private void setDirection(){
     xmom = (mouseX-(width/2))*velocity;
     ymom = (mouseY-(height/2))*velocity;    
     float deltaMagnitude = sqrt(xmom*xmom + ymom*ymom);
     xmom = velocity * xmom/deltaMagnitude;
     ymom = velocity * ymom/deltaMagnitude;
  }
  
  public boolean shouldRemove(){return shouldDestroy;}
  
  void move() {
    position.move(xmom,ymom);
  }
  
}
