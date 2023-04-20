void play() {
  if (start) {
    pl = plAnimated;
     // Añadir obstaculos a distancias aleatorias de manera que
     // la distancia minima es de 60 frames para tener tiempo de reacción
    if (random(1) < 0.5 && frameCount % 60 == 0) {
      obstacles.add(new Obstacle());
    }
  }
  
  if (keyPressed || mousePressed) {
    start = true; // empezar el juego al presionar la tecla
    if (p.pos.y == height - 170) { // saltar solo si el jugador/a ya esta en el suelo
      PVector up = new PVector(0, -100); // definiendo una fuerza ascendente suave
      p.applyForce(up); // aplicando la fuerza ascendente recién definida
    }
  }
  
  p.update(); // actualiza la posición y la velocidad del jugador/a
  p.show(); // mostrar el jugador/a
  
  // atravesar y mostrar los obstáculos
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
    
    // eliminar los obstáculos que se salieron de la escena
    if (obs.x < - obs.w) {
      obstacles.remove(i);
    }
  }
  
  fill(255, 255);
  textSize(20);
  textAlign(CENTER);
  
  if (safe && start) { // aumenta la puntuación si el juego está en curso
    score++;
  } else {
    // reiniciamos el juego
    score = 0;
    text("Pulsa ESPACIO o haz CLIC IZQUIERDO\npara jugar", width / 2, height / 2 - 50);
    start = false;
  }
  
  textAlign(LEFT);
  
  // mostrar puntuación
  text("Score:", 20, 40);
  text(score, 20 + 100, 40);
  
  // establecer y mostrar la puntuación más alta
  if (highScore < score) {
    highScore = score;
  }
  
  textAlign(RIGHT);
  
  text("High Score:", width - 100, 40);
  text(highScore, width - 30, 40);
}
