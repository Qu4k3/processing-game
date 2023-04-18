void end() {
  textAlign(CENTER);  
  fill(#ffffff);
  textSize(18);

  int timeWait = 5000;

  text("¡Gracias por jugar!\nEsperamos verte pronto", width/2, height/2);

  // Calcular cuanto tiempo ha pasado
  int passedTime = millis() - savedTime;
  // Condicional de 5 segundos
  if (passedTime > timeWait) {
    if (!timerRestarted) {
      savedTime = millis(); // Guardamos valor actual y reseteamos el timer
      timerRestarted = true;
    } else {        
      exit();
    }
  }
}
