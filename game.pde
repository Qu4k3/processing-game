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
    applyForce(gravity); // aplicamos furza de gravedad
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
    // si el juego está en curso modificar las posiciones x de los obstáculos
    if (start) {
      x -= obstacle_speed;
    }
  }
  
  // verificamos si hay colisión, si las posiciones del jugador/a y el obstáculo están superpuestos
  boolean hits(Player p) {
    return((p.pos.x > x) && (p.pos.x < (x + screenWidth))) && (p.pos.y > (height - y - p.r));
  }
  
  void show() {
    if (start) { // mostramos los obstáculos si el juego ha iniciado
      image(obs, x, (height - 200), w, y);
    }
  }
}
