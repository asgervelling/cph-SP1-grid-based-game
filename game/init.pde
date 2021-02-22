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
    Container masterContainer = new Container(100, 100, 1080, 520, GUI);
    Button playButton = new Button(410, 130, "Play", GUI);
    Button highscoresButton = new Button(410, placedBelow(playButton), "Highscores", GUI);
    
    return GUI;
}

GraphicalUserInterface initTutorialGUI() {
    GraphicalUserInterface GUI = new GraphicalUserInterface();
    String username = playerStats.getUsernameFromConfig("config.txt");
    boolean tutorialNeeded = playerStats.tutorialNeeded("config.txt");
    Label titleLabel = new Label(410, 130, "Tutorial", GUI);
    Label tutorialLabel = new Label(410, placedBelow(titleLabel), "Arrow keys to move.\nWASD to extend your body.", GUI);
    tutorialLabel.h = 3 * titleLabel.h;
    
    if (username.equals("none")) {
        Button button = new Button(410, placedBelow(tutorialLabel), "Next", GUI);
    } else {
        Button button = new Button(410, placedBelow(tutorialLabel), "GO!", GUI);
    }
    
    return GUI;
}

GraphicalUserInterface initEnterNameGUI() {
    String username = playerStats.getUsernameFromConfig("config.txt");
    boolean tutorialNeeded = playerStats.tutorialNeeded("config.txt");
    
    GraphicalUserInterface GUI = new GraphicalUserInterface();
    Container masterContainer = new Container(100, 100, 1080, 520, GUI);
    Label enterNameLabel = new Label(410, 130, "Enter your name", GUI);
    TextField textField = new TextField(410, placedBelow(enterNameLabel), GUI);
    Button playButton = new Button(410, 130, "Play", GUI);
    
    return GUI;
}

GraphicalUserInterface initHighscoresGUI() {
    HighscoreHandler hh = new HighscoreHandler("highscores.txt");
    hh.loadHighscores();    
    
    GraphicalUserInterface GUI = new GraphicalUserInterface();
    Container masterContainer = new Container(100, 100, 1080, 520, GUI);

    int x = 410;
    int w = 250;
    Label previousNameLabel = new Label(x, 130, 250, hh.sortedNames.get(0), GUI);
    for (int i = 1; i < 5; i++) {
        Label nextNameLabel = new Label(x, placedBelow(previousNameLabel), w, hh.sortedNames.get(i), GUI);
        previousNameLabel = nextNameLabel;
    }

    x = 410 + previousNameLabel.w + previousNameLabel.margin;
    w = 130;
    Label previousScoreLabel =  new Label(x, 130, w, Integer.toString(hh.sortedScores.get(0)), GUI);
    for (int i = 1; i < 5; i++) {
        Label nextScoreLabel = new Label(x, placedBelow(previousScoreLabel), w, Integer.toString(hh.sortedScores.get(i)), GUI);
        previousScoreLabel = nextScoreLabel;
    }
    
    Button backButton = new Button(410, placedBelow(previousScoreLabel), "Back", GUI);
    return GUI;
}
