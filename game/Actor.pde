abstract class Actor {
    int x, y;

    Actor(int x, int y) {
        this.x = x;
        this.y = y;
    }

    abstract void update();

    void move(int xDir, int yDir) {
        if (xDir == -1 && this.x - 1 < 0 ||
            xDir == 1 && this.x + 1 > grid.length - 1 ||
            yDir == -1 && this.y - 1 < 0 ||
            yDir == 1 && this.y + 1 > grid[0].length - 1) {
                resolveEdgeCollision();
                return;
        }
        this.x += 1 * xDir;
        this.y += 1 * yDir;
    }
    
    abstract void resolveEdgeCollision();
}
