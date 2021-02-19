class Container extends GUIElement {
    String name;
    
    Container(int x, int y, int w, int h, String name, GraphicalUserInterface GUI) {
        super(x, y, w, h, GUI);
        this.name = name;
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
}
