// A simple Particle class

class parc{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  parc(PVector l) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-4, 4), random(-4, 4));
    position = l.copy();
    lifespan = 50.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    stroke(255, lifespan);
    fill(255, lifespan);
    ellipse(position.x, position.y, 8, 8);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
