void smallHouse(int x, int y) {
  for (int i=0; i<5; i++) {        //adds brick cube
    for (int j=0; j<5; j++) {

      world[i+x][j+y]=brickId;
    }
  }
  world[x+2][y+3]=woodId;    //door
  world[x+2][y+4]=woodId;
  world[x-1][y]=woodId;    //2 side blocks of roof
  world[x+5][y]=woodId;
  world[x][y-1]=woodId;    //bottom layer of roof
  world[x+1][y-1]=woodId;
  world[x+2][y-1]=woodId;
  world[x+3][y-1]=woodId;
  world[x+4][y-1]=woodId;
  world[x+1][y-2]=woodId;//middle layer
  world[x+2][y-2]=woodId;
  world[x+3][y-2]=woodId;
  world[x+2][y-3]=woodId;//top layer
}


void windmill(int x, int y) {
  int[][] structure={
    {windId, -1, -1, -1, -1, windId, windId}, 
    {windId, windId, -1, -1, windId, windId}, 
    {-1, windId, windId, windId, windId}, 
    {-1, -1, windId, windId, windId}, 
    {-1, -1, windId, windId, windId, windId}, 
    {-1, windId, windId, brickId, -1, windId, windId}, 
    {windId, windId, brickId, brickId, brickId, -1, windId}, 
    {-1, -1, brickId, brickId, brickId}, 
    {-1, -1, brickId, brickId, brickId}, 
    {-1, -1, brickId, brickId, brickId}, 
    {-1, -1, brickId, woodId, brickId}, 
    {-1, -1, brickId, crusherId, brickId}
  };

  place(structure, x, y);
}


void well(int x, int y) {
  int[][] structure={
    {woodId, woodId, woodId, woodId, woodId}, 
    {-1, woodId, -1, woodId, -1}, 
    {-1, woodId, wellId, woodId, -1}, 
    {-1, brickId, brickId, brickId, -1}
  };

  place(structure, x, y);
}


void kitchen(int x, int y) {
  int[][] structure={
    {mixerId, -1, ovenId,-1,shopId}
  };
  place(structure, x, y);
}


void place(int[][] struc, int x, int y) {

  for (int i=0; i<struc.length; i++) {
    for (int j=0; j<struc[0].length; j++) {
      try {
        if (struc[i][j]!=-1) {
          world[j+x][i+y]=struc[i][j];  //made j and i different to rotate it
        }
      } 
      catch(ArrayIndexOutOfBoundsException e) {
      }
    }
  }
}
