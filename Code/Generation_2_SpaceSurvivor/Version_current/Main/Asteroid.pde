public class Asteroid implements Collideable{
  private int radius;
  private int mapSize;
  private float scale;
  private Coordinate position;
  private Random random = new Random();
  
  Asteroid(int mapSizeInput){
    mapSize = mapSizeInput;
    initializeRandom();
   
  }
  
  public void doThings(){
    render();
    
  }
  
  private void initializeRandom(){
    radius = random.nextInt()%300 + 100;
    position = new Coordinate(0,0);
    position.setRandomOnCircle(mapSize);
    
  }
  
  private void render(){
    fill(100);
    circle(position.xGet(),position.yGet(),radius); 
  }
  
  public int getRadius(){return radius;}
  
  public float xGet(){return position.xGet();}
  
  public float yGet(){return position.yGet();}
  
}
