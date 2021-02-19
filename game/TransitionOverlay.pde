class TransitionOverlay {
    int timeLeft;
    
    TransitionOverlay() {
        this.timeLeft = 90;
    }
    
    void update() {
        if (scene == "game") {
            timeLeft--;
        }
    }
    
    void display() {
        
    }
}
