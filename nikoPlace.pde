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
    addInventory(int(random(1, 4)), "Seeds");
    world[tileX][tileY]=1;
    break;
  }
}

void usingBucket(String name, int tileX, int tileY) {
  switch(world[tileX][tileY]) {
  case 12:
    removeInventory(1, "Bucket");
    addInventory(1, "Water Bucket");
    break;
    case 11:
        removeInventory(1, "Bucket");
    addInventory(1, "Water Bucket");
    world[tileX][tileY]=1;
    break;
  }
}
void usingWaterBucket(String name, int tileX, int tileY) {
  switch(world[tileX][tileY]) {
  case 12:
    removeInventory(1, "Water Bucket");
    addInventory(1, "Bucket");
    break;
    case 0:
    removeInventory(1, "Water Bucket");
    addInventory(1, "Bucket");
    
    world[tileX][tileY]=11;
    break;
  }
}

void usingWheat(String name, int tileX, int tileY) {
  switch(world[tileX][tileY]) {
  case 10:
    removeInventory(1, "Wheat");
    addInventory(1, "Flour");
    break;
  }
}
