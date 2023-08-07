float randomAnimalChance=0.001;
float randomMoveChance=0.01;
float animalSpeed=0.2;

class animal {
  boolean randomMove;
  float x;  //1 block/24
  float y;
  String name;
  int touchId;
  //0=nothing
  //1=giveEgg
  int randomId;
  //0=nothing
  //1=spawnEgg
  int clickId;
  //0=nothing
  //1=giveMilkBucket

  boolean delete=false;

  PVector move=new PVector(random(-animalSpeed, animalSpeed), random(-animalSpeed, animalSpeed));
  ;
  boolean isMoving=false;

  animal(int px, int py, String pname) {
    x=px;
    y=py;
    name=pname;
    switch(name) {
    case "chicken":
      randomMove=true;
      touchId=0;
      randomId=1;
      clickId=0;
      break;
    case "egg":
      randomMove=false;
      touchId=1;
      randomId=0;
      clickId=0;
      break;
    case "cow":
      randomMove=true;
      touchId=0;
      randomId=0;
      clickId=1;
      break;
    }
  }

  void click() {  //called in nikoController: Does something when clicked on
    String[] keys=inventory.keyArray();
    switch(clickId) {
    case 1:

      if (keys[selectedItem].equals("Bucket")) {
        removeInventory(1, "Bucket");
        addInventory(1, "Milk Bucket");
      }
    }
  }

  void tick() {
    if (random(1)<randomAnimalChance) {
      switch(randomId) {
      case 1:  //spawn egg
        animals.add(new animal(int(x), int(y), "egg"));
        break;
      }
    }

    if (dist( (x)*spriteScale-(nikoX*spriteScale*24)-(nikoController.inbetweenX*spriteScale), (y+12)*spriteScale-(nikoY*spriteScale*24)-(nikoController.inbetweenY*spriteScale), int((width/2)/(24*spriteScale)-1)*24*spriteScale+(12*spriteScale), (int((height/2)/(24*spriteScale))-0.5)*24*spriteScale+(16*spriteScale))<20*spriteScale) {  //do something if nikos touches it
      switch(touchId) {
      case 1:
        delete=true;
        addInventory(1, "Egg");
        break;
      }
    }

    if (random(1)<randomMoveChance&&randomMove) {    //change movement direction and if it moves based on randomMoveChance
      isMoving=!isMoving;
      move=new PVector(random(-animalSpeed, animalSpeed), random(-animalSpeed, animalSpeed));
    }
    if (randomMove) {      //add move Vector to x and y
    try{
      if (isSolid(world[int(x/24)+1][int(y/24)])&&move.x>0) {
        move.x=0;
      }
      if (isSolid(world[int(x/24)-1][int(y/24)])&&move.x<0) {
        move.x=0;
      }
      if (isSolid(world[int(x/24)][int(y/24)+1])&&move.y>0) {
        move.y=0;
      }
      if (isSolid(world[int(x/24)][int(y/24)-1])&&move.y<0) {
        move.y=0;
      }
    } catch(ArrayIndexOutOfBoundsException e){}
      x+=move.x*spriteScale/5;
      y+=move.y*spriteScale/5;
      if (x<0) {
        move.x*=-1;
      }
      if (y<0) {
        move.y*=-1;
      }
      if (x>world.length*24) {
        move.x*=-1;
      }
      if (y>world[0].length*24) {
        move.y*=-1;
      }
    }
  }


  void draw() {
    pushMatrix();
    translate(x*spriteScale-(nikoX*spriteScale*24)-(nikoController.inbetweenX*spriteScale), y*spriteScale-(nikoY*spriteScale*24)-(nikoController.inbetweenY*spriteScale));
    if (move.x>=0) {
      scale(-1, 1);
    }
    if (move.x<0) {
      scale(1, 1);
    }

    image(animalImages[getIndex(name, animalNames)], -12*spriteScale, 0, 24*spriteScale, 24*spriteScale);
    popMatrix();
    circle(int((width/2)/(24*spriteScale)-1)*24*spriteScale+(12*spriteScale*24), (int((height/2)/(24*spriteScale))-0.5)*24*spriteScale, 50);
  }
}
