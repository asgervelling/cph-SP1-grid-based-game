import java.util.ArrayList;

int[][] grid = new int[80][45];
final int tileSize = 16;
Player player;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Food> foods = new ArrayList<Food>();

void setup() {
    size(1280, 720);

    player = new Player(4, 4);

    enemies.add(new Enemy(30, 40, player));
    enemies.add(new Enemy(10, 30, player));
    enemies.add(new Enemy(60, 20, player));
    
    foods.add(new Food(25, 25, player));
    foods.add(new Food(35, 25, player));
    foods.add(new Food(53, 40, player));
    
    GraphicalUserInterface GUI = new GraphicalUserInterface();
    Button testButton = new Button(4, 4, 2, 1, GUI);
    Container testContainer = new Container(4, 4, 4, 4, "testContainer", GUI);
    
    println(GUI.elements.get(0).x);
    

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
    // Update the grid array
    grid[player.x][player.y] = player.arrayRepresentation;
    for (int i = 0; i < enemies.size(); i++) {
        grid[enemies.get(i).x][enemies.get(i).y] = enemies.get(i).arrayRepresentation;
    }
    for (int i = 0; i < foods.size(); i++) {
        grid[foods.get(i).x][foods.get(i).y] = foods.get(i).arrayRepresentation;
    }
    
    // Call update on everyone
    player.update();
    
    for (int i = 0; i < enemies.size(); i++) {
        enemies.get(i).update();
    }
    
    for (int i = 0; i < foods.size(); i++) {
        foods.get(i).update();
    }
    
    resolveCollisions();
}




void resolveCollisions() {
    // Collision with enemies
    for (int i = 0; i < enemies.size(); i++) {
        if (player.collidesWith(enemies.get(i))) {
            if (!player.isInvincible()) {
                player.health--;
                player.becomeInvincible();
            }
        }
    }
    // Collision with food
    for (int i = 0; i < foods.size(); i++) {
        if (player.collidesWith(foods.get(i))) {
            if (!player.isInvincible()) {
                foods.remove(i);
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
            color c = getColorFromInt(grid[x][y]);
            fill(c);
            rect(x * tileSize, y * tileSize, tileSize, tileSize);
        }
    }
}

color getColorFromInt(int repr) 
{
    color c = color(255);

    switch(repr)
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
