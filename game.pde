class Player {  
  PVector pos; // valor con la posición del jugador/a
  PVector acc; // valor con la acceleración del jugador/a
  PVector vel;  // valor con la velocidad del jugador/a
  
  float r = 44; // radio del sprite del jugador
  
  Player() {
    // inicializamos los parámetros del jugador
    pos = new PVector(50,(height - 200));
    vel = new PVector(0, 20);
    acc = new PVector();
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void update() {
    applyForce(gravity); // aplicamos fuerza de gravedad
    pos.add(vel); // actualizamos la posición con la velocidad actual
    if (pos.y >=  height - 170) {
      pos.y = height - 170;
      vel.mult(0);
    }
    
    vel.add(acc); // actualizamos velocidad en función de la acceleración
    vel.limit(6); // limitamos la velocidad para que el juego no se vuelva injugable
    
    acc.mult(0);
  }
  
  void show() {
    imageMode(CORNER); // https://processing.org/reference/imageMode_.html
    image(p1, pos.x, pos.y, r * 2, r * 2);
  }
}

class Obstacle {
  float y = 70; // valor con la altura del obstáculo
  float w = 34; // valor con el ancho del obstáculo
  float x; // valor con la posición x del obstáculo
  float obstacle_speed = 3; // valor con la tasa de cambio en la posición del obstáculo
  
  Obstacle() {
    // inicializamos los parámetros del obstáculo
    x = screenWidth + w; // ajustamos la posición x para que sobresalga de la pantalla inicialmente
  }
  void update() {
    println("Start variable -----------------------------------: " + start);
    // si el juego está en curso modificar las posiciones x de los obstáculos
    if (start) {
      x -= obstacle_speed;
    }
  }
  
  // Verificamos si hay colisión, si las posiciones del jugador/a y el obstáculo están superpuestos
  boolean hits(Player p) {
    // return(p.pos.x + p.r > x && p.pos.x - p.r < (x + w)) && (p.pos.y > (height - y - p.r));
    float obstacleBottom = height - 140; // Parte de abajo del obstaculo
    
    // Comprobamos el solapamiento de ambos objetos en el eje X
    boolean xOverlap = (p.pos.x + p.r > x && p.pos.x - p.r/4 < (x + w));
    
    // Comprobamos el solapamiento de ambos objetos en el eje Y
    boolean yOverlap = (p.pos.y > (obstacleBottom - y));
    
    // COmprobar que cumple colisión en ambos ejes
    if (xOverlap && yOverlap) {
      collisionSound.trigger(); // Suena efecto de colisión
      return true;
    }
    
    return false;
  }
  
  void show() {
    if (start) { // mostramos los obstáculos si el juego ha iniciado
      image(obs, x, (height - 150), w, y);
    }
  }
}
