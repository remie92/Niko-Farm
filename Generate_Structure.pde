void smallHouse(int x,int y){
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
