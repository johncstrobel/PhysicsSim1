public class PhysicsObject extends MovableObject{
  private float gravConstant = -10;
 
  private boolean movable;
 
  public boolean isMovable(){
    return movable;
  }
 
  public void makeUnmovable(){
    movable = false; 
  }
 
  public void makeMovable(){
    movable = true;
  }
  
  public void move(){ //moves according to own rules
    //calculate new velocity
    float deltaX = xVelocity + xAcceleration;
    float deltaY = yVelocity + yAcceleration + gravConstant;
    //apply friction to acceleration
    //if (xAcceleration > 0){
    //  xAcceleration -= frictionConstant;
    //  if (xAcceleration < 0){
    //    xAcceleration = 0;
    //  }
    //} else if (xAcceleration < 0){
    //  xAcceleration += frictionConstant;
    //}
    
    
    //change current velocity
    this.coord.changeX(deltaX);
    this.coord.changeY(deltaY);
  }
  
  public void collide(){ //what to do on collision
    println("physicsObject.collide not declared");
  }
  
  public boolean insideObject(Coordinate c){ //returns true if c is inside this object
    println("physicsObject.insideObject not declared");
    return true;
  }
}
