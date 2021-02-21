class TextField extends GUIElement {
    String nameString;
    int fontSize;
    PFont font;
    int textY;
    
    TextField(int x, int y, GraphicalUserInterface GUI) {
        super(x, y, 400, 48, GUI);
        this.nameString = "";
        
        this.fontSize = 24;
        this.font = createFont("arcade2020.ttf", fontSize);
        this.textY = getTextY();
        super.margin = 20;
        
        super.registerTextField(this);
    }
    
    @Override
    void update() {
        // receiveKey();
    }

    @Override
    void display() {
        noStroke();
        fill(255);
        rect(super.x, super.y, super.w, super.h, 0, 0, 50, 0);
        
        textSize(this.fontSize);
        textFont(this.font);
        textAlign(BASELINE, BASELINE);
        fill(0);
        text(this.nameString, this.x + super.padding, this.textY);
    }
    
    void receiveKey(char c) {
        // Handle backspace
        if (c == '\b') {
            if (this.nameString.length() < 1) {
                return;
            } else {
                this.nameString = this.nameString.substring(0, this.nameString.length() - 1);
                return;
            }
        }
        this.nameString += c;
        this.nameString = sanitizeUsername(this.nameString);
    }
    
    String sanitizeUsername(String name) {
        String sanitizedName = name.replaceAll("^[A-Za-z]\\w{5,29}$", "");
        sanitizedName = name.replaceAll("[^\\x00-\\x7F]", "");
        sanitizedName = sanitizedName.replaceAll("\n", "");
        
        return sanitizedName;
    }
    
    String submit(String nextScene, PlayerStats playerStats) {
        /* Get username from nameString and return nextScene */
        playerStats.username = nameString;
        playerStats.writeConfig(nameString, playerStats.tutorialNeeded("config.txt"), "config.txt");
        
        return nextScene;
    }
}
