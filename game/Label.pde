class Label extends GUIElement {
    Container parentContainer;
    String labelText;
    int fontSize;
    PFont font;
    int textY;
    
    Label(int x, int y, String labelText, Container parentContainer, GraphicalUserInterface GUI) {
        super(x, y, 400, 48, GUI);
        this.parentContainer = parentContainer;
        this.labelText = labelText;
        
        this.fontSize = 32;
        this.font = createFont("arcade2020.ttf", fontSize);
        this.textY = getTextY();
        
        super.margin = 20;
        
        super.registerLabel(this);
    }
    
    Label(int x, int y, int w, String labelText, Container parentContainer, GraphicalUserInterface GUI) {
        super(x, y, w, 48, GUI);
        this.parentContainer = parentContainer;
        this.labelText = labelText;
        
        this.fontSize = 32;
        this.font = createFont("arcade2020.ttf", fontSize);
        this.textY = getTextY();
        super.margin = 20;
        
        super.registerLabel(this);
    }
    
    @Override
    void update() {}
    
    @Override
    void display() {
        fill(super.bgColor);
        stroke(super.strokeColor);
        strokeWeight(5);
        rect(super.x, super.y, super.w, super.h, 0, 0, 50, 0);
        
        textSize(this.fontSize);
        textFont(this.font);
        textAlign(BASELINE, BASELINE);
        fill(255);
        text(this.labelText, this.x + super.padding, this.textY);
    }
}
