import controlP5.*;

void menu() { 
  textAlign(CENTER);  
  fill(#ffffff);
  textSize(18);
  
  cp5Menu = new ControlP5(this);
  
  cp5Menu.addButton("btnJugar")
    .setValue(0)
    .setPosition(width/2 - 60,height/2 - 40)
    .setSize(120,20)
    .setLabel("Jugar")
    ;
    
  cp5Menu.addButton("btnConfig")
  .setValue(0)
  .setPosition(width/2 - 60,height/2 -10)
  .setSize(120,20)
  .setLabel("Configuracion")
  ;
  
  cp5Menu.addButton("btnSalir")
  .setValue(0)
  .setPosition(width/2 - 60,height/2 + 20)
  .setSize(120,20)
  .setLabel("Salir")
  ;
}

void controlEvent(ControlEvent theEvent) {
  if(theEvent.isController()) {      
     if(theEvent.name().equals("btnJugar")) {
       gameState = PLAY;
     } else if(theEvent.name().equals("btnConfig")) {
       gameState = CONFIG;
     } else if(theEvent.name().equals("btnSalir")) {
       gameState = END;
     }
 }
}
