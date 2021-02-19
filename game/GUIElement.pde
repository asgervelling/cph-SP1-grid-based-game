abstract class GUIElement {
    int x, y, w, h;
    PFont font;
    color bgColor;
    color strokeColor;
    int margin, padding;
    
    GraphicalUserInterface GUI;
    
    GUIElement(int x, int y, int w, int h, GraphicalUserInterface GUI) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.font = createFont("arcade2020.ttf", 32);
        this.GUI = GUI;
        this.bgColor = color(0);
        this.strokeColor = color(255);
        this.margin = 30;
        this.padding = 20;
        
        registerElement();
        
    }
    
    abstract void update();
    abstract void display();
    
    void registerButton(Button b) {
        GUI.buttons.add(b);
    }
    
    void registerElement() {
        GUI.elements.add(this);
    }
    
    void setFontSize(int size) {
        font = createFont("arcade2020.ttf", size);
    }
    
    // Layout
    void placeBelow(GUIElement element) {
        int newX = element.x;
        int newY = element.y + element.h + this.margin;
        this.x = newX;
        this.y = newY;
    }
    
    void placeAbove(GUIElement element) {
        int newX = element.x;
        int newY = element.y - element.h - this.margin;
        this.x = newX;
        this.y = newY;
    }
    
    void placeLeftOf(GUIElement element) {
        int newX = element.x - element.h - this.margin;
        int newY = element.y;
        this.x = newX;
        this.y = newY;
    }
    
    void placeRightOf(GUIElement element) {
        int newX = element.x + element.w + this.margin;
        int newY = element.y;
        this.x = newX;
        this.y = newY;
    }
}
