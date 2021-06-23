public class Coordinate{
  private float x, y;
  
  public float getX(){
    return x;
  }
  
  public float getY(){
    return y;
  }
  
  public void setX(float a){
    x = a;
  }
  
  public void setY(float a){
    y = a;
  }
  
  public void changeX(float a){
    x += a;
  }
  
  public void changeY(float a){
    y += a;
  }
}
