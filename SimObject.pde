public abstract class SimObject{
  protected SimObject closestObject;
  protected Coordinate coord; //represents center of object
  protected color objColor;
  protected boolean movable;
  protected String shape;
  
  public SimObject(float x, float y){
    coord = new Coordinate(x,y);
  }
 
  public boolean isMovable(){
    return movable;
  }
  
  public Coordinate getCoord(){
    return coord;
  }
  
  public void setCoord(Coordinate c){
    coord = c;
  }
 
  public SimObject getClosestObject(){
    return closestObject;
  }
 
  public void updateClosestObject(SimObject o){
    closestObject = o;
  }
  
  public String getShape(){
    return shape;
  }
 
  public boolean outOfBounds(){
    if (coord.getX() < 0 || coord.getX() > width){
      return true;
    } else if (coord.getY() < 0 || coord.getY() > height){
      return true;
    }
    return false;
  }
 
  public abstract void display();
 
  public abstract boolean isColliding(); //check for collision
 
  public abstract void collide(); //what to do on collision
  
  public abstract void move();
 
 
  
}
