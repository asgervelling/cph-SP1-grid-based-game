class GraphicalUserInterface {
    ArrayList<GUIElement> elements;
    
    GraphicalUserInterface() {
        elements = new ArrayList<GUIElement>();
    }
    
    void update() {
        for (int i = 0; i < elements.size(); i++) {
            elements.get(i).update();
        }
    }
    
    void display() {
        for (int i = 0; i < elements.size(); i++) {
            elements.get(i).display();
        }
    }
}
