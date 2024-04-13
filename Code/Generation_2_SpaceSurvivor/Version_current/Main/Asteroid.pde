public class Asteroid implements Collideable{
  private int radius;
  private int mapSize;
  private int health;
  private Coordinate position;
  private Random random = new Random();
  public boolean shouldDestroy = false;
  ArrayList<Collideable> allStructures;
  
  Asteroid(int mapSizeInput, ArrayList<Collideable> allStructuresInput){
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
    circle(position.xGet(),position.yGet(),radius); 
  }
  
  public void alertGroup(){}
  
  public int getRadius(){return radius;}
  
  public float xGet(){return position.xGet();}
  
  public float yGet(){return position.yGet();} 
  
  public Coordinate getPosition(){return position;}

  
}
