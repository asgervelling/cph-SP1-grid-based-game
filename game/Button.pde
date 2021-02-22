class Button extends GUIElement {
    boolean beingPressed;
    
    PFont font;
    int fontSize;
    String btnText;
    int textY;
    
    Button(int x, int y, String btnText, GraphicalUserInterface GUI) {
        super(x, y, 400, 100, GUI);
        this.btnText = btnText;
        this.beingPressed = false;
        this.fontSize = autoScaleFontSize();
        this.font = createFont("arcade2020.ttf", fontSize);
        this.textY = getTextY();
        
        super.registerButton(this);
    }
    
    @Override
    void update() {
        
    }
    
    @Override
    void display() {
        strokeWeight(5);
        stroke(super.strokeColor);
        fill(this.bgColor);
        rect(super.x, super.y, super.w, super.h, 50, 0, 50, 0);
        
        textSize(this.fontSize);
        textFont(this.font);
        textAlign(BASELINE, BASELINE);
        fill(255);
        text(this.btnText, this.x + super.padding, this.textY);
    }
    
    void setFontSize(int size) {
        this.fontSize = size;
        this.font = createFont("arcade2020.ttf", fontSize);
    }
    
    // Functionality
    void onMouseHover() {
        if (!mouseInsideRect(this.x, this.y, this.w, this.h)) {
            this.beingPressed = false;
            this.bgColor = color(0);
            return;
        }
        if (!beingPressed) {
            this.bgColor = color(127);
        }
    }
    
    void onMousePressed() {
        if (!mouseInsideRect(this.x, this.y, this.w, this.h)) {
            return;
        }
        this.beingPressed = true;
        this.bgColor = color(180);
    }
    
    void onMouseReleased() {
        if (!mouseInsideRect(this.x, this.y, this.w, this.h)) {
            return;
        }
        this.beingPressed = false;
        switch (btnText) {
            case "Play":
                boolean tutorialNeeded = playerStats.tutorialNeeded();
                if (scene == "enterName") {
                    enterNameGUI.textField.submit();
                    goToScene("game");
                    break;
                } else if (scene == "tutorial") {
                    goToScene("game");
                    break;
                } else if (tutorialNeeded) {
                    goToScene("tutorial");
                    break;
                }
                scene = "game";
                break;
            case "Next":
                goToScene("enterName");
                break;
            case "Highscores":
                goToScene("highscores");
                break;
            case "Back":
                goToScene(lastScene);
                break;
            case "Settings":
                goToScene("settings");
                break;
            case "Reset highscores":
                HighscoreHandler hh = new HighscoreHandler();
                hh.resetHighscores();
                break;
            case "Change name":
                goToScene("enterName");
                break;
        }
    }
    
    
}
