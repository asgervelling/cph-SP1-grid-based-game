void newGame(int numEnemies, int numFoods) {
    player = new Player(4, 4);
    countdownTransition = new CountdownTransition();

    enemies = new ArrayList<Enemy>();
    for (int i = 0; i < numEnemies; i++)
    {
        int xPos = randIntExceptX(grid.length - 1, player.x);
        int yPos = randIntExceptX(grid[0].length - 1, player.y);
        enemies.add(new Enemy(xPos, yPos, player));
    }

    foods = new ArrayList<Food>();
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
    
    String username = playerStats.getUsernameFromConfig();
    boolean tutorialNeeded = playerStats.tutorialNeeded();
    
    if (!(username.equals("none")) || !(tutorialNeeded)) {
        // User has played this game before, reveal the settings
        Button settingsButton = new Button(410, placedBelow(highscoresButton), "Settings", GUI);
    }
    
    return GUI;
}

GraphicalUserInterface initTutorialGUI() {
    GraphicalUserInterface GUI = new GraphicalUserInterface();
    String username = playerStats.getUsernameFromConfig();
    boolean tutorialNeeded = playerStats.tutorialNeeded();
    
    Container masterContainer = new Container(100, 100, 1080, 520, GUI);
    Label titleLabel = new Label(410, 130, "Tutorial", GUI);
    Label tutorialLabel = new Label(410, placedBelow(titleLabel), "Arrow keys to move.\nWASD to extend your body.", GUI);
    tutorialLabel.h = 3 * titleLabel.h;
    tutorialLabel.setFontSize(20);
    
    Button button = new Button(410, placedBelow(tutorialLabel), "Play", GUI);
    if (username.equals("none")) {
        button.btnText = "Next";
    }
    int labelY = placedBelow(button) - 8;
    Checkbox checkbox = new Checkbox(410, labelY, "doNotShowAgain", GUI); 
    int labelX = checkbox.x + checkbox.w + checkbox.margin;
    int labelW = titleLabel.w - checkbox.w - checkbox.margin;    
    Label checkBoxLabel = new Label(labelX, labelY, labelW, "Do not show again", GUI);
    checkBoxLabel.setFontSize(20);
    checkBoxLabel.textY -= 6;
    
    return GUI;
}

GraphicalUserInterface initEnterNameGUI() {    
    GraphicalUserInterface GUI = new GraphicalUserInterface();
    Container masterContainer = new Container(100, 100, 1080, 520, GUI);
    Label enterNameLabel = new Label(410, 130, "Enter your name", GUI);
    TextField textField = new TextField(410, placedBelow(enterNameLabel), GUI);
    Button playButton = new Button(410, textField.y + textField.h + textField.margin, "Play", GUI);
    
    return GUI;
}

GraphicalUserInterface initHighscoresGUI() {
    HighscoreHandler hh = new HighscoreHandler();
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
