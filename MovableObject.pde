public abstract class MovableObject extends SimObject { 
  protected float xVelocity;
  protected float yVelocity;
  protected float xAcceleration;
  protected float yAcceleration;
  
  public MovableObject(float x, float y){
    super(x,y);
    movable = true;
  }

  public MovableObject(float x, float y, float initialXVel, float initialYVel){
    super(x,y);
    movable = true;
    xVelocity = initialXVel;
    yVelocity = initialYVel;
  }  
  
  public MovableObject(float x, float y, float initialXVel, float initialYVel, float initialXAccel, float initialYAccel){
    super(x,y);
    movable = true;
    xVelocity = initialXVel;
    yVelocity = initialYVel;
    xAcceleration = initialXAccel;
    yAcceleration = initialYAccel;
  }  
  
  public void setXAcceleration(float x){xAcceleration = x;}
  public void setYAcceleration(float y){yAcceleration = y;}
  public void setXVelocity(float x){xVelocity = x;}
  public void setYVelocity(float y){yVelocity = y;}
  
  public void accelerateX(float delta){
    xVelocity = xVelocity + delta;
  }
  
  public void accelerateY(float delta){
    yVelocity = yVelocity + delta;
  }
    
  public void move(){ //moves according to own rules
    //change current position
    if(xVelocity > C_MAX_VELOCITY){
      this.coord.changeX(C_MAX_VELOCITY);
    } else {
      this.coord.changeX(xVelocity);
    }
    if(yVelocity > C_MAX_VELOCITY){
      this.coord.changeY(C_MAX_VELOCITY);
    } else {
      this.coord.changeY(yVelocity);
    }
    //change current velocity
    accelerateX(xAcceleration);
    accelerateY(yAcceleration);
    //teleport to safe space again if out of bounds
    if (this.outOfBounds()){ 
      this.coord.setX(100);
      this.coord.setY(100);
      xAcceleration = 0;
      yAcceleration = 0;
      xVelocity = 0;
      yVelocity = 0;
    }
  }// move
   
}
