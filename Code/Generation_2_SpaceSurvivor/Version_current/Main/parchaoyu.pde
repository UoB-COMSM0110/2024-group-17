// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class parchaoyu {
  ArrayList<parc> particles;
  PVector origin;

  parchaoyu(PVector position) {
    origin = position.copy();
    particles = new ArrayList<parc>();
  }

  void addParticle() {
    particles.add(new parc(origin));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      parc p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
