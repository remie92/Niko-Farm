void newGame() {
  gameState=1;
  int[][] world=new int[100][100];
  inventory = new IntDict();
  addInventory(5, "Seeds");
  addInventory(1, "Hoe");
  addInventory(1, "Bucket");
  smallHouse(3, 8);
  windmill(15, 8);

  well(25, 8);




}


void saveGame() {

  saveWorld();
  saveInventory();
}

void loadGame() {
  gameState=1;

  loadWorld();

  loadInventory();
}


void saveWorld() {

  int[] coords=new int[2];
  coords[0]=nikoX;
  coords[1]=nikoY;

  saveStrings("data/save/coords.txt", str(coords));

  //for (int i=0; i<world.length; i++) {
  //  int[] stripe=new int[0];
  //  for (int j=0; j<world[0].length; j++) {
  //    stripe=append(stripe,);
  //  }
  //}
  String[] objects = new String[0];

  for (int i = 0; i < world.length; i++) {
    for (int j = 0; j < world[i].length; j++) {
      if (world[i][j]!=0) {
        objects = append(objects, i+","+j+","+world[i][j]);
      }
    }
  }
  saveStrings("data/save/world.txt", objects);
}


void loadWorld() {


  int[] coords;
  coords= int(loadStrings("data/save/coords.txt"));

  nikoX=coords[0];
  nikoY=coords[1];

  world=new int[100][100];


  String[] objects = loadStrings("data/save/world.txt");
  for (int i = 0; i < objects.length; i++) {
    String[] info=split(objects[i], ',');
    world[int(info[0])][int(info[1])]=int(info[2]);
    println(info);
  }
}

void saveInventory() {
  String[] keys=inventory.keyArray();
  String[] saveInventory=new String[0];
  for (int i=0; i<keys.length; i++) {
    saveInventory=append(saveInventory, keys[i]+","+inventory.get(keys[i]));
  }
  saveStrings("data/save/inventory.txt", saveInventory);
}

void loadInventory() {
  inventory = new IntDict();
  String[] saveInventory=loadStrings("data/save/inventory.txt");
  for (int i=0; i<saveInventory.length; i++) {
    String[] split=split(saveInventory[i], ",");
    inventory.add(split[0], int(split[1]));
  }
}
