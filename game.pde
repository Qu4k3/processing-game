class Player {  
  PVector pos; //This contains position of player
  PVector acc; //This contains acceleration of player
  PVector vel;  //This contains velocity of player
  
  float r = 40; ////This contains radius of player object
  
  Player() {
    //initialise the player data members
    pos = new PVector(50,(height - 200));
    vel = new PVector(0, 20);
    acc = new PVector();
  }
  
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void update() {
    applyForce(gravity); //applies downward gravity
    pos.add(vel); // in order to update pos wrt velocity
    if (pos.y >=  height - 170) {
      pos.y = height - 170;
      vel.mult(0);
    }
    
    vel.add(acc); //in order to update the vel as per acc
    vel.limit(4); // in order to cap the vel for a smooth run
    
    acc.mult(0);
  }
  
  void show() {
    image(pl, pos.x, pos.y, r * 2, r * 2);
  }
}

class Obstacle {
  float y = 70; //This contains height of barriers
  float w = 34; //This contains width of barriers
  float x; //This contains x location of the barrier
  float barrier_speed = 3; //This is the rate of change in position of barrier
  
  Obstacle() {
    x = screenWidth + w; //Increase the x location by with
  }
  void update() {
    //if the game is going on modify barrier x-locations if the game is going on
    if (start) {
      x -= barrier_speed;
    }
  }
  
  //Check for collision, if locations of the player and the pipe is overla
  boolean hits(Player p) {
    return((p.pos.x > x) && (p.pos.x < (x + screenWidth))) && (p.pos.y > (height - y - p.r));
  }
  
  void show() {
    if (start) { //display barriers if game is in progress
      image(obs, x, height - y, w, y - 110);
    }
  }
}
