void usingSeeds(String name, int tileX, int tileY) {
  switch(world[tileX][tileY]) {
    //case 0:
    //  world[tileX][tileY]=1;
    //  addInventory(1, "Grass");
    //  break;
  case farmId:
    if (inventory.get("Seeds")>0) {
      removeInventory(1, "Seeds");
      world[tileX][tileY]=farmId+1;
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
  case farmId:
    world[tileX][tileY]=grassId;
    removeInventory(1, "Grass");
    break;
  }
}


void usingHoe(String name, int tileX, int tileY) {
  switch(world[tileX][tileY]) {
  case grassId:
    world[tileX][tileY]=farmId;
    addInventory(1, "Grass");
    break;

  case lastWheatId:
    addInventory(1, "Wheat");
    addInventory(int(random(1, 4)), "Seeds");
    world[tileX][tileY]=farmId;
    break;
  }
}

void usingBucket(String name, int tileX, int tileY) {
  switch(world[tileX][tileY]) {
  case wellId:
    removeInventory(1, "Bucket");
    addInventory(1, "Water Bucket");
    break;
    case waterId:
        removeInventory(1, "Bucket");
    addInventory(1, "Water Bucket");
    world[tileX][tileY]=grassId;
    break;
  }
}
void usingWaterBucket(String name, int tileX, int tileY) {
  switch(world[tileX][tileY]) {
  case wellId:
    removeInventory(1, "Water Bucket");
    addInventory(1, "Bucket");
    break;
    case grassId:
    removeInventory(1, "Water Bucket");
    addInventory(1, "Bucket");
    
    world[tileX][tileY]=waterId;
    break;
  }
}

void usingWheat(String name, int tileX, int tileY) {
  switch(world[tileX][tileY]) {
  case crusherId:
    removeInventory(1, "Wheat");
    addInventory(1, "Flour");
    break;
  }
}
