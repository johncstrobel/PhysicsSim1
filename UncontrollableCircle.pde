public class UncontrollableCircle extends PhysicsObject {
  float radius;
  
  public UncontrollableCircle(float x, float y){
    super(x, y);
    radius = 15;
    objColor = #C97676;
    shape = "circle";
  }
  
  public UncontrollableCircle(float x, float y, float initialXVelocity, float initialYVelocity){
    super(x, y, initialXVelocity, initialYVelocity);
    radius = 15;
    objColor = #C97676;
    shape = "circle";
  }
  
  public UncontrollableCircle(float x, float y, float initialXVel, float initialYVel, float initialXAccel, float initialYAccel){
    super(x,y,initialXVel, initialYVel,initialXAccel,initialYAccel);
    radius = 15;
    objColor = #C97676;
    shape = "circle";
  }
    
  public void display(){
    fill(objColor);
    circle(coord.getX(),coord.getY(),radius*2);    
    displayClosestObjectLine();
  }
  
  public float getRadius(){
    return radius;
  }
  
  public boolean outOfBounds(){
    if (coord.getX()-radius < 0 || coord.getX()+radius > width){
      return true;
    } else if (coord.getY()-radius < 0 || coord.getY()+radius > height){
      return true;
    }
    return false;
  }
  
  public boolean isColliding(){ //check for collision
    
    if (closestObject != null && closestObject.getShape() == "rectangle"){      
      if (this.getDistance(closestObject) <= 0) {
        return true;
      }
    } //if rect   
    return false;
  }//isColliding
  
  public void collideWithRectangle(){
    //find direction in which we are colliding
    float cx = this.coord.getX();//rect's closest edges
    float cy = this.coord.getY();
    float testx = cx;
    float testy = cy;
    StaticRectangle tempObj = (StaticRectangle)closestObject;
    Coordinate tempCoord = tempObj.getUpperLeftCoord();
    float rx = tempCoord.getX();
    float ry = tempCoord.getY();
    float rw = tempObj.xDim;
    float rh = tempObj.yDim;    
    
    if ((cx) < rx || (cx) > (rx+rw)) { //circle is to the left or right of the rectangle
      this.setXVelocity(0-xVelocity);
      println("collided with side");
    }
    //else if () {} //circle is above or below rectangle
    else if ((cy) < ry || (cy) > (ry+rh)) {
      this.setYVelocity(0-yVelocity);
      println("collided with top/bottom");
    } //circle is above or below rectangle
  }
  
  
  public void collide(){ //what to do on collision
    if (closestObject.getShape() == "rectangle") {
      this.collideWithRectangle();
    }
  }
  
  public void move(){
    super.move();
    if(isColliding()){
      collide();
      objColor = #27E328;
    } else {
      objColor = #C97676;
    }
  }
 
}
