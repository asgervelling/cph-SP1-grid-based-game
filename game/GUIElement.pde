abstract class GUIElement {
    int x, y, w, h;
    color bgColor;
    color strokeColor;
    int margin, padding;
    
    GraphicalUserInterface GUI;
    
    GUIElement(int x, int y, int w, int h, GraphicalUserInterface GUI) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.GUI = GUI;
        this.bgColor = color(0);
        this.strokeColor = color(255);
        this.margin = 30;
        this.padding = 30;
        
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
}
