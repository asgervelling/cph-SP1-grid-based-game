class Player extends Actor {
    int health = 3;

    // Timers
    int invincibleTimer = 0;
    int blinkingTimer = 0;

    boolean[] arrowKeysPressed = {false, false, false, false};
    final int type = 3;

    int alpha = 255;
    color c = color(0, 0, 255, this.alpha);

    final int ARROWLEFT = 0;
    final int ARROWRIGHT = 1;
    final int ARROWUP = 2;
    final int ARROWDOWN = 3;

    Player(int x, int y) {
        super(x, y);
    }

    @Override
    void update() {
        c = color(0, 0, 255, this.alpha);
        
        // Movement
        if (arrowKeysPressed[ARROWLEFT]) {
            super.move(-1, 0);
        } else if (arrowKeysPressed[ARROWRIGHT]) {
            super.move(1, 0);
        }
    
        if (arrowKeysPressed[ARROWUP]) {
            super.move(0, -1);
        } else if (arrowKeysPressed[ARROWDOWN]) {
            super.move(0, 1);
        }
    
        // Make invincible for a short timer after collision with enemy
        runTimers();
        if (this.isInvincible()) {
            this.displayInvincibility();
        } else {
            this.alpha = 255;
        }
    }
    
    void runTimers() {
        invincibleTimer--;
        blinkingTimer--;
    }

    boolean collidesWith(Actor a) {
        if (this.x == a.x &&
            this.y == a.y) {
            return true;
        }
        return false;
    }

    boolean isInvincible() {
        if (invincibleTimer > 0) {
            return true;
        }
        return false;
    }

    void becomeInvincible() {
        invincibleTimer = 100;
    }

    void displayInvincibility() {
        int blinkDuration = 40;
        if (blinkingTimer < 0) {
            blinkingTimer = 40;
        }
        if (blinkingTimer > blinkDuration / 2) {
            alpha = 0;
        } else {
            alpha = 255;
        }
    }
}
