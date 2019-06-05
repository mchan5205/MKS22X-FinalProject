class Player implements Displayable{
  float x;
  float y;
  int atktime;
  int rolltimer;
  int rollcd;
  int rollxvel;
  int rollyvel;
  int health;
  Player(float xv, float yv){
    x = xv;
    y = yv;
    rolltimer = 0;
    health = 3;
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
    rollcd -= 1;
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
      rollcd = 40;
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
