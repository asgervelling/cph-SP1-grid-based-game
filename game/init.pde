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

GraphicalUserInterface initHighscoresGUI() {
    HighscoreHandler hh = new HighscoreHandler("highscores.txt");
    HashMap<String, Integer> highscores = hh.loadHighscores();
    
    println(highscores);
    
    String[] highscoreTexts = {"Kasper", "Johannes", "Maria", "Marethe", "Ingvar"};
    int[] points = {29, 100, 21, 9, 2};
    GraphicalUserInterface GUI = new GraphicalUserInterface();
    Container masterContainer = new Container(100, 100, 1080, 520, "masterContainer", GUI);
    Label nameLabel0 = new Label(410, 130, 250, highscoreTexts[0], masterContainer, GUI);
    Label nameLabel1 = new Label(410, placedBelow(nameLabel0), 250, highscoreTexts[1], masterContainer, GUI);
    Label nameLabel2 = new Label(410, placedBelow(nameLabel1), 250, highscoreTexts[2], masterContainer, GUI);
    Label nameLabel3 = new Label(410, placedBelow(nameLabel2), 250, highscoreTexts[3], masterContainer, GUI);
    Label nameLabel4 = new Label(410, placedBelow(nameLabel3), 250, highscoreTexts[4], masterContainer, GUI);

    int scoreLabelX = 410 + nameLabel0.w + nameLabel0.margin;
    Label scoreLabel0 = new Label(scoreLabelX, 130, 130, Integer.toString(points[0]), masterContainer, GUI);
    Label scoreLabel1 = new Label(scoreLabelX, placedBelow(scoreLabel0), 130, Integer.toString(points[1]), masterContainer, GUI);
    Label scoreLabel2 = new Label(scoreLabelX, placedBelow(scoreLabel1), 130, Integer.toString(points[2]), masterContainer, GUI);
    Label scoreLabel3 = new Label(scoreLabelX, placedBelow(scoreLabel2), 130, Integer.toString(points[3]), masterContainer, GUI);
    Label scoreLabel4 = new Label(scoreLabelX, placedBelow(scoreLabel3), 130, Integer.toString(points[4]), masterContainer, GUI);

    Button backButton = new Button(410, placedBelow(nameLabel4), "Back", masterContainer, GUI);
    
    return GUI;
}
