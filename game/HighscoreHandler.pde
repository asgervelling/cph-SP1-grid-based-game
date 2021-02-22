class HighscoreHandler {
    String file;
    ArrayList<String> sortedNames;
    ArrayList<Integer> sortedScores;
    
    HighscoreHandler(String file) {
        this.file = file;
        this.sortedNames = new ArrayList<String>();
        this.sortedScores = new ArrayList<Integer>();
    }
    
    void addScore(String name, int score) {
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
    /*
    HashMap<String, Integer> loadHighscores() {
        HashMap<String, Integer> hsMap = new HashMap<String, Integer>();
        // The scanner must be initialized, but it must also catch the exception - a paradox, hence the temporary "System.in".
        Scanner s = new Scanner(System.in);
        try {
            // The undocumented dataPath() method tells File() to look inside the /data folder
            s = new Scanner(new File(dataPath(file)));
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        while(s.hasNext()) {
            try {
                String[] parts = s.next().split(":");
                String part0 = parts[0];
                String part1 = parts[1].substring(0, parts[1].length() - 1);
                hsMap.put(part0, Integer.parseInt(part1));
            } catch (ArrayIndexOutOfBoundsException e) {
                e.printStackTrace();
            }
        }
        
        return hsMap;
    }
    */
}
