void play() {
  if (start) {
    pl = plAnimated;
    //Add barriers at random distances such that 
    //minimum distance is 60 frames to make the 
    //game playable only if th game is in progress.
    if (random(1) < 0.5 && frameCount % 60 == 0) {
      obstacles.add(new Obstacle());
    }
  }
  
  if (keyPressed || mousePressed) {
    start = true; //Start the game on pressing the key
    if (p.pos.y == height - 170) { //Jump only if the player is already on the ground
      PVector up = new PVector(0, -100); //Defining an appropriate upward force
      p.applyForce(up); //Applying the upward force just defined
    }
  }
  
  p.update(); //Update the player's position and speed
  p.show(); //Display the player
  
  //traverse and display the obstructions
  for (int i = obstacles.size() - 1; i>= 0; i--)
  {
    Obstacle obs = obstacles.get(i);
    p.update();
    
    if (obs.hits(p))
    {
      obs.show();
      safe = false;
    } else
    {
      obs.show();
      safe = true;
    }
    
    //Remove the barriers that went out of frame
    if (obs.x < - obs.w) {
      obstacles.remove(i);
    }
  }
  
  fill(255, 255); //fill the text with colour for score
  textSize(20); //Set size for the score
  textAlign(CENTER);
  
  if (safe && start) { //Increment the score if game is going on smoothly
    score++;
  } else {
    //Restart the game
    score = 0;
    text("Pulsa ESPACIO o haz CLIC IZQUIERDO\npara jugar", width / 2, height / 2 - 50);
    start = false;
  }
  
  textAlign(LEFT);
  
  //Display score
  text("Score:", 20, 40);
  text(score, 20 + 100, 40);
  
  //Set and display high score
  if (highScore < score) {
    highScore = score;
  }
  
  textAlign(RIGHT);
  
  text("High Score:", width - 100, 40);
  text(highScore, width - 30, 40);
}
