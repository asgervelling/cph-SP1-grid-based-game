class Container extends GUIElement {
    String name;
    
    Container(int x, int y, int w, int h, String name, GraphicalUserInterface GUI) {
        super(x, y, w, h, GUI);
        this.name = name;
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
}
