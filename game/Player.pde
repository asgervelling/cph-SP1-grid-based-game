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
        println(getCurrentQuadrant());
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
        // Spawn on the other side of the map
        
        int newX, newY;
        
        String currentQuadrant = getCurrentQuadrant();
        println("Caught at " + currentQuadrant);
        switch (currentQuadrant) {
            case "lowerRight":
                // Spawn in the upper left side
                newX = 5;
                newY = 5;
                break;
            case "lowerLeft":
                newX = grid.length - 5;
                newY = 5;
                break;
            case "upperRight":
                newX = 5;
                newY = grid[0].length - 5;
                break;
            case "upperLeft":
                newX = grid.length - 5;
                newY = grid[0].length - 5;
                break;
            default:
                println("This shouldn't happen");
                newX = 40;
                newY = 20;
        }
        this.x = newX;
        this.y = newY;        
        
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
    
    String getCurrentQuadrant() {
        /* Find out which quarter of the map, the player is standing within */
        String xString, yString;
        String quadrant;
        
        if (this.x < grid.length / 2) {
            xString = "Left";
        } else {
            xString = "Right";
        }
        
        if (this.y < grid[0].length / 2) {
            yString = "upper";
        } else {
            yString = "lower";
        }
        
        
        quadrant = yString + xString;       
        return quadrant;
    }
}
