class Player {
  //location 
  int x,y;

  //jump height
  int h=0;

  //standing player facing to the right
  PImage[] standingPlayer_r=new PImage[8];
  //standing player facing to the left
  PImage[] standingPlayer_l=new PImage[8];

  //running player facing to the right
  PImage[] runningPlayer_r=new PImage[6];
  //running player facing to the left
  PImage[] runningPlayer_l=new PImage[6];

  //jumping player facing to the right
  PImage[] jumpingPlayer_r=new PImage[2];
  //jumping player facing to the left
  PImage[] jumpingPlayer_l=new PImage[2];

  Player(int _x,int _y) {
    x=_x;
    y=_y;
    smooth();
    //standing player
    PImage gridStandingPlayer=loadImage("standing player.png");
    //facing to the right
    for (int i=0; i<8; i++) {
      int row=i/4%2;
      int col=i%4;
      standingPlayer_r[i]=gridStandingPlayer.get(col*500, row*500, 500, 500);
    }
    //facing to the left
    for (int i=0; i<8; i++) {
      int row=i/4%2;
      int col=i%4;
      standingPlayer_l[i]=gridStandingPlayer.get(col*500, (row*500+1000), 500, 500);
    }

    //running player
    PImage gridRunningPlayer=loadImage("running player.png");
    //facing to the right
    for (int i=0; i<6; i++) {
      int row=i/3%2;
      int col=i%3;
      runningPlayer_r[i]=gridRunningPlayer.get(col*500, row*500, 500, 500);
    }
    //facing to the left
    for (int i=0; i<6; i++) {
      int row=i/3%2;
      int col=i%3;
      runningPlayer_l[i]=gridRunningPlayer.get(col*500, (row*500+1000), 500, 500);
    }

    //jumping player
    //facing to the right
    PImage gridJumpingPlayer1=loadImage("jumping player right.png");
    for (int i=0; i<2; i++) {
      jumpingPlayer_r[i]=gridJumpingPlayer1.get(i*500, 0, 500, 500);
    }
    //facing to the left
    PImage gridJumpingPlayer2=loadImage("jumping player left.png");
    for (int i=0; i<2; i++) {
      jumpingPlayer_l[i]=gridJumpingPlayer2.get(i*500, 0, 500, 500);
    }
  }

  void drawPlayer() {
    //jumping
    pushMatrix();
    translate(x, 100);
    if (h>0) {
      h-=10;
      y=(abs(h-250));
      if (keyPressed==true) {
        if (key==CODED) {
          if (keyCode==RIGHT) {
            if (h>=250) {
              image(jumpingPlayer_r[1], 0, y, 160, 160);
            }
            if (h<250) {
              image(jumpingPlayer_r[0], 0, y, 160, 160);
            }
            x+=8;
          } else if (keyCode==LEFT) {
            if (h>=250) {
              image(jumpingPlayer_l[1], 0, y, 160, 160);
            }
            if (h<250) {
              image(jumpingPlayer_l[0], 0, y, 160, 160);
            }
            x-=8;
          } else {
            if (h>=250) {
              image(jumpingPlayer_r[1], 0, y, 160, 160);
            }
            if (h<250) {
              image(jumpingPlayer_r[0], 0, y, 160, 160);
            }
          }
        } else {
          if (h>=250) {
            image(jumpingPlayer_r[1], 0, y, 160, 160);
          }
          if (h<250) {
            image(jumpingPlayer_r[0], 0, y, 160, 160);
          }
        }
      } else {
        if (h>=250) {
          image(jumpingPlayer_r[1], 0, y, 160, 160);
        }
        if (h<250) {
          image(jumpingPlayer_r[0], 0, y, 160, 160);
        }
      }
    }
    popMatrix();
    y=350;

    //running and standing
    if (h==0) {
      if (keyPressed==true) {
        if (key==CODED) {
          if (keyCode==RIGHT) {
            smooth();
            //When "RIGHT" is pressed, the player character is moving to the right.
            image(runningPlayer_r[millis()/100%runningPlayer_r.length], x, y, 160, 160);
            x+=8;
          } else if (keyCode==LEFT) {
            //When "LEFT" is pressed, the player character is moving to the left.
            image(runningPlayer_l[millis()/100%runningPlayer_l.length], x, y, 160, 160);
            x-=8;
          } else if (keyCode==UP) {
            //When "UP" is pressed, the player character is jumping up.
            h=500;
          } else {
            //When other keyCodes are pressed, the player is standing.
            image(standingPlayer_r[millis()/100%standingPlayer_r.length], x, y+5, 150, 150);
          }
        } else {
          //When other keys are pressed, the player is standing.
          image(standingPlayer_r[millis()/100%standingPlayer_r.length], x, y+5, 150, 150);
        }
      } else {
        //When no keys are pressed, the player is standing.
        image(standingPlayer_r[millis()/100%standingPlayer_r.length], x, y+5, 150, 150);
      }
    }
  }
}
