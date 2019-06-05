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
    Random r = new Random();
    int n = r.nextInt(3);
    if (n == 1){
      Projectile p = new CurvedP(r.nextInt(1000), 200, 100, 1);
      return p;
    }  
    if (n == 2){
      int l = r.nextInt(4);
      if (l == 0){
        Projectile p = new Laser(500, 200, 0, 0.4);
        return p;
      }  
      if (l == 1){
        Projectile p = new Laser(500, 800, 0, -0.4);
        return p;
      }  
      if (l == 2){
        Projectile p = new Laser(0, 200, 0.4, 0);
        return p;
      }  
      else{
        Projectile p = new Laser(1000, 200, -0.4, 0);
        return p;
      }  
    }  
    else{
      return new Projectile(500, 200, -1 * ((500 - p.getX())) / 100, Math.abs(200 - p.getY() - 25) / 100, false);
    }  
  }  
}  
