int randInt(int max) {
    /* Return random integer from range [0; max] */
    return (int)Math.round(random(0, max));
}

int randInt(int min, int max) {
    /* Return random integer from range [min; max] */
    return (int)Math.round(random(min, max));
}

int randIntExceptX(int max, int x) {
    /* Return a random integer that's not x */
    int randInt = randInt(max);
    if (randInt == x) {
        randIntExceptX(max, x);
    }
    return randInt;
}

int randIntExceptX(int min, int max, int x) {
    /* Return a random integer that's not x */
    int randInt = randInt(min, max);
    if (randInt == x) {
        randIntExceptX(min, max, x);
    }
    return randInt;
}

Enemy enemyAtRandomSpot() {
    int randX = randInt(grid.length - 1);
    int randY = randInt(grid[0].length - 1);
    if (randX == player.x && randY == player.y) {
        enemyAtRandomSpot();
    }
    
    return new Enemy(randX, randY, player);
}

boolean mouseInsideRect(int x, int y, int w, int h) {
    if (mouseX > x &&
        mouseX < x + w &&
        mouseY > y &&
        mouseY < y + h)
        {
            return true;
        }
    return false;
}
