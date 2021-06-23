public abstract class SimObject{
  protected Coordinate coord; //represents center of object 
  
  
  public Coordinate getCoord(){
    return coord;
  }
  public void setCoord(Coordinate c){
    coord = c;
  }
  
 public abstract void collide(); //what to do on collision 
 
 public abstract boolean insideObject(Coordinate c);//returns true if c is inside this object
}
