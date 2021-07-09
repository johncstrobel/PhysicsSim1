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
    return (closestObject != null && this.getDistance(closestObject) <= 0);
  }//isColliding
  
  public void collideWithRectangle(){
    //find direction in which we are colliding
    float cx = this.coord.getX();
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
    } else if ((cy) < ry || (cy) > (ry+rh)) { //circle is above or below rectangle
      this.setYVelocity(0-yVelocity);
    } 
  }
  
  public void collideWithCircle(){ // math comes from here: https://flatredball.com/documentation/tutorials/math/circle-collision/
    UncontrollableCircle tempObj = (UncontrollableCircle) closestObject;
    float cx1 = this.coord.getX();
    float cy1 = this.coord.getY();
    float cx2 = closestObject.coord.getX();
    float cy2 = closestObject.coord.getY();
    float rad1 = this.radius;
    float rad2 = tempObj.radius;
    
    // find point of impact
    Coordinate impactPoint = new Coordinate(0,0);                                                                                                                          
    
    //find "tangent line" between two circles
    
    //split my velocity into two vectors (parallel to tangent and perpindicular to tangent)
    
    //new velocity = 2 * (-perpindicular velocity), parallel velocity stays same
    
    this.setXVelocity(0-xVelocity);
    this.setYVelocity(0-yVelocity);
    
  }
  
  
  public void collide(){ //what to do on collision
    if (closestObject.getShape() == "rectangle") {
      this.collideWithRectangle();
    } else if(closestObject.getShape() == "circle") {
      this.collideWithCircle();
    } else {
      throw new RuntimeException("UncontrollableCircle.collide(): closestObject has invalid shape");
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
