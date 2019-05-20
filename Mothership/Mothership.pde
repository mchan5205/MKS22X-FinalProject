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
}  
ArrayList<Displayable> thingsToDisplay;

void setup(){
  size(1000,1000);
  thingsToDisplay = new ArrayList<Displayable>();
  Player p = new Player(500,500);
  thingsToDisplay.add(p);
}  
void draw(){
  for(int i = 0; i < thingsToDisplay.size(); i++){
    thingsToDisplay.get(i).display();
  }  
}  