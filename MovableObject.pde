public abstract class MovableObject extends SimObject { 
  protected float xVelocity;
  protected float yVelocity;
  protected float xAcceleration;
  protected float yAcceleration;
  
  protected float frictionConstant = 1; //applies in all directions
  
  public abstract void move(); //moves according to own rules
   
}
