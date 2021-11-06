void intro() {
  String christmas = "¡Feliz Navidad!";
  String company = "Mi empresa";

  textAlign(CENTER);  
  fill(#ffffff);

  // printamos la felicitación en el centro de la ventana
  textSize(24);
  text(christmas, width/2, height/2);

  // printamos la empresa abajo de la pantalla tomando como referencia la altura de esta
  textSize(16);
  text(company, width/2, (height - 20)); 

  // mantenemos la pantalla 5 segundos      
  if (millis() > 5*1000) {
    // saltamos al menú
    gameState = MENU;
  }
}
