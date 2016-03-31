class Background {
  //sky
  PImage sky1;
  PImage sky2;

  //ground
  PImage ground1;
  PImage ground2;
  PImage ground3;
  //fence
  PImage fence;
  //mountains
  PImage mountain;
  PImage desert;

  //river
  int rx;
  PImage river1;
  PImage river2;

  //clouds
  int cx0=0;
  int cx1=800;
  PImage[] clouds=new PImage[2];

  //sakura
  PImage sakura;

  //jumping fish
  float t=0;
  float jx;
  PImage[] fish=new PImage[7];

  Background() {
    sky1=loadImage("sky1.png");
    sky2=loadImage("sky2.png");

    ground1=loadImage("ground1.png");
    ground2=loadImage("ground2.png");
    ground3=loadImage("ground3.png");

    river1=loadImage("river1.png");
    river2=loadImage("river2.png");

    fence=loadImage("fence.png");

    mountain=loadImage("mountain.png");
    desert=loadImage("desert.png");

    sakura=loadImage("sakura.png");

    jx=650;
    PImage gridFish=loadImage("jumping fish.png");
    for (int i=0; i<7; i++) {
      fish[i]=gridFish.get(i*250, 0, 250, 446);
    }

    PImage cloud=loadImage("cloud.png");
    for (int i=0; i<2; i++) {
      clouds[i]=cloud;
    }
  }

  void drawBackground1() {
    smooth();

    //sky
    image(sky1, 0, 0, width, height);

    //clouds
    image(clouds[0], cx0, 100, width, 400);
    image(clouds[1], cx1, 100, width, 400);
    cx0-=1;
    if (cx0==-800) {
      cx0=0;
    }
    cx1=cx1-1;
    if (cx1==0) {
      cx1=800;
    }

    //river
    image(river1, rx, 550, width*2, 50);
    rx-=2;
    if (rx==-800) {
      rx=0;
    }

    //mountains
    image(mountain, 0, 125, width, 400);
    //ground
    image(ground1, 0, 492, width, 60);
    //fence 
    image(fence, 0, 400, width, 120);
  }

  void drawBackground2() {
    //sky
    image(sky2, 0, 0, width, height);

    //river
    image(river1, rx, 548, width*2, 52);
    rx-=2;
    if (rx==-800) {
      rx=0;
    }

    //desert
    image(desert, 0, 125, width, 400);
    //ground
    image(ground2, 0, 492, width, 60);
  }

  void drawBackground3() {
    //trees
    image(sakura, 0, 0, width, 629);
    //ground
    image(ground3, 0, 441, width, 111);

    //river
    image(river2, 0, 550, width, 50);

    //fish
    t=(t+0.2)%7;
    int t2=floor(t);
    jx-=3;
    image(fish[t2], jx, 500, 50, 89);
  }
}

