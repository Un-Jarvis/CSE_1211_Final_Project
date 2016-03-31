class Instruction {
  PImage board;

  Instruction() {
    board=loadImage("board1.png");
  }

  void drawInstruction() {
    pushMatrix();

    imageMode(CENTER);
    translate(400, 250);

    pushMatrix();
    scale(0.5);
    image(board, 0, 0, 700, 399);
    popMatrix();

    fill(0);
    textAlign(CENTER, TOP);
    textSize(30);
    text("Instruction", 0, -90);
    textSize(12);
    text("1. Press LEFT and RIGHT keys to move the character", 0, -50);
    text("and UP key to jump up.                                   ", 0, -35);
    text("2. Dodge those obstacles, including Piranha flower, ", 0, -20);
    text("ghost, bomb, and wheel blades.                      ", 0, -5);
    text("3. You will get one point when you touch a coin.      ", 0, 10);
    text("4. After gaining all the coins in one scene, you'll be ", 0, 25);
    text("   able to enterthe door to the next scene. There're", 0, 40);
    text("three scenes with increasing difficulty.             ", 0, 55);
    text("Good Luck!", 0, 70);
    textAlign(LEFT);
    imageMode(CORNER);

    popMatrix();
  }
}

