class Player extends Actor {
    int health = 3;
    boolean[] arrowKeysPressed = {false, false, false, false};
    final int type = 3;
    
    final int ARROWLEFT = 0;
    final int ARROWRIGHT = 1;
    final int ARROWUP = 2;
    final int ARROWDOWN = 3;
    
    Player(int x, int y) {
        super(x, y);
    }
    
    @Override
    void update() {
        // Movement
        if (arrowKeysPressed[ARROWLEFT]) {
            super.move(-1, 0);
        } else if (arrowKeysPressed[ARROWRIGHT]) {
            super.move(1, 0);
        }
    }
    
    @Override
    void display() {}
}
