abstract class GUIElement {
    int x, y, w, h;
    PFont font;
    color bgColor;
    color strokeColor;
    
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
        
        GUI.elements.add(this);
    }
    
    abstract void update();
    abstract void display();
    
    void setFontSize(int size) {
        font = createFont("arcade2020.ttf", size);
    }
}
