class PlayerStats {
    /* Stats that are reset when the program is closed/opened. Initialize only once. */
    String username;
    int health, points;
    
    PlayerStats () {
        this.username = "none";
        this.health = 3;
        this.points = 0;
    }
    
    boolean tutorialNeeded(String configFile) {
        try {
            Scanner s = new Scanner(new File(dataPath(configFile)));
            while (s.hasNext()) {
                println("tutorialNeeded()");
                String[] parts = s.next().split(":");
                String configVar = parts[0];
                boolean value = Boolean.parseBoolean(parts[1].substring(0, parts[1].length() - 1));
                if (!(configVar.contains("username"))) {
                    return value;
                }
            }
            s.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return true;
    }
    
    String getUsernameFromConfig(String configFile) {
        try {
            Scanner s = new Scanner(new File(dataPath(configFile)));
            int getUsername = 0;
            while (s.hasNext()) {
                String[] parts = s.next().split(":");
                String configVar = parts[0];
                String value = parts[1].substring(0, parts[1].length() - 1);
                if ((configVar.equals("username"))) {
                    return value;
                }
                println("getUsername: " + getUsername);
                getUsername++;
            }
            s.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        println("playerStats.getUsernameFromConfig(): this line should not be printed");
        return "";
    }
    
    void writeConfig(String username, boolean tutorialNeeded, String configFile) {
        try {
            FileWriter writer = new FileWriter(dataPath(configFile));
            BufferedWriter buffer = new BufferedWriter(writer);
            writer.write(String.format("username:%s;\ntutorialNeeded:%s;", username, Boolean.toString(tutorialNeeded)));
            
            buffer.close();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

/*
void addScore(String name, int score) {
        try {
            FileWriter writer = new FileWriter(dataPath(file));
            BufferedWriter buffer = new BufferedWriter(writer);
            for (int j = 0; j < sortedNames.size(); j++) {
                writer.write(String.format("%s:%d;\n", sortedNames.get(j), sortedScores.get(j)));
            }
            
            buffer.close();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
*/
