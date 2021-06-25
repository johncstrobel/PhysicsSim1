public class StaticObject extends SimObject{ //always squares or rectangles
  float xDim;
  float yDim;
  
  public StaticObject(float x, float y, float xd, float yd){
    super(x,y);
    xDim = xd;
    yDim = yd;
    movable = false;
    objColor = #000000;
  }
  
  void display(){
    fill(objColor);
    rect(coord.getX(),coord.getY(),xDim,yDim);
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
