class GraphicalUserInterface {
    ArrayList<GUIElement> elements;
    ArrayList<Button> buttons;
    ArrayList<Label> labels;
    Checkbox checkbox;
    TextField textField;
    
    GraphicalUserInterface() {
        this.elements = new ArrayList<GUIElement>();
        this.buttons = new ArrayList<Button>();
        this.labels = new ArrayList<Label>();
        this.checkbox = null;
        this.textField = null;
    }
    
    void update() {
        for (int i = 0; i < this.elements.size(); i++) {
            this.elements.get(i).update();
        }
        
        for (int i = 0; i < this.buttons.size(); i++) {
            this.buttons.get(i).onMouseHover();
        }
        if (this.checkbox != null) {
            this.checkbox.update();
        }
        if (this.textField != null) {
            this.textField.update();
        }
    }
    
    void display() {
        for (int i = 0; i < this.elements.size(); i++) {
            this.elements.get(i).display();
        }
        
    }
    
    void handleMousePressed() {
        for (int i = 0; i < this.buttons.size(); i++) {
            this.buttons.get(i).onMousePressed();
        }
        if (this.checkbox != null) {
            this.checkbox.onMousePressed();
        }
    }
    
    void handleMouseReleased() {
        for (int i = 0; i < this.buttons.size(); i++) {
            this.buttons.get(i).onMouseReleased();
        }
        if (this.checkbox != null) {
            this.checkbox.onMouseReleased();
        }
    }
}
