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
  Projectile attack(){
    return new Projectile(500, 200, -1 * ((500 - p.getX())) / 100, Math.abs(200 - p.getY() - 25) / 100, false);
  }  
}  
