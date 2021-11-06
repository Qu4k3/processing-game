void end() {
  textAlign(CENTER);  
  fill(#ffffff);
  textSize(18);

  int wait = 5000;
  long waitStart = millis();

  text("¡Gracias por jugar!\nEsperamos verte pronto", width/2, height/2);
  
  println(millis());

  // mantenemos la pantalla 5 segundos      
  if ((millis() - waitStart > wait)) {
    exit();
  }
}
