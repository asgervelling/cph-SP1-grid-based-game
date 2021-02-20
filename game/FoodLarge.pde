class FoodLarge extends Food {
    /* A larger piece of food that's easier to get, because it's four pieces of regular food. */
    Food[] foods = new Food[4];
    
    FoodLarge (int x, int y, Player player) {
        super(x, y, player);
        this.player = player;
    }
}
