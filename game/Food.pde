class Food extends Actor {
    Player player;
    final int arrayRepresentation = 1;
    
    int standStillTimer = 0;
    
    Food(int x, int y, Player player) {
        super(x, y);
        this.player = player;
    }
    
    @Override
    void update() {
        standStillTimer--;
        if (!(standStillTimer > 0)) {
            moveAwayFromPlayer();
        }
    }
    
    void moveAwayFromPlayer() {
        int xDistance = Math.abs(player.x - this.x);
        int yDistance = Math.abs(player.y - this.y);
        
        float randomMoveProbability = random(0f, 1f);    
        if (randomMoveProbability < 0.25) {
            int randomMoveX = randInt(-1, 1);
            int randomMoveY = randInt(-1, 1);
            super.move(randomMoveX, randomMoveY);
        } else {
            
            if (xDistance > yDistance) {
                if (this.x > player.x) {
                    super.move(1, 0);
                } else {
                    super.move(-1, 0);
                }
            } else {
                if (this.y > player.y) {
                    super.move(0, 1);
                } else {
                    super.move(0, -1);
                }
            }
        }
    }
    
    @Override
    void resolveEdgeCollision() {
        // Food moves to a random place upon edge collision.
        int newX = randInt(grid.length - 1);
        int newY = randInt(grid[0].length - 1);
        if (newX == player.x && newY == player.y) {
            resolveEdgeCollision();
        }
        this.x = newX;
        this.y = newY;
        this.standStill(150);
    }
    
    void standStill(int frames) {
        /* Stand still for a second, so the player has a chance to catch this */
        this.standStillTimer = frames;
    }
}
