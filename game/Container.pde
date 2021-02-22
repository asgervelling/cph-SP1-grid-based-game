class Container extends GUIElement {
    color shadowColor;
    int shadowSize;
    
    Container(int x, int y, int w, int h, GraphicalUserInterface GUI) {
        super(x, y, w, h, GUI);
        this.shadowColor = color(0, 0, 0, 150);
        this.shadowSize = 12;
    }
    
    @Override
    void update() {
        
    }
    
    @Override
    void display() {
        noStroke();
        fill(this.shadowColor);
        rect(super.x + shadowSize, super.y + shadowSize, super.w, super.h, 50, 0, 50, 0);
        
        fill(super.bgColor);
        stroke(super.strokeColor);
        strokeWeight(5);
        rect(super.x, super.y, super.w, super.h, 50, 0, 50, 0);
    }
}
