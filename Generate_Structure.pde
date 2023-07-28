void smallHouse(int x, int y) {
  for (int i=0; i<5; i++) {        //adds brick cube
    for (int j=0; j<5; j++) {

      world[i+x][j+y]=7;
    }
  }
  world[x+2][y+3]=8;    //door
  world[x+2][y+4]=8;
  world[x-1][y]=8;    //2 side blocks of roof
  world[x+5][y]=8;
  world[x][y-1]=8;    //bottom layer of roof
  world[x+1][y-1]=8;
  world[x+2][y-1]=8;
  world[x+3][y-1]=8;
  world[x+4][y-1]=8;
  world[x+1][y-2]=8;//middle layer
  world[x+2][y-2]=8;
  world[x+3][y-2]=8;
  world[x+2][y-3]=8;//top layer
}


void windmill(int x, int y) {
  int[][] structure={
    {9, -1, -1, -1, -1, 9, 9}, 
    {9,9,-1,-1,9,9}, 
    {-1,9,9,9,9},
    {-1,-1,9,9,9},
    {-1,-1,9,9,9,9},
    {-1,9,9,7,-1,9,9},
    {9,9,7,7,7,-1,9},
    {-1,-1,7,7,7},
    {-1,-1,7,7,7},
    {-1,-1,7,7,7},
    {-1,-1,7,8,7},
    {-1,-1,7,10,7}
  };

  place(structure, x, y);
}


void well(int x,int y){
int[][] structure={
{8,8,8,8,8},
{-1,8,-1,8,-1},
{-1,8,12,8,-1},
{-1,7,7,7,-1}
};

place(structure,x,y);
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
