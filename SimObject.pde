public abstract class SimObject{
  protected SimObject closestObject;
  protected Coordinate coord; //represents center of object
  protected color objColor;
  protected boolean movable;
  protected String shape;
  protected boolean displayClosestObject;
  
  public SimObject(float x, float y){
    coord = new Coordinate(x,y);
    displayClosestObject = false;
  }
  
  public void toggleClosestObjectLine(boolean newValue){
    displayClosestObject = newValue;
  }
 
  public boolean isMovable(){
    return movable;
  }
  
  public Coordinate getCenterCoord(){
    return coord;
  }
  
  public void setCoord(Coordinate c){
    coord = c;
  }
 
  public SimObject getClosestObject(){
    return closestObject;
  }
 
  public void setClosestObject(SimObject o){
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
    
  public void displayClosestObjectLine(){
    if(displayClosestObject && closestObject != null){
      stroke(#FFFFFF);
      Coordinate a = this.getCenterCoord();
      Coordinate b = closestObject.getCenterCoord();
      line(a.getX(),a.getY(),b.getX(),b.getY());
      stroke(#000000);
    }
  }
  
  public float getDistance (SimObject other){
    float x1 = this.coord.getX(); //this coords
    float y1 = this.coord.getY();
    float x2 = other.coord.getX(); //other coords
    float y2 = other.coord.getY();
    if (this.shape == "circle"){
      if (other.getShape() == "circle"){ //this = circle; other = circle
        float dist = sqrt(pow((x2-x1),2) + pow((y2-y1),2));
        UncontrollableCircle tempObj = (UncontrollableCircle) this;
        float thisRadius = tempObj.getRadius();
        tempObj = (UncontrollableCircle) other;
        float otherRadius = tempObj.getRadius();
        return dist-thisRadius-otherRadius;
      } else if (other.getShape() == "rectangle"){ //this = circle; other = rectangle
        StaticRectangle tempObj = (StaticRectangle) other;
        float rx = tempObj.coord.getX();
        float ry = tempObj.coord.getY();
        float rw = tempObj.xDim;
        float rh = tempObj.yDim;
        float cx = this.coord.getX();
        float cy = this.coord.getY();
        
        //find rect closest side
        float testx = cx;//rect's closest edges
        float testy = cy;
        
        if (cx < rx) {testx = rx;}//left edge
        else if (cx > rx+rw) {testx = rx+rw;} //right edge
        if (cy < ry) {testy = ry;}//top edge
        else if (cy > ry+rh) {testy = ry+rh;}//bottom edge
        
        float distx = cx-testx;
        float disty = cy-testy;
        float distance = sqrt((distx*distx)+(disty*disty));
        UncontrollableCircle tempObj2 = (UncontrollableCircle) this;
        return distance - tempObj2.getRadius();
      
      } else {
        throw new RuntimeException("SimObject.getDistance: other object does not have a valid shape");
      }
      ////////////////////////////////
    } else if (this.shape == "rectangle"){
      if (other.getShape() == "circle"){ //this = rectangle; other = circle
        return other.getDistance(this);
      } else if (other.getShape() == "rectangle"){ //this = rectangle; other = rectangle
        StaticRectangle rec1 = (StaticRectangle) this;
        StaticRectangle rec2 = (StaticRectangle) other;
        float xa, xb, ya, yb, w, h;
        if (rec1.getCenterCoord().getX() > rec2.getCenterCoord().getX()) {
           xa = rec2.getCenterCoord().getX(); w = rec2.xDim; xb = rec1.getCenterCoord().getX();
        } else {
           xa = rec1.getCenterCoord().getX(); w = rec1.xDim; xb = rec2.getCenterCoord().getX();
        }
        if (rec1.getCenterCoord().getY() > rec2.getCenterCoord().getY()) {
           ya = rec2.getCenterCoord().getY(); h = rec2.yDim; yb = rec1.getCenterCoord().getY();
        } else {
           ya = rec1.getCenterCoord().getY(); h = rec1.yDim; yb = rec2.getCenterCoord().getY();
        }
        float a = Math.max(0, x2 - x1 - w);
        float b = Math.max(0, y2 - y1 - h);
        return sqrt((a*a)+(b*b));
      } else {
        throw new RuntimeException("SimObject.getDistance: other object does not have a valid shape");
      }
    } else {
      throw new RuntimeException("SimObject.getDistance: this object does not have a valid shape");
    }
  }
 
  public abstract void display();
 
  public abstract boolean isColliding(); //check for collision
 
  public abstract void collide(); //what to do on collision
  
  public abstract void move();
 
 
  
}
