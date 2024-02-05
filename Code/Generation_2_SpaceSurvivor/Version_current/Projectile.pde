class Projectile {
 
  PVector direction;
  int duration;
  int w, h;
  int originX, originY;
  boolean shouldDestroy;
  
  Projectile(int x, int y, PVector mouseVector) {
     direction = mouseVector.copy();
     originX = x;
     originY = y;
     w = 10;
     h = 10;
     duration = 1000;
     shouldDestroy = false;
  }
  
  void move() {
     originX = originX + (int)(direction.x / 30);
     originY = originY + (int)(direction.y / 30);
     duration -= 1;
    if (duration <= 0) {
       shouldDestroy = true; 
    }
  }
  
}
