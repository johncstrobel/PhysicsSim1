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

      if (this.getDistance(closestObject) <= this.radius) {
        return true;
      }
    } //if rect
    
    if (closestObject != null && closestObject.getShape() == "circle"){
      UncontrollableCircle tempObj = (UncontrollableCircle) closestObject;
      //float x1 = coord.getX();
      //float x2 = tempObj.coord.getX();
      //float y1 = coord.getY();
      //float y2 = tempObj.coord.getY();
      //float distance = sqrt(pow((x2-x1),2) + pow((y2-y1),2));
      if (this.getDistance(tempObj) < this.radius + tempObj.getRadius()){
        return true;
      }
    }
    
    return false;
  }//isColliding
  
  public void collideWithRectangle(){
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
