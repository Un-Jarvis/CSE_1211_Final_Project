class ScoreList {
  int[] scores;
  //set the array listing the scores from lowest to highest
  //then display them from highest to lowest
  int[] scores_low_to_high;
  PImage board;
  PImage scoreText;

  ScoreList() {
    scores = new int[0];
  }

  void saveScore(int score) {
    //put score in array
    scores = expand(scores, scores.length + 1);
    scores[scores.length-1] = score;
    //display only the most recent 5 scores
    if (scores.length>5) {
      scores=subset(scores, 1, 5);
    }
    //sort the array of scores from smallest to largest
    scores_low_to_high=sort(scores);
  }

  void displayScores() {
    board=loadImage("board2.png");
    scoreText=loadImage("score.png");

    pushMatrix();

    translate(400, 290);
    imageMode(CENTER);

    pushMatrix();
    scale(0.6);
    image(board, 0, 0, 500, 473);
    popMatrix();
    image(scoreText, 0, -100, 120, 36);

    textAlign(CENTER);
    fill(0);
    textSize(25);
    for (int i = 0; i < scores_low_to_high.length; i++) {
      text("Score: "+scores_low_to_high[(scores_low_to_high.length-1)-i], 0, (i*35-55));
    }
    imageMode(CORNER);
    textAlign(LEFT);

    popMatrix();
  }
}

