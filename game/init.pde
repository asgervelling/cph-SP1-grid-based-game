void newGame(int numEnemies, int numFoods) {
    player = new Player(4, 4);
    countdownTransition = new CountdownTransition();

    for (int i = 0; i < numEnemies; i++)
    {
        int xPos = randIntExceptX(grid.length - 1, player.x);
        int yPos = randIntExceptX(grid[0].length - 1, player.y);
        enemies.add(new Enemy(xPos, yPos, player));
    }

    for (int i = 0; i < numFoods; i++) {
        int xPos = randIntExceptX(grid.length - 1, player.x);
        int yPos = randIntExceptX(grid[0].length - 1, player.y);
        foods.add(new Food(xPos, yPos, player));
    }
}

GraphicalUserInterface initMainMenuGUI() {
    GraphicalUserInterface GUI = new GraphicalUserInterface();
    Container testContainer = new Container(100, 100, 1080, 520, "testContainer", GUI);
    Button playButton = new Button(410, 130, "Play", testContainer, GUI);
    Button highscoresButton = new Button(410, placedBelow(playButton), "Highscores", testContainer, GUI);
    
    return GUI;
}
