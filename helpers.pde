boolean mouseIn(float x, float y, float sx, float sy) {
  return mouseX>x&&mouseY>y&&mouseX<x+sx&&mouseY<y+sy;
}

void loadData() {

  titleNiko=loadImage("data/title/niko title.png");
  titleBackground=loadImage("data/title/titlebackground.png");
  itemNames=loadStrings("data/items/itemlist.txt");
  itemImages=new PImage[itemNames.length];
  for (int i=0; i<itemNames.length; i++) {
    itemImages[i]=loadImage("data/items/"+itemNames[i]+".png");    //load images in array based on names
  }


  animalNames=loadStrings("data/entity/names.txt");
  animalImages=new PImage[animalNames.length];
  for (int i=0; i<animalNames.length; i++) {
    animalImages[i]=loadImage("data/entity/"+animalNames[i]+".png");    //load images in array based on names
  }
  if (!nikoRoomba) {
    nikoSheet=loadImage("data/niko.png");
  } else {
    nikoSheet=loadImage("data/niko_roomba.png");
  }
  tileSheet=loadImage("data/tile.png");
  for (int i=0; i<tileImages.length; i++) {
    tileImages[i]= tileSheet.get(i*24, 0, 24, 48);      //turn tileSheet into array of PImages
  }
}


boolean isSolid(int type) {
  int[] solid={
    9, 
    10, 
    11, 
    12, 
    13, 
    14,
    15,16,17
  };

  for (int i=0; i<solid.length; i++) {
    if (type==solid[i]) {
      return true;
    }
  }
  return false;
}

void addInventory(int amount, String name) {
  if (inventory.hasKey(name)) {
    inventory.set(name, inventory.get(name)+amount);
    if (inventory.get(name)==0) {
      inventory.remove(name);
    }
  } else {
    inventory.set(name, amount);
  }
}

boolean hasInventory(int amount, String name) {
  String[] keys=inventory.keyArray();

  int index=getIndex(name, keys);
  if (index==-1) {
    return false;
  }
  if (amount<=inventory.get(name)) {
    return true;
  }

  return false;
}


void mouseWheel(MouseEvent event) {
  int dir = event.getCount();
  selectedItem+=dir;
  if (selectedItem<0) {
    selectedItem=0;
  }
  if (selectedItem>=inventory.size()) {
    selectedItem=inventory.size()-1;
  }
}


void removeInventory(int amount, String name) {
  addInventory(amount*-1, name);
}


void drawInventory() {
  String[] keys=inventory.keyArray();
  fill(0);
  textAlign(LEFT);
  textSize(spriteScale*10);
  for (int i=0; i<keys.length; i++) {
    fill(0);
    text(keys[i]+": "+inventory.get(keys[i]), spriteScale*20, i*spriteScale*14+(spriteScale*12));
    fill(0, 0, 0, 100);
    noStroke();
    rect(spriteScale*5, i*spriteScale*14+(spriteScale*2), spriteScale*12, spriteScale*12);
    image(itemImages[getIndex(keys[i], itemNames)], spriteScale*5, i*spriteScale*14+(spriteScale*2), spriteScale*12, spriteScale*12);
    if (i==selectedItem) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    noStroke();
    rect(spriteScale*1, i*spriteScale*14+(spriteScale*2), spriteScale*3, spriteScale*12);
  }
}

boolean isInArray(int target, int[] array) {
  for (int value : array) {
    if (value == target) {
      return true; // Integer is found in the array
    }
  }
  return false; // Integer is not found in the array
}


int getIndex(String target, String[] array) {
  for (int i = 0; i < array.length; i++) {
    if (target.equals(array[i])) {
      return i;
    }
  }
  return -1; // Return -1 if the element is not found in the array
}
