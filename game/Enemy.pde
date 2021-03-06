class Enemy extends Actor {
    final int arrayRepresentation = 2;
    Player player;
    int moveTimer = 0;
    int freeTimer;
    boolean queueingFree;
    Explosion explosion;
    boolean exploded;
    color c;
    
    Enemy(int x, int y, Player player) {
        super(x, y);
        this.player = player;
        this.c = color(255, 0, 0);
        this.exploded = false;
        this.freeTimer = 200;
        this.queueingFree = false;
        this.explosion = new Explosion();
    }
    
    @Override
    void update() {
        if (queueingFree) {
            freeTimer--;
        }
        if (freeTimer < 0) {
            enemies.remove(this);
        }
        moveTowardsPlayer();
        explosion.update();
    }
    
    void randomMove() {
        int randomMoveX = randInt(-1, 1);
        int randomMoveY = randInt(-1, 1);
        if (this.x + randomMoveX == this.player.x &&
            this.y + randomMoveY == this.player.y) {
                randomMove();
            }
        super.move(randomMoveX, randomMoveY);
    }
    
    void moveTowardsPlayer() {
        if (moveTimer < 0) {
            moveTimer = 0;
        } else {
            moveTimer--;
        }
        
        int xDistance = Math.abs(player.x - this.x);
        int yDistance = Math.abs(player.y - this.y);
    
        float randomMoveProbability = random(0f, 1f);    
        if (randomMoveProbability < 0.25) {
            randomMove();
        } else {
            if (moveTimer == 0) {
                if (xDistance > yDistance)
                {
                    if (player.x > this.x) {
                        super.move(1, 0);
                    } else {
                        super.move(-1, 0);
                    }
                } 
                else
                {
                    if (player.y > this.y) {
                        super.move(0, 1);
                    } else {
                        super.move(0, -1);
                    }
                }
            }
        }
    }
    
    @Override
    void resolveEdgeCollision() {
        return;
    }
    
    void explode() {
        if (this.exploded) {
            return;
        }
        this.explosion = new Explosion();
        this.explosion.trigger(this.x, this.y);
        this.queueFree();
        this.exploded = true;

    }
    
    void queueFree() {
        queueingFree = true;
    }
}
