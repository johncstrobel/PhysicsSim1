public abstract class PhysicsObject extends MovableObject{ 
  //distance to each wall?
  public PhysicsObject(float x, float y){
    super(x,y);
  }
  
  public PhysicsObject(float x, float y, float initialXVel, float initialYVel){
    super(x,y,initialXVel, initialYVel);
  }
  
  public PhysicsObject(float x, float y, float initialXVel, float initialYVel, float initialXAccel, float initialYAccel){
    super(x,y,initialXVel, initialYVel,initialXAccel,initialYAccel);
  }
  
    
  public void move(){ //moves according to own rules
    super.move();
    accelerateY(C_GRAVITY);
    accelerateX(C_X_GRAVITY);
  }// move
}
