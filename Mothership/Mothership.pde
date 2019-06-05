import java.util.*;
interface Displayable{
  void display();
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
    Projectile h = m.attack();
    thingsToDisplay.add(h);
    proj.add(h);
  }  
  if (m.health() <= 0){
    text("You Win", 500, 400);
    noLoop();
  }
  if (lose){
    text("You Lose", 500, 400);
    noLoop();
  }  
}  
