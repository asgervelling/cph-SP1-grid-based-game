class HighscoreHandler {
    String file;
    ArrayList<String> sortedNames;
    ArrayList<Integer> sortedScores;
    
    HighscoreHandler() {
        this.file = "highscores.txt";
        this.sortedNames = new ArrayList<String>();
        this.sortedScores = new ArrayList<Integer>();
    }
    
    void addScore(String name, int score) {
        if (score == 0) {
            return;
        }
        this.loadHighscores();

        try {            
            // Add to ArrayLists
            
            int index = 0;
            while (score <= this.sortedScores.get(index)) {
                index++;
            }
            this.sortedNames.add(index, name);
            this.sortedScores.add(index, score);
            
            
            // Add to text file
            
            FileWriter writer = new FileWriter(dataPath(file));
            BufferedWriter buffer = new BufferedWriter(writer);
            for (int i = 0; i < this.sortedNames.size(); i++) {
                writer.write(String.format("%s:%d;\n", this.sortedNames.get(i), this.sortedScores.get(i)));
            }
            
            buffer.close();
            writer.close();
            
        } catch (Exception e) {
            println("HighscoreHandler.addScore() failed");
            e.printStackTrace();
        }
    }
    
    void loadHighscores() {
        this.sortedNames = new ArrayList<String>();
        this.sortedScores = new ArrayList<Integer>();
        try {
            Scanner s = new Scanner(new File(dataPath(file)));
            while(s.hasNext()) {
                String[] parts = s.next().split(":");
                String part0 = parts[0];
                int part1 = Integer.parseInt(parts[1].substring(0, parts[1].length() - 1));
                this.sortedNames.add(part0);
                this.sortedScores.add(part1);
            }
        } catch (IOException e) {
            e.printStackTrace();
            println("HighscoreHandler.loadHighscores() failed");
        }
    }
    
}
