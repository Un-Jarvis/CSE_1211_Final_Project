class Coin {
  //location
  int[] _x=new int[14];
  int[] _y=new int[4];
  int x, y;
  //image
  PImage[] coin=new PImage[8];

  Coin() {
    for (int i=0; i<14; i++) {
      _x[i]=50+i*50;
    }
    x=_x[int(random(0, 13))];
    for(int i=0; i<4;i++){
      _y[i]=150+i*50;
    }
    y=_y[int(random(0, 3))];

    smooth();
    PImage gridCoin=loadImage("coin.png");
    for (int i=0; i<8; i++) {
      coin[i]=gridCoin.get(i*50, 0, 50, 50);
    }
  }
}

