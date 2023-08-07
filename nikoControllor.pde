int nikoX=0;
int nikoY=0;

int tileSize=24;


void mouseReleased() {
  if (gameState==0) {
    if (mouseIn(int(width*0.65), int(height*0.28), int(width*0.22), int(spriteScale*16))) {
      newGame();
    }
    if (mouseIn(int(width*0.65), int(height*0.43), int(width*0.32), int(spriteScale*16))) {
      loadGame();
    }
  }
  if (gameState==1) {
    nikoController.click();
    saveGame();
  }
  //  println(world[100-5][100-7]);
}

int[] screenToTile() {

  int totalX=nikoX*24+nikoController.inbetweenX;
  int totalY=nikoY*24+nikoController.inbetweenY;
  int[] coord={
    int((totalX+(mouseX/spriteScale))/24), int((totalY+(mouseY/spriteScale))/24)
  };
  return coord;
}

class nikoController {
  int inbetweenX=0;
  int inbetweenY=0;
  int inbetween=0;
  boolean moving=false;
  int direction=2;
  nikoController() {
  }


  void click() {
    if (mouseButton==LEFT&&dist(int((width/2)/(24*spriteScale)-1)*24*spriteScale+(12*spriteScale), (int((height/2)/(24*spriteScale))-0.5)*24*spriteScale+(16*spriteScale), mouseX, mouseY)<spriteScale*100&&dist(int((width/2)/(24*spriteScale)-1)*24*spriteScale+(12*spriteScale), (int((height/2)/(24*spriteScale))-0.5)*24*spriteScale+(16*spriteScale), mouseX, mouseY)>spriteScale*24) {
      int totalX=nikoX*24+nikoController.inbetweenX;
      int totalY=nikoY*24+nikoController.inbetweenY;
      try {
        int[] screenCoord=screenToTile();
        int tileX=screenCoord[0];
        int tileY=screenCoord[1];
        switch(inventory.keyArray()[selectedItem]) {
        case "Seeds":
          usingSeeds(inventory.keyArray()[selectedItem], tileX, tileY);
          break;
        case "Grass":
          usingGrass(inventory.keyArray()[selectedItem], tileX, tileY);
          break;
        case "Hoe":
          usingHoe(inventory.keyArray()[selectedItem], tileX, tileY);
          break;
        case "Wheat":
          usingWheat(inventory.keyArray()[selectedItem], tileX, tileY);
          break;
        case "Bucket":
          usingBucket(inventory.keyArray()[selectedItem], tileX, tileY);
          break;
        case "Water Bucket":
          usingWaterBucket(inventory.keyArray()[selectedItem], tileX, tileY);
          break;
        case "Flour":
          usingFlour(inventory.keyArray()[selectedItem], tileX, tileY);
          break;
        case "Pancake Batter":
          usingPancakeBatter(inventory.keyArray()[selectedItem], tileX, tileY);
          break;
        case "Normal Builder":
          usingBuilder(inventory.keyArray()[selectedItem], tileX, tileY);
          break;
        case "Interactive Builder":
          usingBuilder(inventory.keyArray()[selectedItem], tileX, tileY);
          break;
        case "Pancake":
          usingPancake(inventory.keyArray()[selectedItem], tileX, tileY);
          break;
        case "Hammer":
          usingHammer(inventory.keyArray()[selectedItem], tileX, tileY);
          break;
        }
      }
      catch(Exception e) {
      }
      for (int i = 0; i < animals.size(); i++) {  //draw all the animals/entitys
        animal part = animals.get(i);
        if (dist((part.x+12)*spriteScale-(nikoX*spriteScale*24)-(nikoController.inbetweenX*spriteScale), (part.y+12)*spriteScale-(nikoY*spriteScale*24)-(nikoController.inbetweenY*spriteScale), mouseX, mouseY)<100) {
          part.click();
        }
        animals.set(i, part);
      }
    }
  }

  void tick() {
    if (moving==false) {

      int offsetX=int(width/2)/int(24*spriteScale)-1;
      int offsetY=int(height/2)/int(24*spriteScale);
      if (nikoY+offsetY>0) {
        if (upPressed&&isSolid(world[nikoX+offsetX][nikoY+offsetY-1])==false) {
          moving=true;
          direction=0;
        }
      }
      if (nikoX+offsetX<world.length) {
        if (rightPressed&&isSolid(world[nikoX+offsetX+1][nikoY+offsetY])==false) {
          moving=true;
          direction=1;
        }
      }
      if (nikoY+offsetY<world[0].length) {
        if (downPressed&&isSolid(world[nikoX+offsetX][nikoY+offsetY+1])==false) {
          moving=true;
          direction=2;
        }
      }
      if (nikoX+offsetX>0) {
        if (leftPressed&&isSolid(world[nikoX+offsetX-1][nikoY+offsetY])==false) {
          moving=true;
          direction=3;
        }
      }
    }
    if (moving) {
      inbetween+=1;
      switch(direction) {
      case 0:
        inbetweenY=-inbetween;
        if (inbetween==24) {
          nikoY-=1;
        }
        break;
      case 1:
        inbetweenX=inbetween;
        if (inbetween==24) {
          nikoX+=1;
        }
        break;
      case 2:
        inbetweenY=inbetween;
        if (inbetween==24) {
          nikoY+=1;
        }
        break;
      case 3:
        inbetweenX=-inbetween;
        if (inbetween==24) {
          nikoX-=1;
        }
        break;
      }
      if (inbetween>=24) {
        moving=false;
        inbetween=0;
        inbetweenX=0;
        inbetweenY=0;
        int offsetX=int(width/2)/int(24*spriteScale)-1;
        int offsetY=int(height/2)/int(24*spriteScale);
        if (nikoY+offsetY>0) {
          if (upPressed&&isSolid(world[nikoX+offsetX][nikoY+offsetY-1])==false) {
            moving=true;
            direction=0;
          }
        }
        if (nikoX+offsetX<world.length) {
          if (rightPressed&&isSolid(world[nikoX+offsetX+1][nikoY+offsetY])==false) {
            moving=true;
            direction=1;
          }
        }
        if (nikoY+offsetY<world[0].length) {
          if (downPressed&&isSolid(world[nikoX+offsetX][nikoY+offsetY+1])==false) {
            moving=true;
            direction=2;
          }
        }
        if (nikoX+offsetX>0) {
          if (leftPressed&&isSolid(world[nikoX+offsetX-1][nikoY+offsetY])==false) {
            moving=true;
            direction=3;
          }
        }
      }
    }
  }

  void draw() {
    if (moving==false) {
      //drawNiko(0,0);
      if (direction==0) {
        drawNiko(0, 3);
      }
      if (direction==1) {
        drawNiko(0, 2);
      }
      if (direction==2) {
        drawNiko(0, 0);
      }
      if (direction==3) {
        drawNiko(0, 1);
      }
    }
    if (moving) {
      switch(direction) {
      case 0:
        if (inbetween<8) {
          drawNiko(1, 3);
        }
        if (inbetween>=8&&inbetween<16) {
          drawNiko(2, 3);
        }
        if (inbetween>=16) {
          drawNiko(3, 3);
        }
        break;
      case 1:
        if (inbetween<8) {
          drawNiko(1, 2);
        }
        if (inbetween>=8&&inbetween<16) {
          drawNiko(2, 2);
        }
        if (inbetween>=16) {
          drawNiko(3, 2);
        }
        break;
      case 2:
        if (inbetween<8) {
          drawNiko(1, 0);
        }
        if (inbetween>=8&&inbetween<16) {
          drawNiko(2, 0);
        }
        if (inbetween>=16) {
          drawNiko(3, 0);
        }
        break;
      case 3:
        if (inbetween<8) {
          drawNiko(1, 1);
        }
        if (inbetween>=8&&inbetween<16) {
          drawNiko(2, 1);
        }
        if (inbetween>=16) {
          drawNiko(3, 1);
        }
        break;
      }
    }
  }
}


void drawNiko(int x, int y) {
  x *= 24;
  y *= 32;
  PImage niko = nikoSheet.get(x, y, 24, 32);
  image(niko, int((width/2)/(24*spriteScale)-1)*24*spriteScale, (int((height/2)/(24*spriteScale))-0.5)*24*spriteScale, 24 * spriteScale, 32 * spriteScale);
}
