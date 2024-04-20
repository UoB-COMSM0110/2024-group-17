public class Asteroid implements Collideable{
  private int radius;
  private int lastUsedRadius = 0;
  private int mapSize;
  private int health;
  private Coordinate position;
  private Random random = new Random();
  public boolean shouldDestroy = false;
  ArrayList<Collideable> allStructures;
  PImage asteroidImage;
  
  Asteroid(int mapSizeInput, ArrayList<Collideable> allStructuresInput){
    asteroidImage = loadImage("data/asteroidwithmap.png");
    allStructures = allStructuresInput;
    mapSize = mapSizeInput;
    initializeRandom();
  }
  
  public void dealDamage(int damage){
    health-=damage;
    if(health<=0){shouldDestroy = true;}
  }
  
  public void doThings(){
    render();
  }
  
  private void initializeRandom(){
    radius = random.nextInt()%300 + 100;
    health = radius * 10;
    position = new Coordinate(0,0);
   
    position.setRandomOnCircle(mapSize);
    while(!uniquePosition()){
        position.setRandomOnCircle(mapSize);
    }
  }
  
  private void updateImageSize() {
     if (radius != lastUsedRadius && radius >0) {
       int diameter = radius * 2;
       asteroidImage.resize(diameter, diameter);
       lastUsedRadius = radius; // Update lastUsedRadius after resizing
     }
  }
  
  public boolean uniquePosition(){
    for(Collideable structure : allStructures){
      float sqrDistanceBetween = sqrDistanceBetween(structure.getPosition());
      if( sqrDistanceBetween < (structure.getRadius() + radius)*(structure.getRadius() + radius)){    
        return false;
      }
    }
    if(sqrDistanceBetween(new Coordinate(0,0))< 5000000){return false;}
    return true;
  }
  
  private float sqrDistanceBetween(Coordinate otherPosition){
    return (otherPosition.xGet() - position.xGet())*(otherPosition.xGet() - position.xGet()) + (otherPosition.yGet() - position.yGet())*(otherPosition.yGet() - position.yGet());
  }  

  public void render(){
    fill(100);
    updateImageSize();
    //imageMode(CENTER);
    //float imageX = position.xGet() - asteroidImage.width / 2;
    //float imageY = position.yGet() - asteroidImage.height / 2;
    circle(position.xGet(),position.yGet(),radius); 
    image(asteroidImage, position.xGet() - radius - 10, position.yGet() - radius - 10, radius * 2.1, radius * 2.1);
  }
  
  public void alertGroup(){}
  
  public int getRadius(){return radius;}
  
  public float xGet(){return position.xGet();}
  
  public float yGet(){return position.yGet();} 
  
  public Coordinate getPosition(){return position;}

  
}
