class Button extends GUIElement {
    Container parentContainer;
    String btnText;
    
    Button(int x, int y, String btnText, Container parentContainer, GraphicalUserInterface GUI) {
        super(x, y, 400, 100, GUI);
        this.parentContainer = parentContainer;
        this.btnText = btnText;
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
    }
    
    void onMouseHover() {
        if (!mouseInsideRect(this.x, this.y, this.w, this.h)) {
            return;
        }
        //println("Hovering over button at y == " + this.y);
    }
    
    void onMousePressed() {
        if (!mouseInsideRect(this.x, this.y, this.w, this.h)) {
            return;
        }
        println("Pressed button at y == " + this.y);
    }
    
    void onMouseReleased() {
        if (!mouseInsideRect(this.x, this.y, this.w, this.h)) {
            return;
        }
        println("Released button at y == " + this.y);
    }
}
