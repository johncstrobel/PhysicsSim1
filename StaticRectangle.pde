public class StaticRectangle extends SimObject{ //always squares or rectangles
  float xDim;
  float yDim;
  
  public StaticRectangle(float x, float y, float xd, float yd){
    super(x,y);
    xDim = xd;
    yDim = yd;
    movable = false;
    objColor = #000000;
    shape = "rectangle";
  }
  
  
  void display(){
    fill(objColor);
    rect(coord.getX(),coord.getY(),xDim,yDim);
    displayClosestObjectLine();
  }
  
  public Coordinate getCenterCoord(){
    return new Coordinate(coord.getX()+(xDim/2), coord.getY()+(yDim/2));
  }
  
  public Coordinate getUpperLeftCoord(){
    return coord;    
  }
 
  
  //TODO  
  public boolean isColliding(){ //check for collision
    throw new RuntimeException("StaticObject.isColliding()");
  }
  
  public void collide(){ //what to do on collision
    throw new RuntimeException("StaticObject.collide()");
  }
  
  public void move(){
    //do nothing
  }
  
}
