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

void usingFlour(String name, int tileX, int tileY) {
  switch(world[tileX][tileY]) {
  case mixerId:
    if (hasInventory(1, "Milk Bucket")&&hasInventory(1, "Egg")) {
      removeInventory(1, "Egg");
      removeInventory(1, "Milk Bucket");
      addInventory(1, "Bucket");
      addInventory(1, "Pancake Batter");
    }
    break;
  }
}

void usingPancakeBatter(String name, int tileX, int tileY) {
  switch(world[tileX][tileY]) {
  case ovenId:
    removeInventory(1, "Pancake Batter");
    addInventory(1, "Pancake");
    break;
  }
}

void usingPancake(String name, int tileX, int tileY) {
  switch(world[tileX][tileY]) {
  case shopId:
    removeInventory(1, "Pancake");
    addInventory(1, "Normal Builder");
    addInventory(1, "Interactive Builder");
    break;
  }
}

void usingHammer(String name, int tileX, int tileY) {
  if (isInArray(world[tileX][tileY], tileIndex)) {
    if (isInArray(world[tileX][tileY], tileInteractive)) {
      addInventory(1, "Interactive Builder");
    }
    if (!isInArray(world[tileX][tileY], tileInteractive)) {
      addInventory(1, "Normal Builder");
    }
    world[tileX][tileY]=grassId;
  }
  //switch(world[tileX][tileY]) {
  //case ovenId:
  //  removeInventory(1, "Pancake Batter");
  //  addInventory(1, "Pancake");
  //  break;
  //}
}

void usingBuilder(String name, int tileX, int tileY) {
  if (name.equals("Interactive Builder")&&isInArray(tileIndex[selectedTile], tileInteractive)) {
    if (world[tileX][tileY]==grassId) {
      world[tileX][tileY]=tileIndex[selectedTile];
      removeInventory(1, "Interactive Builder");
    }
  }
  if (name.equals("Normal Builder")&&!isInArray(tileIndex[selectedTile], tileInteractive)) {
    if (world[tileX][tileY]==grassId) {
      world[tileX][tileY]=tileIndex[selectedTile];
      removeInventory(1, "Normal Builder");
    }
  }
}
