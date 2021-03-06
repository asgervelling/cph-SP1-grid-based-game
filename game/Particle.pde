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
        
    }
    
    void update() {
        moveWithGravity(0.1);
    }
    
    void display() {
        stroke(255);
        fill(255, 0, 0);
        rect(this.x, this.y, this.w, this.h);
    }
    
    void moveWithGravity(float gravity) {
        this.velY += gravity;
            
        this.y += this.velY;
        this.x += this.velX;
    }
    


    
}
