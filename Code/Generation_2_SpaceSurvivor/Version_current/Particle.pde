class Particle {
  PVector particlePos;  
  PVector particleVel;
  PVector acceleration;
  float duration;
  
  Particle(PVector vector) {
     acceleration = new PVector(0, 0.5);
     particleVel = new PVector(random(-1, 1), random(-2, 0));
     particlePos = vector.copy();
     duration = 100;
  }
  
  void run() {
    println("Making particles");
     update();
     display();
  }
  
  void update() {
     particleVel.add(acceleration);
     particlePos.add(particleVel);
     duration -= 1.0;
  }
  
  void display() {
     stroke(255, duration);
     fill(255, duration);
     ellipse(particlePos.x, particlePos.y, 5, 5);
  }
  
  boolean shouldDestroy() {
     if (duration <= 0.0) {
       return true;
     }
     else {
       return false;
     }
  }
  
}
