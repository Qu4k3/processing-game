void menu() { 
  textAlign(CENTER);  
  fill(#ffffff);
  textSize(18);

  cp5Menu = new ControlP5(this);

  cp5Menu.setFont(f);
  cp5Menu.setColorBackground(#000000);

  cp5Menu.addButton("btnPlay")
    .setPosition(width/2 - 75, height/2 - 77.5) // 45/2 + 45 = 10px de margen
    .setLabel("PLAY")
    .setSize(150, 45);

  cp5Menu.addButton("btnSettings")
    .setPosition(width/2 - 75, height/2 -22.5) // 45/2
    .setLabel("SETTINGS")
    .setSize(150, 45);

  cp5Menu.addButton("btnExit")
    .setPosition(width/2 - 75, height/2 + 32.5) // 32.5 - 22.5 = 10px de margen
    .setLabel("EXIT")
    .setSize(150, 45);
}
