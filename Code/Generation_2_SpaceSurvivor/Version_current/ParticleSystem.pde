class ParticleSystem {
   ArrayList<Particle> particles;
   PVector position;
   
   ParticleSystem(PVector location) {
      position = location.copy();
      particles = new ArrayList<Particle>();
   }
   
   void makeParticle() {
      particles.add(new Particle(position)); 
   }
   
   void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.shouldDestroy()) {
        particles.remove(i);
      }
    }
  }
 
 }
