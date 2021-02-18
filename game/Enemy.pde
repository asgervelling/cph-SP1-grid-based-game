class Enemy extends Actor {
    final int type = 2;
    Player player;
    int moveTimer = 0;
    
    Enemy(int x, int y, Player player) {
        super(x, y);
        this.player = player;
    }
    
    @Override
    void update() {
        moveTowardsPlayer();
    }
    
    void moveTowardsPlayer() {
        if (moveTimer < 0) {
            moveTimer = 0;
        } else {
            moveTimer--;
        }
        
        int xDistance = Math.abs(player.x - this.x);
        int yDistance = Math.abs(player.y - this.y);
    
        // random chance (~25% chance) for at enemy flytter sig i en tilfældig retning. 
        float randomMoveProbability = random(0f, 1f);    
        if (randomMoveProbability < 0.25) {
            int randomMoveX = (int)Math.round(random(-1, 1));
            int randomMoveY = (int)Math.round(random(-1, 1));
            super.move(randomMoveX, randomMoveY);
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
}
