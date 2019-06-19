public class Drone{
  int x, y, z;
  float angle;
  
  Drone(int posX, int posY, int posZ, float rad){
      x = posX;
      y = posY;
      z = posZ;
      angle = rad;
  }
  
  public void update(){
    stroke(0);
    fill(color(255,0,0));
    rect(0,0,50,50);
  }
  
}
