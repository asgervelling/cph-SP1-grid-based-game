class Checkbox extends GUIElement {
    boolean ticked;
    boolean beingPressed;
    String method;
    
    Checkbox(int x, int y, String method, GraphicalUserInterface GUI) {
        super(x, y, 48, 48, GUI);
        this.ticked = false;
        this.beingPressed = false;
        this.method = method;
        
        super.registerCheckbox(this);
    }
    
    @Override
    void update() {
        
    }
    
    @Override
    void display() {
        fill(super.bgColor);
        stroke(super.strokeColor);
        strokeWeight(5);
        rect(super.x, super.y, super.w, super.h);
        
        if (ticked) {
            // Draw a cross
            line(super.x, super.y, super.x + super.w, super.y + super.h);
            line(super.x, super.y + super.h, super.x + super.w, super.y);
        }
    }
    
    void onMouseHover() {
        if (!mouseInsideRect(this.x, this.y, this.w, this.h)) {
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
        this.ticked = !this.ticked;
        switch (method) {
            case "doNotShowAgain":
                if (ticked) {
                    playerStats.writeConfig(playerStats.getUsernameFromConfig("config.txt"), false, "config.txt");
                } else {
                    playerStats.writeConfig(playerStats.getUsernameFromConfig("config.txt"), true, "config.txt");
                }
                break;
        }
    }
}
