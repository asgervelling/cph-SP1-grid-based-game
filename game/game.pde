import java.util.ArrayList;

int[][] grid = new int[80][45];
final int tileSize = 16;
Player player;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();

void setup() {
    size(1280, 720);

    player = new Player(4, 4);

    enemies.add(new Enemy(30, 40, player));
    enemies.add(new Enemy(10, 30, player));
    enemies.add(new Enemy(60, 20, player));

    clearBoard();
}

void draw() {    
    clearBoard();
    updateEntities();

    drawBoard();

    /*
     clearBoard() // sætter alle værdier til 0 via double for loop (grid[x][y] = 0;)
     updateEnemies() // kalder enemy.moveTowardsPlayer() på hver enemy.
     drawBoard() // tegner rect og bruger getColorFromType metoden til at bestemme fill værdi.
     
     isGameOver() // returnerer true hvis spillerens health er under -1.
     resolveCollisions() // tjekker om enemy og player står på samme x og y koordinat. Hvis ja, så kald player.takeDamage();
     */
}

void keyPressed() {
    final int ARROWLEFT = 0;
    final int ARROWRIGHT = 1;
    final int ARROWUP = 2;
    final int ARROWDOWN = 3;
    if (keyCode == LEFT) {
        player.arrowKeysPressed[ARROWLEFT] = true;
    }
    if (keyCode == RIGHT) {
        player.arrowKeysPressed[ARROWRIGHT] = true;
    }
    if (keyCode == UP) {
        player.arrowKeysPressed[ARROWUP] = true;
    }
    if (keyCode == DOWN) {
        player.arrowKeysPressed[ARROWDOWN] = true;
    }
}

void keyReleased() {
    final int ARROWLEFT = 0;
    final int ARROWRIGHT = 1;
    final int ARROWUP = 2;
    final int ARROWDOWN = 3;
    if (keyCode == LEFT) {
        player.arrowKeysPressed[ARROWLEFT] = false;
    }
    if (keyCode == RIGHT) {
        player.arrowKeysPressed[ARROWRIGHT] = false;
    }
    if (keyCode == UP) {
        player.arrowKeysPressed[ARROWUP] = false;
    }
    if (keyCode == DOWN) {
        player.arrowKeysPressed[ARROWDOWN] = false;
    }
}

void updateEntities()
{
    grid[player.x][player.y] = player.type;
    for (int i = 0; i < enemies.size(); i++) {
        grid[enemies.get(i).x][enemies.get(i).y] = enemies.get(i).type;
    }
    player.update();
    updateEnemies();
    resolveCollisions();
    // println(player.health, player.invincibleTimer, player.alpha);
}

void updateEnemies() {
    for (int i = 0; i < enemies.size(); i++) {
        enemies.get(i).update();
    }
}

void resolveCollisions() {
    for (int i = 0; i < enemies.size(); i++) {
        if (player.collidesWith(enemies.get(i))) {
            if (!player.isInvincible()) {
                player.health--;
                player.becomeInvincible();
            }
        }
    }
}

void clearBoard() {
    for (int x = 0; x < grid.length; x++) {
        for (int y = 0; y < grid[0].length; y++) {
            grid[x][y] = 0;
        }
    }
}

void drawBoard() {
    for (int x = 0; x < grid.length; x++) {
        for (int y = 0; y < grid[0].length; y++) {
            color c = getColorFromType(grid[x][y]);
            fill(c);
            rect(x * tileSize, y * tileSize, tileSize, tileSize);
        }
    }
}

color getColorFromType(int type) 
{
    color c = color(255);

    switch(type)
    {
    case 0: // Nothing
        c = color(127);
        break;
    case 1: 
        // Food
        c = color(0, 255, 0);
        break;
    case 2: 
        // Enemy
        c = color(255, 0, 0);
        break;
    case 3: 
        // Player
        c = player.c;
        break;
    }    

    return c;
}

void printBoard() {
    for (int x = 0; x < grid.length; x++) {
        for (int y = 0; y < grid[0].length; y++) {
            print(grid[x][y] + " ");
        }
        print("\n");
    }
    print("\n");
}
