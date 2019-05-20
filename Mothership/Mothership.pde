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
    rect(x, y, 50 ,50);
  }  
  void changex(float change){
    x += change;
  }  
  void changey(float change){
    y += change;
  }  
}  
ArrayList<Displayable> thingsToDisplay;
Player p;
void setup(){
  size(1000,1000);
  thingsToDisplay = new ArrayList<Displayable>();
  p = new Player(500,500);
  thingsToDisplay.add(p);
}  
void draw(){
  if (keyPressed){
    if (key == 'd'){
      p.changex(1);
    }
    if (key == 'a'){
      p.changex(-1);
    }
    if (key == 's'){
      p.changey(1);
    }
    if (key == 'w'){
      p.changey(-1);
    }
  }  
  for(int i = 0; i < thingsToDisplay.size(); i++){
    thingsToDisplay.get(i).display();
  }  
}  