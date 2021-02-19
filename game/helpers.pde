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

float translateToRange(float val, float[] rangeIn, float[] rangeOut) {
    /* Return val translated from rangeIn to rangeOut */
    float spanIn = rangeIn[1] - rangeIn[0];
    float spanOut = rangeOut[1] - rangeOut[0];
    float scaledVal = (val - rangeIn[0]) / spanIn;
    
    return rangeOut[0] + (scaledVal * spanOut);
}

/*
def translate(value, leftMin, leftMax, rightMin, rightMax):
    # Figure out how 'wide' each range is
    leftSpan = leftMax - leftMin
    rightSpan = rightMax - rightMin

    # Convert the left range into a 0-1 range (float)
    valueScaled = float(value - leftMin) / float(leftSpan)

    # Convert the 0-1 range into a value in the right range.
    return rightMin + (valueScaled * rightSpan)
*/

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
