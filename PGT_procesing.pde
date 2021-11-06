import ddf.minim.*;
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

// Audio
Minim minim;
AudioPlayer player;

// Botones
ControlP5 cp5Menu;

int gameState;
final int INTRO = 0;
final int MENU = 1;
final int CONFIG = 2;
final int PLAY = 3;
final int END = 4;

void setup() {
  size(720, 480);
  frameRate (30);
  gameState = MENU;
  
  minim = new Minim(this);
  player = minim.loadFile("Nullsleep - silent night.mp3");
  player.loop(); // reproduce la canción en bucle indefinidamente
}

void draw() {
  background(#324376);

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
