void play() {
  String gameDescription = "El juego es parecido al dinosaurio de Chrome,\n" +
    "consiste en evitar que las tareas te consuman,\n" +
    "recolectando elementos del entorno.";
  int counter = 0;

  float w = 180;
  float h = 40;
  float x = width/2 - w/2;
  float y = (height/2 + 100) - h/2;

  textAlign(CENTER);  
  fill(#ffffff);

  counter = millis() / 1000;

  // printamos la descripción en el centro de la ventana
  textSize(18);
  text("COUNTER", width/2, (height/2 - 150));
  textSize(14);
  text(counter, width/2, (height/2 - 120));

  // printamos la descripción en el centro de la ventana
  textSize(24);
  text(gameDescription, width/2, (height/2 -40));

  // printamos la empresa abajo de la pantalla tomando como referencia la altura de esta
  textSize(16);
  // en caso de pulsar clic izquierdo
  if (mousePressed && (mouseButton == LEFT)) {
    // y en caso de encontrarnos encima del botón previamente definido
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      gameState = MENU;
    }
  }
  // ocultar estilos del rectangulo
  noStroke();
  noFill();
  rect(x, y, w, h);

  text("← VOLVER AL MENÚ", width/2, (height/2 + 100));
}
