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

int getLabelIndex(Label l) {
    String s = l.labelText;
    for (int i = 0; i < l.GUI.labels.size(); i++) {
        if (l.GUI.labels.get(i).labelText == s) {
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

int placedBelow(Label l) {
    int originIndex = getLabelIndex(l);
    int originY = l.GUI.labels.get(originIndex).y;
    int y = originY + l.margin + l.h;
    return y;
}
