import ddf.minim.*;
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
import gifAnimation.*;
import controlP5.*;

// color palette 1
// green - #00be67 /  blue - #00a1d5 /  gray - #001d31 /  purple - #2b0e66 /  pink - #ff86c9

// color palette 2
// purple - #7B55C6 /  pink - #C06AD1 /  soft pink - #DB85BE /  orange - #E29EAA /  soft orange - #EDC8B6

PFont customFont;
PImage vinylOne, vinylOneOff, vinylTwo, vinylTwoOff, album, bgOnePreview, bgOnePreviewOff, bgTwoPreview, bgTwoPreviewOff;
Gif bgAnimated, bgOneAnimated, bgTwoAnimated, vinylOneAnimated, vinylTwoAnimated;
Button buttonVinylOne, buttonVinylTwo, buttonBgOne, buttonBgTwo;
Minim minim;
AudioPlayer songVinylOne, songVinylTwo;
ControlP5 cp5Menu;
ControlP5 cp5Config;
ControlP5 cp5Game;

int gameState;
int savedTime;
boolean timerRestarted = false;
final int INTRO = 0;
final int MENU = 1;
final int CONFIG = 2;
final int PLAY = 3;
final int END = 4;

// GAME
Player p; // clase jugador/a
PImage p1, obs; // sprite del jugador/a + obstáculo
Gif plAnimated;

int score = 0; // puntuación actual del juego
int highScore = 0; // puntuación máxima
boolean safe = true; // valor si el jugador/a golpea un obstáculo
boolean start = false; // valor si el juego está en marcha

PVector gravity = new PVector(0, 0.1); // empuja al jugador/a hacia abajo en el suelo (cuando salta)
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>(); // lista de obstáculos
int screenWidth = 720; // ancho de nuestra pantalla/escena

void setup() { 
  size(720, 480); // inicializamos el canvas
  // frameRate (30);
  p = new Player(); // inicializamos el jugador/a
  p1 = loadImage("p_static.png"); // cargamos la imagen en la variable
  obs = loadImage("o_cactus.png"); // cargamos la imagen en la variable
  gameState = PLAY;
  savedTime = millis();
  
  customFont = createFont("minecraft_font.ttf", 14); // cargamos tipografía personalizada
  
  // inicializamos los GIFs
  plAnimated = new Gif (this, "p_running.gif");
  plAnimated.play();
  
  vinylOneAnimated = new Gif (this, "vinyl-track-1.gif");
  vinylOneAnimated.play();
  
  vinylTwoAnimated = new Gif (this, "vinyl-track-2.gif");
  vinylTwoAnimated.play();
  
  bgOneAnimated = new Gif (this, "bg-1.gif");
  bgOneAnimated.play();
  
  bgTwoAnimated = new Gif (this, "bg-2.gif");
  bgTwoAnimated.play();
  
  // inicializamos las imágenes
  vinylOneOff = loadImage("vinyl-track-1-off.png");
  vinylTwoOff = loadImage("vinyl-track-2-off.png");
  album = loadImage("album.png");
  bgOnePreview = loadImage("bg-1-preview.png");
  bgTwoPreview = loadImage("bg-2-preview.png");
  bgOnePreviewOff = loadImage("bg-1-preview-off.png");
  bgTwoPreviewOff = loadImage("bg-2-preview-off.png");
  
  // inicializamos los elementos cp5 relacionados con el menú
  cp5Menu = new ControlP5(this);  
  cp5Menu.setFont(customFont);
  cp5Menu.setColorBackground(#EDC8B6);
  cp5Menu.setColorForeground(#E29EAA); // hover
  cp5Menu.setColorActive(#E29EAA); // click
  
  cp5Menu.addButton("btnPlay")
   .setPosition(width / 2 - 75, height / 2 - 77.5) // 45/2 + 45 = 10px de margen
   .setLabel("PLAY")
   .setSize(150, 45);
  
  cp5Menu.addButton("btnSettings")
   .setPosition(width / 2 - 75, height / 2 - 22.5) // 45/2
   .setLabel("SETTINGS")
   .setSize(150, 45);
  
  cp5Menu.addButton("btnExit")
   .setPosition(width / 2 - 75, height / 2 + 32.5) // 32.5 - 22.5 = 10px de margen
   .setLabel("EXIT")
   .setSize(150, 45);
  
  cp5Menu.setVisible(false);
  
  // inicializamos los elementos cp5 relacionados con la vista de configuración
  cp5Config = new ControlP5(this);
  cp5Config.setFont(customFont);
  cp5Config.setColorBackground(#EDC8B6);
  cp5Config.setColorForeground(#E29EAA); // hover
  cp5Config.setColorActive(#E29EAA); // click
  
  buttonVinylOne = cp5Config.addButton("btnVinylOne")
   .setPosition(width / 2 - 120, height / 2 - 160)
   .setSize(110, 75)
   .setImage(vinylOneAnimated);
  
  buttonVinylTwo = cp5Config.addButton("btnVinylTwo")
   .setPosition(width / 2 + 20, height / 2 - 160)
   .setSize(110, 75)
   .setImage(vinylTwoOff);
  
  buttonBgOne = cp5Config.addButton("btnBgOne")
   .setPosition(width / 2 - 140, height / 2 + 20)
   .setSize(120, 80)
   .setImage(bgOnePreview);
  
  buttonBgTwo = cp5Config.addButton("btnBgTwo")
   .setPosition(width / 2 + 20, height / 2 + 20)
   .setSize(120, 80)
   .setImage(bgTwoPreviewOff);
  
  cp5Config.addButton("btnBack")
   .setPosition(width / 2 - 75, height / 2 + 140) // 32.5 - 22.5 = 10px de margen
   .setLabel("<  Back home")
   .setSize(150, 45);
  
  cp5Config.setVisible(false);
  
  // inicializamos los elementos cp5 relacionados con la vista de configuración
  cp5Game = new ControlP5(this);
  cp5Game.setFont(customFont);
  cp5Game.setColorBackground(#EDC8B6);
  cp5Game.setColorForeground(#E29EAA); // hover
  cp5Game.setColorActive(#E29EAA); // click
  
  cp5Game.addButton("btnBackGame")
   .setPosition(width / 2 - 75, 10)
   .setLabel("<  Back home")
   .setSize(150, 45);
  
  cp5Game.setVisible(false);
  
  // inicializamos la librería de audio y preparamos los sonidos disponibles
  minim = new Minim(this);
  songVinylOne = minim.loadFile("8bp038-02-nullsleep-silent_night.mp3");
  songVinylTwo = minim.loadFile("8bp038-07-dma-sc-the_first_blip_blop_noel.mp3");
  songVinylOne.loop(); // reproduce la primera canción en bucle indefinidamente
  
  // inicializamos el fondo por defecto primero
  bgAnimated = bgOneAnimated;
}

void draw() {
  background(bgAnimated);
  textFont(customFont);
  
  switch(gameState) {    
    case INTRO : 
      intro();
      break;
    case MENU : 
      cp5Menu.setVisible(true);
      menu();
      break;
    case CONFIG:
      cp5Config.setVisible(true);
      config();
      break;
    case PLAY : 
      cp5Game.setVisible(true);
      play();
      break;
    case END : 
      end();  
      break;
  }
}
