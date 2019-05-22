interface Displayable{
  void display();
}
class Player implements Displayable{
  float x;
  float y;
  Player(float xv, float yv){
    x = xv;
    y = yv;
  } 
  void display(){
    triangle(x, y, x - 25, y + 50, x + 25, y + 50);
  }  
  void changex(float change){
    if (x + change > 25 && x + change < 975){
      x += change;
    }  
  }  
  void changey(float change){
    if (y + change > 0 && y + change < 750){
      y += change;
    }
  }  
}  /*
class Projectile implements Displayable{
  float x;
  float y;
  float xvel;
  float yvel;
  Projectile(float xs, float ys, float xv, float yv){
    x = xs;
    y = ys;
    xvel = xv;
    yvel = yv;
  }  
}*/
class MShip implements Displayable{
  float x;
  float y;
  MShip(float xv, float yv){
    x = xv;
    y = yv;
  }
  void display(){
    triangle(x, y, x - 200, y - 200, x + 200, y - 200);
  }  
}  
void keyPressed(){
  if (key == 'a'){
    moveLeft = true;
  }  
  if (key == 'd'){
    moveRight = true;
  }
  if (key == 'w'){
    moveUp = true;
  }
  if (key == 's'){
    moveDown = true;
  }  
}
void keyReleased(){
  if (key == 'a'){
    moveLeft = false;
  }
  if (key == 'd'){
    moveRight = false;
  }
  if (key == 'w'){
    moveUp = false;
  }
  if (key == 's'){
    moveDown = false;
  }  
}  
ArrayList<Displayable> thingsToDisplay;
boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;
Player p;
MShip m;
void setup(){
  size(1000,800);
  thingsToDisplay = new ArrayList<Displayable>();
  p = new Player(500,500);
  thingsToDisplay.add(p);
  m = new MShip(500, 200);
  thingsToDisplay.add(m);
}  
void draw(){
  background(16,19,98);/*
  if (keyPressed){
    if (key == 'd'){
      p.changex(4);
    }
    if (key == 'a'){
      p.changex(-4);
    }
    if (key == 's'){
      p.changey(4);
    }
    if (key == 'w'){
      p.changey(-4);
    }
  }  */
  if (moveLeft){
    p.changex(-2);
  }
  if (moveRight){
    p.changex(2);
  }  
  if (moveUp){
    p.changey(-2);
  }
  if (moveDown){
    p.changey(2);
  }  
  for(int i = 0; i < thingsToDisplay.size(); i++){
    thingsToDisplay.get(i).display();
  }  
}  