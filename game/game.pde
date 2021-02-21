import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;
import java.io.File;
import java.io.IOException;
import java.io.BufferedWriter;
import java.io.FileWriter;


String scene = "mainMenu";
int[][] grid = new int[80][45];
final int tileSize = 16;

Player player;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Food> foods = new ArrayList<Food>();
CountdownTransition countdownTransition;
GraphicalUserInterface mainMenuGUI;
GraphicalUserInterface highscoresGUI;
GraphicalUserInterface HUD;
PlayerStats playerStats;

int numEnemies = 3;

void setup() {
    size(1280, 720);
    playerStats = new PlayerStats();
    mainMenuGUI = initMainMenuGUI();
    highscoresGUI = initHighscoresGUI();
    newGame(numEnemies, 3);
}

void draw() {    
    switch (scene) {
        case "mainMenu":
            drawBoard();
            mainMenuGUI.update();
            mainMenuGUI.display();
            break;
        case "game":
            clearBoard();
            update();
            drawBoard();
            drawParticles();
            if (countdownTransition.timeLeft > 0) {
                countdownTransition.display();
            }
            break;
        case "highscores":
            drawBoard();
            highscoresGUI.update();
            highscoresGUI.display();
            break;
            
    }
}

void keyPressed() {
    final int ARROWLEFT = 0;
    final int ARROWRIGHT = 1;
    final int ARROWUP = 2;
    final int ARROWDOWN = 3;
    if (key == CODED) {
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
    
    if (key == 'w' || key == 'W') {
        player.WASDKeysPressed[0] = true;
    }
    if (key == 'a' || key == 'A') {
        player.WASDKeysPressed[1] = true;
    }
    if (key == 's' || key == 'S') {
        player.WASDKeysPressed[2] = true;
    }
    if (key == 'd' || key == 'D') {
        player.WASDKeysPressed[3] = true;
    }
}

void keyReleased() {
    final int ARROWLEFT = 0;
    final int ARROWRIGHT = 1;
    final int ARROWUP = 2;
    final int ARROWDOWN = 3;
    if (key == CODED) {
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
    if (key == 'w' || key == 'W') {
        player.WASDKeysPressed[0] = false;
    }
    if (key == 'a' || key == 'A') {
        player.WASDKeysPressed[1] = false;
    }
    if (key == 's' || key == 'S') {
        player.WASDKeysPressed[2] = false;
    }
    if (key == 'd' || key == 'D') {
        player.WASDKeysPressed[3] = false;
    }
    
}

void mousePressed() {
    switch (scene) {
        case "mainMenu":
            mainMenuGUI.handleMousePressed();
            break;
        case "highscores":
            highscoresGUI.handleMousePressed();
            break;
    }
    
}

void mouseReleased() {
    switch (scene) {
        case "mainMenu":
            mainMenuGUI.handleMouseReleased();
            break;
        case "highscores":
            highscoresGUI.handleMouseReleased();
            break;
    }
}

void update()
{
    if (gameIsOver()) {
        println("Game over");
        exit();
    }
    if (gameWon()) {
        explodeEnemies();
    }
    
    if (enemies.isEmpty()) {
        // Go to next level, make it harder
        numEnemies += 3;
        newGame(numEnemies, 3);
    }

    // Update entities
    countdownTransition.update();
    if (countdownTransition.timeLeft < 0) {
        player.update();
        for (int i = 0; i < enemies.size(); i++) {
            enemies.get(i).update();
        }
    
        for (int i = 0; i < foods.size(); i++) {
            foods.get(i).update();
        }
        
        resolveCollisions();
    }    
    
    // Update the grid array
    grid[player.x][player.y] = player.arrayRepresentation;
    for (int i = 0; i < enemies.size(); i++) {
        grid[enemies.get(i).x][enemies.get(i).y] = enemies.get(i).arrayRepresentation;
    }
    for (int i = 0; i < foods.size(); i++) {
        grid[foods.get(i).x][foods.get(i).y] = foods.get(i).arrayRepresentation;
    }
}

boolean gameIsOver() {
    return (player.health <= 0 ? true : false);
}

boolean gameWon() {
    return (foods.isEmpty() ? true : false);
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

int getFoodIndex(int x, int y) {
    for (int i = 0; i < foods.size(); i++) {
        if (foods.get(i).x == x && foods.get(i).y == y) {
            return i;
        }
    }
    return -1;
}

void clearBoard() {
    strokeWeight(1);
    stroke(0);
    for (int x = 0; x < grid.length; x++) {
        for (int y = 0; y < grid[0].length; y++) {
            grid[x][y] = 0;
        }
    }
}

void drawBoard() {
    strokeWeight(1);
    stroke(0);
    for (int x = 0; x < grid.length; x++) {
        for (int y = 0; y < grid[0].length; y++) {
            color c = getColorFromInt(grid[x][y]);
            fill(c);
            rect(x * tileSize, y * tileSize, tileSize, tileSize);
        }
    }
}

void drawParticles() {
    for (int i = 0; i < enemies.size(); i++) {
        enemies.get(i).explosion.display();
    }
}

color getColorFromInt(int repr) 
{
    color c = color(255);
    color bgColor = color(127);

    switch(repr)
    {
    case 0: // Nothing
        c = bgColor;
        break;
    case 1:
        // Food
        c = color(0, 255, 0);
        break;
    case 2: 
        // Enemy
        if (!gameWon()) {
            c = enemies.get(0).c;
            break;
        } else {
            c = bgColor;
            break;
        }
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

void explodeEnemies() {
    for (int i = 0; i < enemies.size(); i++) {
        enemies.get(i).explode();
    }
    
}
