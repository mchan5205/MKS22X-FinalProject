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
}  
ArrayList<Displayable> thingsToDisplay;
Player p;
void setup(){
  size(1000,800);
  thingsToDisplay = new ArrayList<Displayable>();
  p = new Player(500,500);
  thingsToDisplay.add(p);
}  
void draw(){
  background(16,19,98);
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
  }  
  for(int i = 0; i < thingsToDisplay.size(); i++){
    thingsToDisplay.get(i).display();
  }  
}  