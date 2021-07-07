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
    
    //if (closestObject != null && closestObject.getShape() == "circle"){
    //  UncontrollableCircle tempObj = (UncontrollableCircle) closestObject;
    //  if (this.getDistance(tempObj) < this.radius + tempObj.getRadius()){
    //    return true;
    //  }
    //}//if circle
    
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
    
    if ((cx+radius) < rx || (cx+radius) > rx+rw) { //circle is to the left or right of the rectangle
      this.setXVelocity(0-xVelocity);
    }
    //else if () {} //circle is to the right of the rectangle
    else if ((cy+radius) < ry || (cy+radius) > ry+rh) {
      this.setYVelocity(0-yVelocity);
    } //circle is above or below rectangle
    //else if () {} //circle is below rectangle

    
    
    //if S or N, reverse Y velocity, do not change x
    //if W or e, reverse X velocity, do not change Y
    
    
    //xVelocity = 0-xVelocity;
    //yVelocity = 0-yVelocity;
    xVelocity = 0-xVelocity;
    yVelocity = 0-yVelocity;
    println("UncontrollableCircle.collideWithRectangle(): needs work");
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
