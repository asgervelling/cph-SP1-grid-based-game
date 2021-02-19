/* Cannot call instance methods in constructors. Use these instead. */

int getButtonIndex(Button b) {
    /* Look at the ArrayList of buttons and get the index of 
     the button whose text == s
     */
    String s = b.btnText;
    for (int i = 0; i < b.GUI.buttons.size(); i++) {
        if (b.GUI.buttons.get(i).btnText == s) {
            return i;
        }
    }
    return -1;
}

int placedBelow(Button b) {
    int originIndex = getButtonIndex(b);
    int originY = b.GUI.buttons.get(originIndex).y;
    int y = originY + b.margin + b.h;
    return y;
}
