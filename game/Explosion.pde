class Explosion {
    int x, y;
    ArrayList<Particle> particles;
    boolean triggered;
    int numParticles;
    
    Explosion(int x, int y) {
        this.x = x;
        this.y = y;
        this.particles = new ArrayList<Particle>();
        this.triggered = false;
        this.numParticles = 12;
    }
    
    void update() {
        if (!triggered) {
            return;
        }
        for (int i = 0; i < this.particles.size(); i++) {
            particles.get(i).update();
        }
    }
    
    void display() {
        if (!triggered) {
            return;
        }
        for (int i = 0; i < this.particles.size(); i++) {
            particles.get(i).display();
        }
    }
    
    void trigger() {
        // Load...
        int w = 4;
        int h = 4;
        float[] xRange = {0f, (float)this.numParticles};
        float[] translatedXRange = {-1f, 1f};
        float[] yRange = {0f, (float)this.numParticles};
        float[] translatedYRange = {-2.5, -1f};
        for (int i = 0; i < this.numParticles; i++) {
            float initialVelX = translateToRange((float)i, xRange, translatedXRange) + random(-1.5, 1.5);
            float initialVelY = translateToRange((float)i, yRange, translatedYRange) + random(-0.5, 0.5);
            particles.add(new Particle(x, y, w, h, initialVelX, initialVelY));
        }
        println("Explosion at " + this.x, this.y + "\n");
        
        // Fire!
        this.triggered = true;
    }
}
