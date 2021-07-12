public class Coordinate{
  private float x, y;
  
  public Coordinate(float a, float b){
    x = a;
    y = b;
  }
  
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

  public void changeX(double a){
    x += a;
  }
  
  public void changeY(double a){
    y += a;
  }
  
  
  public float distance(Coordinate other){
    return sqrt(pow((x-other.getX()),2)+pow((y-other.getY()),2));
  }
}
