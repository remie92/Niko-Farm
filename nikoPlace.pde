void usingSeeds(String name, int tileX, int tileY) {
  switch(world[tileX][tileY]) {
    //case 0:
    //  world[tileX][tileY]=1;
    //  addInventory(1, "Grass");
    //  break;
  case 1:
    if (inventory.get("Seeds")>0) {
      removeInventory(1, "Seeds");
      world[tileX][tileY]=2;
    }
    break;
    //case 6:
    //  addInventory(1, "Wheat");
    //  addInventory(2, "Seeds");
    //  world[tileX][tileY]=1;
    //  break;
  }
}



void usingGrass(String name, int tileX, int tileY) {
  switch(world[tileX][tileY]) {
  case 1:
    world[tileX][tileY]=0;
    removeInventory(1, "Grass");
    break;
  }
}


void usingHoe(String name, int tileX, int tileY) {
  switch(world[tileX][tileY]) {
  case 0:
    world[tileX][tileY]=1;
    addInventory(1, "Grass");
    break;

  case 6:
    addInventory(1, "Wheat");
    addInventory(2, "Seeds");
    world[tileX][tileY]=1;
    break;
  }
}
