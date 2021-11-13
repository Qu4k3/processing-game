import controlP5.*;

void config() {
  textAlign(CENTER);  
  fill(#ffffff);  
  textSize(18);  
  
  tint(255, 255);

  cp5Config = new ControlP5(this);

  cp5Config.setFont(f);
  cp5Config.setColorBackground(#000000);

  // SELECTOR DE CANCIONES
  text("MUSIC", width/2, (height/2 - 180));     

  image(vynilOne, width/2 - 97.5, height/2 - 157.5);
  image(album, width/2 - 135, height/2 - 160); 
  textSize(14);
  text("Track 7", width/2 - 97.5, (height/2 - 60));

tint(255, 127);
  image(vynilTwo, width/2 + 65, height/2 - 157.5);
  tint(255, 255);
  image(album, width/2 + 27.5, height/2 - 160);
  textSize(14);
  text("Track 2", width/2 + 65, (height/2 - 60));

  // SELECTOR DE FONDOS
  textSize(18);
  text("BACKGROUND", width/2, height/2 - 9);
  
tint(255, 255);
  image(bgOnePreview, width/2 - 140, height/2 + 10);
  tint(255, 127);
  image(bgTwoPreview, width/2 + 20, height/2 + 10);

  cp5Config.addButton("btnBack")
    .setPosition(width/2 - 75, height/2 + 140) // 32.5 - 22.5 = 10px de margen
    .setLabel("<  Back home")
    .setSize(150, 45);
}
