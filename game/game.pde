import java.util.ArrayList;

String scene = "mainMenu";
int[][] grid = new int[80][45];
final int tileSize = 16;

Player player;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Food> foods = new ArrayList<Food>();

GraphicalUserInterface GUI;

void setup() {
    size(1280, 720);
    GUI = initGUI();
    newGame(3, 3);
}

void draw() {    
    switch (scene) {
        case "mainMenu":
            GUI.update();
            GUI.display();
            break;
        case "game":
            clearBoard();
            update();
            drawBoard();
        case "transition":
            break;
    }
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

void mousePressed() {
    GUI.handleMousePressed();
}

void mouseReleased() {
    GUI.handleMouseReleased();
}

void update()
{
    if (gameIsOver()) {
        println("Game over");
        exit();
    }

    // Update the grid array
    grid[player.x][player.y] = player.arrayRepresentation;
    for (int i = 0; i < enemies.size(); i++) {
        grid[enemies.get(i).x][enemies.get(i).y] = enemies.get(i).arrayRepresentation;
    }
    for (int i = 0; i < foods.size(); i++) {
        grid[foods.get(i).x][foods.get(i).y] = foods.get(i).arrayRepresentation;
    }

    // Update entities
    player.update();

    for (int i = 0; i < enemies.size(); i++) {
        enemies.get(i).update();
    }

    for (int i = 0; i < foods.size(); i++) {
        foods.get(i).update();
    }

    resolveCollisions();
}

boolean gameIsOver() {
    return (player.health <= 0 ? true : false);
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
    strokeWeight(1);
    for (int x = 0; x < grid.length; x++) {
        for (int y = 0; y < grid[0].length; y++) {
            grid[x][y] = 0;
        }
    }
}

void drawBoard() {
    strokeWeight(1);
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
