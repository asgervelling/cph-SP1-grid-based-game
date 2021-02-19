abstract class Transition {
    int duration;
    int timeLeft;
    PFont font;
    
    Transition(int duration) {
        this.duration = duration; // in frames
        this.timeLeft = duration;
        this.font = createFont("arcade2020.ttf", 72);
    }
    
    abstract void update();
    abstract void display();
}
