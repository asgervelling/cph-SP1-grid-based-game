class Button extends GUIElement {
    
    Button(int x, int y, int w, int h, GraphicalUserInterface GUI) {
        super(x, y, w, h, GUI);
    }
    
    @Override
    void update() {
        fill(super.bgColor);
        stroke(super.strokeColor);
        strokeWeight(5);
        rect(super.x, super.y, super.w, super.h);
    }
    
    @Override
    void display() {}
    
    void onClick() {
        /* How to make higher order functions? */
    }
}
