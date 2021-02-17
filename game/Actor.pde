abstract class Actor {
    int x, y;
    
    Actor(int x, int y) {
        this.x = x;
        this.y = y;
    }
    
    abstract void update();
    abstract void display();
    
    void move(int xDir, int yDir) {
        this.x += 1 * xDir;
        this.y += 1 * yDir;
    }
}
    
