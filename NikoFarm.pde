//sprite x: 24
//sprite y: 32
PImage nikoSheet;
float spriteScale=5;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean shiftPressed=false;

int[][] world=new int[100][100];
PImage tileSheet;
int tileAmount=15;
PImage[] tileImages=new PImage[tileAmount];

PImage[] itemImages;
String[] itemNames;
IntDict inventory;

PImage titleBackground;
PImage titleNiko;

int selectedItem=0;

int gameState=0;

final int grassId=0;
final int farmId=1;
final int lastWheatId=8;
final int brickId=9;
final int woodId=10;
final int windId=11;
final int crusherId=12;
final int waterId=13;
final int wellId=14;


nikoController nikoController=new nikoController();
void setup() {
  loadData();
  fullScreen();
  noSmooth();
  //  spriteScale=height/216.0;

  //for (int i=2; i<10; i++) {        //adds random dirt
  //  for (int j=2; j<10; j++) {
  //    if (random(1)>0.2) {
  //      world[i][j]=1;
  //    }
  //  }
  //}
}

void draw() {
  if (gameState==0) {
    image(titleBackground, 0, 0, width, height);
    fill(0, 0, 0, 100);
    noStroke();
    // rect(int(width*0.65),int(height*0.28),int(width*0.22),int(spriteScale*16));
    //  rect(int(width*0.65),int(height*0.43),int(width*0.32),int(spriteScale*16));
    textSize(spriteScale*16);
    fill(#FAE332);
    text("New Game", width*0.65, height*0.35);
    text("Load Last Game", width*0.65, height*0.5);
    // image(titleNiko,width*0.7,height*0.3,width*0.2,height*0.4);
  }
  if (gameState==1) {
    if (frameCount%(60*10)==0) {
      saveGame();
    }
    background(128, 128, 255);
    drawMap();
    nikoController.tick();
    nikoController.draw();
    worldTick();
    drawInventory();
    if (selectedItem<0) {
      selectedItem=0;
    }
    if (selectedItem>=inventory.size()) {
      selectedItem=inventory.size()-1;
    }
  }
}



int randomTick=100;    //blocks per ten thousand
float randomChance=0.1;

void worldTick() {
  int total=(randomTick*world.length*world[0].length)/10000;
  for (int z=0; z<total; z++) {
    if (random(1)<randomChance) {
      int tileX=int(random(0, world.length-0.01));
      int tileY=int(random(0, world[0].length-0.01));

      switch(world[tileX][tileY]) {
      case 2:
        world[tileX][tileY]=3;
        break;
      case 3:
        world[tileX][tileY]=4;
        break;
      case 4:
        world[tileX][tileY]=5;
        break;
      case 5:
        world[tileX][tileY]=6;
        break;
      case 6:
        world[tileX][tileY]=7;
        break;
      case 7:
        world[tileX][tileY]=8;
        break;
      }
    }
  }
}


void drawMap() {
  int totalX=nikoX*24+nikoController.inbetweenX;
  int totalY=nikoY*24+nikoController.inbetweenY;


  for (int i=0; i<world.length; i++) {
    for (int j=0; j<world[0].length; j++) {
      if (rectanglesIntersect((-totalX)*spriteScale+i*spriteScale*24, (-totalY-24)*spriteScale+j*spriteScale*24, 24 * spriteScale, 48 * spriteScale, 0, 0, width, height)) {
        try {
          int type=world[i][j];
          PImage tile = tileImages[type];
          image(tile, (-totalX)*spriteScale+i*spriteScale*24, (-totalY-24)*spriteScale+j*spriteScale*24, 24 * spriteScale, 48 * spriteScale);
        }
        catch(Exception e) {
        }
      }
    }
  }
}

boolean rectanglesIntersect(float x1, float y1, float width1, float height1, float x2, float y2, float width2, float height2) {
  // Calculate the right and bottom coordinates of each rectangle
  float x1_right = x1 + width1;
  float y1_bottom = y1 + height1;
  float x2_right = x2 + width2;
  float y2_bottom = y2 + height2;

  // Check if rectangle 1 is to the left of rectangle 2
  if (x1_right < x2) {
    return false;
  }

  // Check if rectangle 1 is to the right of rectangle 2
  if (x1 > x2_right) {
    return false;
  }

  // Check if rectangle 1 is above rectangle 2
  if (y1_bottom < y2) {
    return false;
  }

  // Check if rectangle 1 is below rectangle 2
  if (y1 > y2_bottom) {
    return false;
  }

  // If none of the above conditions are met, the rectangles intersect
  return true;
}








void keyPressed() {


  if (key == 'w') {
    upPressed = true;
  } else if (key == 's') {
    downPressed = true;
  } else if (key == 'a') {
    leftPressed = true;
  } else if (key == 'd') {
    rightPressed = true;
  } else if (keyCode==SHIFT) {
    shiftPressed = true;
  }
}

void keyReleased() {
  if (key == 'w') {
    upPressed = false;
  } else if (key == 's') {
    downPressed = false;
  } else if (key == 'a') {
    leftPressed = false;
  } else if (key == 'd') {
    rightPressed = false;
  } else if (keyCode==SHIFT) {
    shiftPressed = false;
  }
}
