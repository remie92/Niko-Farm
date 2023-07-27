int nikoX=2;
int nikoY=5;

int tileSize=24;


void mouseReleased() {
  nikoController.click();
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
  int direction=0;
  nikoController() {
  }


  void click() {
    if (mouseButton==LEFT) {
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
        }
      }
      catch(Exception e) {
      }
    }
  }

  void tick() {
    if (moving==false) {
      if (upPressed) {
        moving=true;
        direction=0;
      }
      if (rightPressed) {
        moving=true;
        direction=1;
      }
      if (downPressed) {
        moving=true;
        direction=2;
      }
      if (leftPressed) {
        moving=true;
        direction=3;
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
      if (inbetween==24) {
        moving=false;
        inbetween=0;
        inbetweenX=0;
        inbetweenY=0;
        if (upPressed) {
          moving=true;
          direction=0;
        }
        if (rightPressed) {
          moving=true;
          direction=1;
        }
        if (downPressed) {
          moving=true;
          direction=2;
        }
        if (leftPressed) {
          moving=true;
          direction=3;
        }
      }
    }
  }

  void draw() {
    if (moving==false) {
      drawNiko(1, 6);
    }
    if (moving) {
      switch(direction) {
      case 0:
        if (inbetween<8) {
          drawNiko(0, 4);
        }
        if (inbetween>=8&&inbetween<16) {
          drawNiko(1, 4);
        }
        if (inbetween>=16) {
          drawNiko(2, 4);
        }
        break;
      case 1:
        if (inbetween<8) {
          drawNiko(0, 5);
        }
        if (inbetween>=8&&inbetween<16) {
          drawNiko(1, 5);
        }
        if (inbetween>=16) {
          drawNiko(2, 5);
        }
        break;
      case 2:
        if (inbetween<8) {
          drawNiko(0, 6);
        }
        if (inbetween>=8&&inbetween<16) {
          drawNiko(1, 6);
        }
        if (inbetween>=16) {
          drawNiko(2, 6);
        }
        break;
      case 3:
        if (inbetween<8) {
          drawNiko(0, 7);
        }
        if (inbetween>=8&&inbetween<16) {
          drawNiko(1, 7);
        }
        if (inbetween>=16) {
          drawNiko(2, 7);
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
  image(niko, width/2-(24*spriteScale), height/2-(24*spriteScale), 24 * spriteScale, 32 * spriteScale);
}
