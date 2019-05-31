interface Displayable{
  void display();
}
class Player implements Displayable{
  float x;
  float y;
  int atktime;
  int rolltimer;
  int rollxvel;
  int rollyvel;
  Player(float xv, float yv){
    x = xv;
    y = yv;
    rolltimer = 0;
  } 
  void display(){
    if (rolltimer > 0){
     fill(0, 255, 0);
     changex(rollxvel);
     changey(rollyvel);
    } 
    triangle(x, y, x - 25, y + 50, x + 25, y + 50);
    fill(255,255,255);
    atktime -= 1; 
    rolltimer -= 1;
  }  
  int rolltimer(){
    return rolltimer;
  }  
  void changex(float change){
    if (x + change > 25 && x + change < 975){
      x += change;
    }  
  }  
  void changey(float change){
    if (y + change > 200 && y + change < 750){
      y += change;
    }
  } 
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }  
  void roll(boolean left, boolean right, boolean up, boolean down){
    rollxvel = 0;
    rollyvel = 0;
    if (left){
      rollxvel += -3;
    }  
    if (right){
      rollxvel += 3;
    }
    if (up){
      rollyvel += -3;
    }
    if (down){
      rollyvel += 3;
    }  
    if (rollxvel != 0 || rollyvel != 0){
      rolltimer = 30;
    }
  }  
  int atktimer(){
    return atktime;
  }  
  Projectile attack(){
    atktime = 20;
    return new Projectile(x, y, 0, -3, true);
  }  
}  
class Projectile implements Displayable{
  float x;
  float y;
  float xvel;
  float yvel;
  boolean friendly;
  boolean oob;
  Projectile(float xs, float ys, float xv, float yv, boolean f){
    x = xs;
    y = ys;
    xvel = xv;
    yvel = yv;
    friendly = f;
    oob = false;
  }  
  boolean bounds(){
    return oob;
  }  
  void display(){
    x += xvel;
    y += yvel;
    if (x > 1000 || x < 0 || y > 800 || y < 0){
      oob = true;
    }  
    ellipse(x, y, 5, 5);
  }  
  boolean checkf(){
    return friendly;
  }  
  boolean collision(Player p, MShip m){
    if (! friendly){
      float shipa = 1250;
      float a1 = triArea(x, y, p.x - 25, p.y + 50, p.x + 25, p.y + 50);
      float a2 = triArea(p.x, p.y, x, y, p.x + 25, p.y + 50);
      float a3 = triArea(p.x, p.y, p.x - 25, p.y + 50, x, y);
      return shipa == a1 + a2 + a3;
    }
    if (friendly){
      float shipa = 40000;
      float a1 = triArea(x, y, m.x - 200, m.y - 200, m.x + 200, m.y - 200);
      float a2 = triArea(m.x, m.y, x, y, m.x + 200, m.y - 200);
      float a3 = triArea(m.x, m.y, m.x - 200, m.y - 200, x, y);
      return shipa == a1 + a2 + a3;
    }  
    return false;
  }  
  float triArea(float x1, float y1, float x2, float y2, float x3, float y3){
    return Math.abs((x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)) / 2.0);
  }
}
class MShip implements Displayable{
  float x;
  float y;
  int t;
  int health;
  MShip(float xv, float yv){
    x = xv;
    y = yv;
    t = 0;
    health = 25;
  }
  void display(){
    fill(255, health * 10, health * 10);
    triangle(x, y, x - 200, y - 200, x + 200, y - 200);
    fill(255,255,255);
    t += 1;
  }
  int getTime(){
    return t;
  }  
  void loseHealth(){
    health -= 1;
  }  
  int health(){
    return health;
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
  if (p.atktimer() <= 0 && p.rolltimer() <= 0){
    proj.add(p.attack());
    thingsToDisplay.add(proj.get(proj.size() - 1));
  } 
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
  if (moveLeft && p.rolltimer() <= 0){
    p.changex(-2);
  }
  if (moveRight && p.rolltimer() <= 0){
    p.changex(2);
  }  
  if (moveUp && p.rolltimer() <= 0){
    p.changey(-2);
  }
  if (moveDown && p.rolltimer() <= 0){
    p.changey(2);
  }  
  for(int i = 0; i < thingsToDisplay.size(); i++){
    thingsToDisplay.get(i).display();
    if (i >= 2 && ! lose){
      if (proj.get(i - 2).collision(p, m)){
        if (! proj.get(i - 2).checkf()){
          if (p.rolltimer() <= 0){
            thingsToDisplay.remove(0);
            lose = true;
          } 
        }
        else{
          m.loseHealth();
          thingsToDisplay.remove(i);
          proj.remove(i - 2);
          if (i != 2){
            i--;
          }  
          if (m.health() <= 0){
            text("asbsfsf", 100, 100);
          }
        }  
      } 
      if (proj.get(i - 2).bounds()){
        proj.remove(i - 2);
        thingsToDisplay.remove(i);
        if (i != 2){
          i--;
        }  
      }  
    }  
  }  
  if (keyPressed){
    if (key == ' '){
      p.roll(moveLeft, moveRight, moveUp, moveDown);
    } 
  }  
  if (m.getTime() % 60 == 0){
    Projectile h = new Projectile(500, 200, -1 * ((500 - p.getX())) / 100, Math.abs(200 - p.getY() - 25) / 100, false);    
    thingsToDisplay.add(h);
    proj.add(h);
  }  
  if (lose){
    text("You Lose", 300, 500);
  }  
}  