void config() {
  textAlign(CENTER);  
  fill(#ffffff);  
  
    float w = 180;
  float h = 40;
  float x = width/2 - w/2;
  float y = (height/2 + 95) - h/2;

  // printamos los elementos de configuración
  textSize(18);
  text("MÚSICA", width/2, (height/2 - 100)); 
  textSize(14);
  text("Opción 1", (width/2 - 50), (height/2 - 60)); 
  text("Opción 2", (width/2 + 50), (height/2 - 60)); 

  textSize(18);
  text("FELICITACIÓN", width/2, height/2);
  textSize(14);
  text("Opción 1", (width/2 - 50), (height/2 + 40)); 
  text("Opción 2", (width/2 + 50), (height/2 + 40)); 

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
