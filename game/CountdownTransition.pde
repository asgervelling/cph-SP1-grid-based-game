class CountdownTransition extends Transition {
    int fontSize;
    float radians;
    int centerX;
    int centerY;
    
    CountdownTransition() {
        super(120);
        this.fontSize = 73;
        this.radians = 0;
        this.centerX = width / 2;
        this.centerY = height / 2;
    }
    
    @Override
    void update() {
        if (scene == "game") {
            super.timeLeft--;
            this.radians += TWO_PI / (super.duration / 3);
        }
    }
    
    @Override
    void display() {
        displayMovieCircle();
        displayText();
    }
    
    void displayMovieCircle() {
        noFill();
        int r = 125;
        strokeWeight(2);
        stroke(40);
        ellipse(centerX, centerY, (r - 20) * 2, (r - 20) * 2);
        strokeWeight(5);
        stroke(0);
        ellipse(centerX, centerY, r * 2, r * 2);
        
        float peripheralX = centerX + r * cos(radians);
        float peripheralY = centerY + r * sin(radians);
        line((float)centerX, (float)centerY, peripheralX, peripheralY);

    }
    
    void displayText() {
        textFont(super.font);
        textSize(fontSize);
        textAlign(CENTER, CENTER);
        fill(0);
        int third = super.duration / 3;
        if (super.timeLeft > third * 2) {
            text("3", centerX, centerY);
        } else if (super.timeLeft > third) {
            text("2", centerX, centerY);
        } else {
            text("1", centerX, centerY);
        }
    }
}
