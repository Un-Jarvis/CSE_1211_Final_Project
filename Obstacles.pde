class PiranhaFlower {
  PImage[] pf=new PImage[2];

  //explosion
  PImage[] ex=new PImage[6];
  //time
  float t=0;

  PiranhaFlower() {
    PImage gridPf=loadImage("Piranha flower.png");
    for (int i=0; i<2; i++) {
      pf[i]=gridPf.get(i*91, 0, 91, 117);
    }
  }

  void drawExplosion() {
    t+=0.5;
    //convert float to integer
    int t1=floor(t);
    t1=constrain(t1, 0, 5);
    image(ex[t1], 400, 350, 150, 150);
  }
}

class Ghost {
  //location
  int x, y;
  //image
  PImage[] flyingGhost=new PImage[8];

  Ghost(int _x, int _y) {
    x=_x;
    y=_y;

    //Flying Ghost
    PImage gridFlyingGhost=loadImage("ghost.png");
    for (int i=0; i<8; i++) {
      int row=i/4;
      int col=i%4;
      flyingGhost[i]=gridFlyingGhost.get(col*150, row*150, 150, 150);
    }
  }

  void flyingGhost() {
    x=x-1;
    if (x<=-50) {
      x=850;
      y=int(random(50, 500));
    }
  }
}

class WheelBlades {
  PImage[] wb=new PImage[4];
  int x, y;

  WheelBlades(int _x, int _y) {
    x=_x;
    y=_y;
    PImage gridWb=loadImage("wheel blades.png");
    for (int i=0; i<4; i++) {
      wb[i]=gridWb.get((300-i*100), 0, 100, 100);
    }
  }

  void moveWheelBlades() {
    x+=3;
    if (x>=800) {
      x=-50;
      y=int(random(50, 400));
    }
  }
}

class Bomb {
  PImage[] bomb=new PImage[3];
  int x;

  Bomb(int _x) {
    x=_x;
    PImage gridBomb=loadImage("bomb.png");
    for (int i=0; i<3; i++) {
      bomb[i]=gridBomb.get((i*50), 0, 50, 70);
    }
  }
}

