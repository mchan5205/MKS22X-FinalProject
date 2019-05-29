interface Displayable{
  void display();
}
class Player implements Displayable{
  float x;
  float y;
  int atktime;
  Player(float xv, float yv){
    x = xv;
    y = yv;
  } 
  void display(){
    triangle(x, y, x - 25, y + 50, x + 25, y + 50);
    atktime -= 1;
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
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }  
  Projectile attack(){
     return new Projectile(x, y, 0, -3);
  }  
}  
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
  void display(){
    x += xvel;
    y += yvel;
    ellipse(x, y, 5, 5);
  }  
  boolean collision(Player p){
    float shipa = 1250;
    float a1 = triArea(x, y, p.x - 25, p.y + 50, p.x + 25, p.y + 50);
    float a2 = triArea(p.x, p.y, x, y, p.x + 25, p.y + 50);
    float a3 = triArea(p.x, p.y, p.x - 25, p.y + 50, x, y);
    return shipa == a1 + a2 + a3;
  }  
  float triArea(float x1, float y1, float x2, float y2, float x3, float y3){
    return Math.abs((x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)) / 2.0);
  }
}
class MShip implements Displayable{
  float x;
  float y;
  int t;
  MShip(float xv, float yv){
    x = xv;
    y = yv;
    t = 0;
  }
  void display(){
    triangle(x, y, x - 200, y - 200, x + 200, y - 200);
    t += 1;
  }
  int getTime(){
    return t;
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
void mouseClicked(){
  proj.add(p.attack());
  thingsToDisplay.add(proj.get(proj.size() - 1));
}  
  
ArrayList<Displayable> thingsToDisplay;
ArrayList<Projectile> proj;
boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;
boolean lose;
Player p;
MShip m;
void setup(){
  size(1000,800);
  thingsToDisplay = new ArrayList<Displayable>();
  proj = new ArrayList<Projectile>();
  p = new Player(500,500);
  thingsToDisplay.add(p);
  m = new MShip(500, 200);
  thingsToDisplay.add(m);
  lose = false;
}  
void draw(){
  background(16,19,98);
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
    if (i >= 2 && ! lose){
      if (proj.get(i - 2).collision(p)){
        thingsToDisplay.remove(0);
        lose = true;
      }  
    }  
  }  
  if (m.getTime() % 60 == 0){
    Projectile h = new Projectile(500, 200, -1 * ((500 - p.getX())) / 100, Math.abs(200 - p.getY() - 25) / 100);    
    thingsToDisplay.add(h);
    proj.add(h);
  }  
  if (lose){
    text("You Lose", 300, 500);
  }  
}  