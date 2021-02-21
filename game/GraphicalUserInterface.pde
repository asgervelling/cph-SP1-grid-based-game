class GraphicalUserInterface {
    ArrayList<GUIElement> elements;
    ArrayList<Button> buttons;
    ArrayList<Label> labels;
    Checkbox checkbox;
    TextField textField;
    
    GraphicalUserInterface() {
        elements = new ArrayList<GUIElement>();
        buttons = new ArrayList<Button>();
        labels = new ArrayList<Label>();
        this.checkbox = null;
        this.textField = null;
    }
    
    void update() {
        for (int i = 0; i < elements.size(); i++) {
            elements.get(i).update();
        }
        
        for (int i = 0; i < buttons.size(); i++) {
            buttons.get(i).onMouseHover();
        }

    }
    
    void display() {
        for (int i = 0; i < elements.size(); i++) {
            elements.get(i).display();
        }
        
    }
    
    void handleMousePressed() {
        for (int i = 0; i < buttons.size(); i++) {
            buttons.get(i).onMousePressed();
        }
    }
    
    void handleMouseReleased() {
        for (int i = 0; i < buttons.size(); i++) {
            buttons.get(i).onMouseReleased();
        }
    }
}
