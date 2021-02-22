class Player extends Actor {
    int health = 3;

    // Timers
    int invincibleTimer = 0;
    int blinkingTimer = 0;

    final int ARROWLEFT = 0;
    final int ARROWRIGHT = 1;
    final int ARROWUP = 2;
    final int ARROWDOWN = 3;
    final int W = 0;
    final int A = 1;
    final int S = 2;
    final int D = 3;
    boolean[] arrowKeysPressed = {false, false, false, false};
    boolean[] WASDKeysPressed = {false, false, false, false};
    int[] bodyExpansions = {0, 0, 0, 0};
    final int arrayRepresentation = 3;

    color primaryColor = color(0, 0, 255);
    color secondaryColor = color(255);

    color c = primaryColor;

    Player(int x, int y) {
        super(x, y);
    }

    @Override
    void update() {    
        handleKeyboardInput();
    
        // Make invincible for a short timer after collision with enemy
        runTimers();
        if (this.isInvincible()) {
            this.displayInvincibility();
        } else {
            this.c = primaryColor;
        }
    }
    
    @Override
    void resolveEdgeCollision() {
        return;
    }
    
    void handleKeyboardInput() {
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
        
        // Expand body with WASD
        if (WASDKeysPressed[W]) {
            expandBody(W);
        } else {
            diminishBody(W);
        }
        
        if (WASDKeysPressed[A]) {
            expandBody(A);
        } else {
            diminishBody(A);
        }
        
        if (WASDKeysPressed[S]) {
            expandBody(S);
        } else {
            diminishBody(S);
        }
        
        if (WASDKeysPressed[D]) {
            expandBody(D);
        } else {
            diminishBody(D);
        }
    }
    
    void runTimers() {
        /* Timers always decrement. Do something if their value >= 0 */
        this.invincibleTimer--;
        this.blinkingTimer--;
    }
    
    void expandBody(int keyDown) {
        /* Expand this' body in order to more easily get food */
        int maxExpansion = 12;
        this.bodyExpansions[keyDown] = (this.bodyExpansions[keyDown] >= maxExpansion ? maxExpansion : this.bodyExpansions[keyDown] + 1);
        for (int i = 0; i < this.bodyExpansions[keyDown]; i++) {
            try {
                switch (keyDown) {
                    case W:
                        tryBodyExpansion(this.x, this.y - i);
                        break;
                    case A:
                        tryBodyExpansion(this.x - i, this.y);
                        break;
                    case S:
                        tryBodyExpansion(this.x, this.y + i);
                        break;
                    case D:
                        tryBodyExpansion(this.x + i, this.y);
                        break;
                }
            } catch (ArrayIndexOutOfBoundsException e) {
                continue;
            }
        }
    }
    
    void loseHealth() {
        if (!player.isInvincible()) {
            this.becomeInvincible();
            playerStats.health--;
            return;
        }
    }
    
    void gainPoint() {
        playerStats.points++;
    }
    
    void tryBodyExpansion(int x, int y) {
        for (int i = 0; i < enemies.size(); i++) {
            if (enemies.get(i).x == x && enemies.get(i).y == y) {
                // An enemy is here
                this.loseHealth();
            }
        }
        for (int i = 0; i < foods.size(); i++) {
            if (foods.get(i).x == x && foods.get(i).y == y) {
                // There is food here
                if (!player.isInvincible()) {
                    this.gainPoint();
                    foods.remove(getFoodIndex(x, y));
                    return;
                }
            }
        }
        grid[x][y] = arrayRepresentation;
    }
    
    void diminishBody(int keyDown) {
        this.bodyExpansions[keyDown] = (this.bodyExpansions[keyDown] > 0 ? this.bodyExpansions[keyDown] - 1 : 0);
    }
    
    boolean bodyExpanded() {
        for (int i = 0; i < 4; i++) {
            if (bodyExpansions[i] > 0) {
                return true;
            }
        }
        return false;
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
        /* Player is invincible and moved away from enemies when health is lost */
        invincibleTimer = 100;
    }

    void displayInvincibility() {
        /* Classic blink to indicate invincibility */
        int blinkDuration = 40;
        if (blinkingTimer < 0) {
            blinkingTimer = 40;
        }
        if (blinkingTimer > blinkDuration / 2) {
            this.c = secondaryColor;
        } else {
            this.c = primaryColor;
        }
    }
}
