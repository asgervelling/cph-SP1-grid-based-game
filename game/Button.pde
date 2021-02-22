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
        fill(super.bgColor);
        stroke(super.strokeColor);
        strokeWeight(5);
        rect(super.x, super.y, super.w, super.h, 50, 0, 50, 0);
        
        textSize(this.fontSize);
        textFont(this.font);
        textAlign(BASELINE, BASELINE);
        fill(255);
        text(this.btnText, this.x + super.padding, this.textY);
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
                    scene = "game";
                    break;
                } else if (scene == "tutorial") {
                    scene = "game";
                    break;
                } else if (tutorialNeeded) {
                    scene = "tutorial";
                    break;
                }
                scene = "game";
                break;
            case "Next":
                scene = "enterName";
                break;
            case "Highscores":
                scene = "highscores";
                break;
            case "Back":
                scene = "mainMenu";
                break;
        }
    }
    
    
}
