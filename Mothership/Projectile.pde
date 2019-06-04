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
class CurvedP extends Projectile{
  double t = 0;
  float start;
  CurvedP(float xs, float ys, float xv, float yv){
    super(xs, ys, xv, yv, false);
    start = xs;
  }  
  void display(){
    x = xvel * (float)Math.sin(t) + start;
    y += yvel;
    ellipse(x, y, 5, 5);
    if (y > 800){
      oob = true;
    }  
    t += 0.1;
  }  
}  
