//Final Project 
//Name: Jarvis Huang
//Date: 4/28/2015


import fisica.*;

FWorld world;

//Piranha flower
FCircle piranhaFlower;
PiranhaFlower pf;

//player
int playerY=425;
FCircle playerCircle;
Player player;

//Coins
FCircle[] coin1=new FCircle[5];
Coin[] coins1=new Coin[5];
FCircle[] coin2=new FCircle[8];
Coin[] coins2=new Coin[8];
FCircle[] coin3=new FCircle[12];
Coin[] coins3=new Coin[12];

//door
FBox doorBox;
Door door;

Background bc;

//ghost
FCircle[] ghostCircle;
Ghost[] ghost;

//wheel blades
FCircle wbCircle;
WheelBlades wb;

//Bomb
FCircle bombCircle;
Bomb bomb;

//time
float t=0;

//score
int score, score1, score2, score3;

ScoreList scoreList=new ScoreList();

//instruction
Instruction instruction;

boolean level1;
boolean level2;
boolean level3;

boolean lost;
boolean testLost;
boolean pause;
boolean begin=true;

void setup() {
  size(800, 600);
  Fisica.init(this);
  world=new FWorld();
  instruction=new Instruction();

  level1=true;
  level2=false;
  level3=false;

  lost=false;
  testLost=true;
  pause=false;

  score=0;
  score1=0;
  score2=0;
  score3=0;

  //Piranha flower
  piranhaFlower=new FCircle(90);
  pf=new PiranhaFlower();
  piranhaFlower.setRotatable(false);
  piranhaFlower.setNoFill();
  piranhaFlower.setNoStroke();
  piranhaFlower.setStatic(true);

  //player
  playerCircle=new FCircle(130);
  player=new Player(120, 350);
  playerCircle.setNoFill();
  playerCircle.setNoStroke();
  playerCircle.setRotatable(false);

  //coins
  for (int i=0; i<5; i++) {
    coin1[i]=new FCircle(50);
    coins1[i]=new Coin();
  }
  for (int i=0; i<8; i++) {
    coin2[i]=new FCircle(50);
    coins2[i]=new Coin();
  }
  for (int i=0; i<12; i++) {
    coin3[i]=new FCircle(50);
    coins3[i]=new Coin();
  }

  //door
  doorBox=new FBox(80, 90);
  door=new Door();

  //background includes sky, cloud, mountains, fence, ground, and river
  bc=new Background();

  //ghost
  ghostCircle=new FCircle[2];
  ghost=new Ghost[2];
  for (int i=0; i<2; i++) {
    ghostCircle[i]=new FCircle(95);
    ghost[i]=new Ghost(850, (i*200+int(random(50, 300))));
  }

  //wheel blades
  wbCircle=new FCircle(80);
  wb=new WheelBlades(-50, int(random(50, 400)));

  //bomb
  bombCircle=new FCircle(45);
  bomb=new Bomb(int(random(50, 750)));

  world.add(piranhaFlower);
  world.add(playerCircle);
  for (int i=0; i<5; i++) {
    world.add(coin1[i]);
  }
  for (int i=0; i<8; i++) {
    world.add(coin2[i]);
  }
  for (int i=0; i<12; i++) {
    world.add(coin3[i]);
  }
  world.add(doorBox);
  for (int i=0; i<2; i++) { 
    world.add(ghostCircle[i]);
  }
  world.add(wbCircle);
  world.add(bombCircle);
}

void draw() {
  if (!begin) {
    if (!lost && !pause) {
      if (level1==true) {
        //background
        bc.drawBackground1();

        world.step();
        world.draw();

        //player
        player.drawPlayer();
        if (player.h==0) {
          playerY=player.y+75;
          playerCircle.setPosition(player.x+75, playerY);
        }
        if (player.h>0) {
          playerY=(abs(player.h-250))+175;
          playerCircle.setPosition(player.x+75, playerY);
        }

        //Piranha flower
        piranhaFlower.setPosition(550, 445);
        piranhaFlower.attachImage(pf.pf[millis()/100%2]);

        //ghost
        for (int i=0; i<2; i++) {
          ghostCircle[i].setPosition(800, 800);
        }

        //wheel blades
        wbCircle.setPosition(800, 800);

        //bomb
        bombCircle.setPosition(bomb.x, -50);
        bombCircle.setNoFill();
        bombCircle.setNoStroke();

        //coins
        for (int i=0; i<5; i++) {
          coin1[i].setPosition(coins1[i].x, coins1[i].y);
          coin1[i].setRotatable(false);
          coin1[i].setStatic(true);
          coin1[i].attachImage(coins1[i].coin[millis()/100%8]);
        }
        for (int i=0; i<8; i++) {
          coin2[i].setPosition(800, 800);
        }
        for (int i=0; i<12; i++) {
          coin3[i].setPosition(800, 800);
        }

        for (int i=0; i<5; i++) {
          if (playerCircle.isTouchingBody(coin1[i])) {
            world.remove(coin1[i]);
            println("get!");
            score1+=1;
          }
        }

        //door
        doorBox.setPosition(250, 413);
        doorBox.setStatic(true);
        if (score1<5) {
          t=0;
          doorBox.attachImage(door.door);
        } else if (score1>=5) {
          t+=0.2;
          int t2=int(constrain(t, 0, 3));
          doorBox.attachImage(door.doorOpen[t2]);
          if (playerCircle.isTouchingBody(doorBox)) {
            level1=false;
            level2=true;
            level3=false;
          }
        }
      }

      if (level2==true) {
        //background
        bc.drawBackground2();

        world.step();
        world.draw();

        //player
        player.drawPlayer();
        if (player.h==0) {
          playerY=player.y+75;
          playerCircle.setPosition(player.x+75, playerY);
        }
        if (player.h>0) {
          playerY=(abs(player.h-250))+175;
          playerCircle.setPosition(player.x+75, playerY);
        }

        //Piranha flower
        piranhaFlower.setPosition(650, 445);
        piranhaFlower.attachImage(pf.pf[millis()/100%2]);

        //ghost
        ghost[0].flyingGhost();
        ghostCircle[0].setPosition(ghost[0].x, ghost[0].y);
        ghostCircle[0].attachImage(ghost[0].flyingGhost[millis()/50%8]);
        ghostCircle[0].setStatic(true);
        ghostCircle[1].setPosition(800, 800);

        //wheel blades
        wbCircle.setPosition(800, 800);

        //bomb
        bombCircle.setRotatable(false);
        bombCircle.attachImage(bomb.bomb[millis()/100%3]);
        bombCircle.setSensor(true);
        if (bombCircle.getY()>650) {
          int bx=int(random(50, 750));
          bombCircle.setPosition(bx, -50);
        }

        //coins
        for (int i=0; i<8; i++) {
          coin2[i].setPosition(coins2[i].x, coins2[i].y);
          coin2[i].setRotatable(false);
          coin2[i].setStatic(true);
          coin2[i].attachImage(coins2[i].coin[millis()/100%8]);
        }
        for (int i=0; i<12; i++) {
          coin3[i].setPosition(800, 800);
        }

        for (int i=0; i<8; i++) {
          if (playerCircle.isTouchingBody(coin2[i])) {
            world.remove(coin2[i]);
            println("get!");
            score2+=1;
          }
        }

        //door
        doorBox.setPosition(200, 413);
        doorBox.setStatic(true);
        if (score2<8) {
          t=0;
          doorBox.attachImage(door.door);
        } else if (score2>=8) {
          t+=0.2;
          int t2=int(constrain(t, 0, 3));
          doorBox.attachImage(door.doorOpen[t2]);
          if (playerCircle.isTouchingBody(doorBox)) {
            level1=false;
            level2=false;
            level3=true;
          }
        }
      }

      if (level3==true) {
        //background
        bc.drawBackground3();

        world.step();
        world.draw();

        //player
        player.drawPlayer();
        if (player.h==0) {
          playerY=player.y+75;
          playerCircle.setPosition(player.x+75, playerY);
        }
        if (player.h>0) {
          playerY=(abs(player.h-250))+175;
          playerCircle.setPosition(player.x+75, playerY);
        }

        //Piranha flower
        piranhaFlower.setPosition(650, 445);
        piranhaFlower.attachImage(pf.pf[millis()/100%2]);

        //ghost
        for (int i=0; i<2; i++) {
          ghost[i].flyingGhost();
          ghostCircle[i].setPosition(ghost[i].x, ghost[i].y);
          ghostCircle[i].attachImage(ghost[i].flyingGhost[millis()/50%8]);
          ghostCircle[i].setStatic(true);
        }

        //wheel blades
        wb.moveWheelBlades();
        wbCircle.setPosition(wb.x, wb.y);
        wbCircle.attachImage(wb.wb[millis()/50%4]);
        wbCircle.setStatic(true);
        wbCircle.setRotatable(false);

        //bomb
        bombCircle.setRotatable(false);
        bombCircle.attachImage(bomb.bomb[millis()/100%3]);
        bombCircle.setSensor(true);
        if (bombCircle.getY()>650) {
          int bx=int(random(50, 750));
          bombCircle.setPosition(bx, -50);
        }

        //coins
        for (int i=0; i<12; i++) {
          coin3[i].setPosition(coins3[i].x, coins3[i].y);
          coin3[i].setRotatable(false);
          coin3[i].setStatic(true);
          coin3[i].attachImage(coins3[i].coin[millis()/100%8]);
        }
        for (int i=0; i<12; i++) {
          if (playerCircle.isTouchingBody(coin3[i])) {
            world.remove(coin3[i]);
            println("get!");
            score3+=1;
          }
        }

        //door is removed
        world.remove(doorBox);
        if (score3<12) {
          t=0;
        }
      }

      score=score1+score2+score3;
      fill(0);
      textAlign(LEFT, BOTTOM);
      textSize(25);
      text("Score: "+score, 50, 70);

      if (testLost) {
        if (playerCircle.isTouchingBody(piranhaFlower) || playerCircle.isTouchingBody(ghostCircle[0]) 
          || playerCircle.isTouchingBody(ghostCircle[1]) || playerCircle.isTouchingBody(wbCircle) ||
          playerCircle.isTouchingBody(bombCircle)) {
          println("Lost!");
          lost=true;
        }
      }
      if (score==25) {
        testLost=false;
        t+=0.05;
        if (t>5) {
          pause=true;
          scoreList.saveScore(score);
          scoreList.displayScores();
        }
        PImage win=loadImage("win.png");
        image(win, 250, 100, 300, 75);
      }
    } else if (lost) {
      scoreList.saveScore(score);
      scoreList.displayScores();

      pushMatrix();
      translate(400, 130);
      imageMode(CENTER);
      PImage gameOver=loadImage("lost.png");
      image(gameOver, 0, 0, 500, 95);
      imageMode(CORNER);
      popMatrix();

      testLost=false;
      pause=true;
    }
    if (pause) {
      pushMatrix();
      translate(400, 425);
      imageMode(CENTER);
      PImage replay=loadImage("replay.png");
      image(replay, 0, 0, 250, 86);
      imageMode(CORNER);
      popMatrix();
      noLoop();
    }
  }
  if (begin) {
    bc.drawBackground3();
    instruction.drawInstruction();
    pushMatrix();
    translate(400, 425);
    imageMode(CENTER);
    PImage start=loadImage("play.png");
    image(start, 0, 0, 250, 86);
    imageMode(CORNER);
    popMatrix();
  }
}

void mouseClicked() {
  if (begin) {
    if (mouseX>275 && mouseX<525 && mouseY>382 && mouseY<468) {
      begin=false;
      testLost=true;
      loop();
    }
  }
  if (pause) {
    if (mouseX>275 && mouseX<525 && mouseY>382 && mouseY<468) {
      pause=false;
      lost=false;
      testLost=true;
      setup();
      loop();
    }
  }
}

