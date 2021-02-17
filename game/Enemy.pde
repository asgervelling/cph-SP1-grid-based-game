class Enemy extends Actor {
    final int type = 2;
    Player player;
    
    Enemy(int x, int y, Player player) {
        super(x, y);
        this.player = player;
    }
    
    @Override
    void update() {
        moveTowardsPlayer();
    }
    
    void moveTowardsPlayer() {
    }
}
