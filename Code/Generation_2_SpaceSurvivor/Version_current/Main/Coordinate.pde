public class Coordinate{
  private float x;
  private float y;
  private Random random = new Random();
  private boolean shouldDraw = true;
  
  Coordinate(float xInput, float yInput){
    x = xInput;
    y = yInput;
  }
   
  public float xGet(){return x;}
  
  public float yGet(){return y;}
  
  public void setPosition(float xInput, float yInput){
    x = xInput;
    y = yInput;
  }
  
  public void move(float xDelta, float yDelta){
    x+=xDelta;
    y+=yDelta;
  }
  
  public void setRandomOnCircle(int mapSize){
    float r = random.nextInt() % mapSize;
    float theta = (random.nextInt()%314)/100;
    x = r * sin(theta);
    y = r * cos(theta);
    println(x,y);
  }
  
  public void randomModify(float spread){
    x += random.nextInt() % spread;
    y += random.nextInt() % spread;
    
    
  }
  
  public void setNotDraw(){shouldDraw = false;}
  public boolean shouldDraw(){return shouldDraw;}
}
