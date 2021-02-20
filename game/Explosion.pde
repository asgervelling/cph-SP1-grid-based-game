class Explosion {
    int x, y;
    ArrayList<Particle> particles;
    boolean triggered;
    int numParticles;
    
    Explosion() {
        this.x = 0;
        this.y = 0;
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
    
    void setXY(int x, int y) {
        this.x = x;
        this.y = y;
    }
    
    void trigger(int x, int y) {
        // Load...
        this.setXY(x, y);
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
        
        // Fire!
        this.triggered = true;
    }
}
