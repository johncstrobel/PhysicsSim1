public abstract class MovableObject extends SimObject { 
  //protected float xVelocity;
  //protected float yVelocity;
  protected IVec velocity;
  protected IVec acceleration;
  protected float xAcceleration;
  protected float yAcceleration;
  
  public MovableObject(float x, float y){
    super(x,y);
    movable = true;
    velocity = new IVec(0,0,0);
    acceleration = new IVec(0,0,0);
  }

  public MovableObject(float x, float y, float initialXVel, float initialYVel){
    super(x,y);
    movable = true;
    velocity = new IVec(initialXVel,initialYVel,0);
    acceleration = new IVec(0,0,0);
    
  }  
  
  public MovableObject(float x, float y, float initialXVel, float initialYVel, float initialXAccel, float initialYAccel){
    super(x,y);
    movable = true;
    velocity = new IVec(initialXVel,initialYVel,0);
    acceleration = new IVec(initialXAccel,initialYAccel,0);
  }  
  
  public void setVelocity(IVec newVel){velocity = newVel;}
  public IVec getVelocity(){return velocity;}
  public void setAcceleration(IVec newAccel){acceleration = newAccel;}
  public IVec getAcceleration(){return acceleration;}
  
  public void accelerateVector(IVec delta){
    velocity.add(delta);
  }
  
  public void addAcceleration(IVec delta){
    acceleration.add(delta);
  }
    
  public void move(){ //moves according to own rules
    //change current position
    if(velocity.x() > C_MAX_VELOCITY){
      this.coord.changeX(C_MAX_VELOCITY);
    } else {
      this.coord.changeX(velocity.x());
    }
    if(velocity.y() > C_MAX_VELOCITY){
      this.coord.changeY(C_MAX_VELOCITY);
    } else {
      this.coord.changeY(velocity.y());
    }
    //change current velocity
    accelerateVector(acceleration);
  }// move
   
}
