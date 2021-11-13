// Minim
import ddf.minim.*;
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
// GifAnimation
import gifAnimation.*;
// ControlP5
import controlP5.*;

// Tipografía
PFont f;
// Imagenes
PImage vynilOne, vynilTwo, album, bgOnePreview, bgTwoPreview;
// Animación
Gif myAnimation;
// Audio
Minim minim;
AudioPlayer player;
// Colecciones de botones
ControlP5 cp5Menu;
ControlP5 cp5Config;

int gameState;
final int INTRO = 0;
final int MENU = 1;
final int CONFIG = 2;
final int PLAY = 3;
final int END = 4;

void setup() {
  size(720, 480);
  // frameRate (30);
  gameState = CONFIG;

  f = createFont("minecraft_font.ttf", 14);

  myAnimation = new Gif(this, "bg-1.gif");
  myAnimation.play();

  vynilOne = loadImage("vynil-track-1.png");
  vynilTwo = loadImage("vynil-track-2.png");
  album = loadImage("album.png");
  bgOnePreview = loadImage("bg-1-preview.png");
  bgTwoPreview = loadImage("bg-2-preview.png");

  /*
  minim = new Minim(this);
   player = minim.loadFile("8bp038-02-nullsleep-silent_night.mp3");
   player.loop(); // reproduce la canción en bucle indefinidamente
   */
}

void draw() {
  background(myAnimation);
  textFont(f);

  switch(gameState) {    
  case INTRO: 
    /*
     - Al arrancar el programa aparecerá la felicitación y los datos de la empresa.
     Esta información se mantendrá durante 5 segundos.
     */
    intro();
    break;
  case MENU: 
    /*
     - Pasado el tiempo, aparecerá un menú que al menos tendrá las opciones de CONFIG, RUN y EXIT.
     Podéis utilizar los nombres que queráis y añadir más opciones si lo creéis necesario.
     En este punto nos esperaremos a que el usuario seleccione alguna opción.
     */
    menu();
    break;
  case CONFIG: 
    /*
     - Opción CONFIG: Vamos a una pantalla en la que habrá un listado de las opciones que podemos modificar,
     como mínimo la música, la imagen de la felicitación y la opción de volver al menú principal.
     Se puede añadir más opciones que el usuario pueda seleccionar.
     */
    config();
    break;
  case PLAY: 
    /*
     - Opción RUN: De momento solo aparecerá un contador de tiempo, un texto con la descripción del
     juego que realizareis y la opción de volver al menú principal.
     */
    play();
    break;
  case END: 
    /*
     - Opción EXIT: Aparece un mensaje de salida que se mantendrá durante 5 segundos y después el programa finalizará.
     */
    end();  
    break;
  }
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isController()) {      
    if (theEvent.name().equals("btnPlay")) {      
      gameState = PLAY;
    } else if (theEvent.name().equals("btnSettings")) {
      gameState = CONFIG;
    } else if (theEvent.name().equals("btnExit")) {
      gameState = END;
    } else if (theEvent.name().equals("btnBack")) {
      gameState = MENU;
    }
  }
}
