class HighscoreHandler {
    String file;
    
    HighscoreHandler(String file) {
        this.file = file;
    }
    
    HashMap<String, Integer> loadHighscores() {
        HashMap<String, Integer> hsMap = new HashMap<String, Integer>();
        // The scanner must be initialized, but it must also catch the exception - a paradox, hence the temporary "System.in".
        Scanner s = new Scanner(System.in);
        try {
            // The undocumented dataPath() method tells File() to look inside the /data folder
            s = new Scanner(new File(dataPath(file)));
        } catch (FileNotFoundException e) {
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
}
