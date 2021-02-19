class Particle {
    int x, y;
    int w, h;
    float initialVelX, initialVelY;
    float velX, velY;
    
    Particle(int x, int y, int w, int h, float initialVelX, float initialVelY) {
        this.x = x * tileSize;
        this.y = y * tileSize;
        this.w = w;
        this.h = h;
        this.initialVelX = initialVelX;
        this.initialVelY = initialVelY;
        this.velX = initialVelX;
        this.velY = initialVelY;
        
        println("Particle at " + this.x, this.y);
    }
    
    void update() {
        moveWithGravity(0.1);
        println(this.x, this.y);
    }
    
    void display() {
        stroke(255);
        fill(255, 150, 230);
        rect(this.x, this.y, this.w, this.h);
    }
    
    void moveWithGravity(float gravity) {
        this.velY += gravity;
        
        this.y += this.velY;
        this.x += this.velX;
    }
}
