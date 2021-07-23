public abstract class MovableObject extends SimObject { 
  protected float xVelocity;
  protected float yVelocity;
  protected float xAcceleration;
  protected float yAcceleration;
  protected boolean displayVectors; 
  
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
  

  public void toggleDisplayVectors(boolean b){
    displayVectors = b;
  }
  
  public void accelerateVector(IVec delta){
    velocity.add(delta);
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
  }// move
   
  public void arrow(float x1, float y1, float x2, float y2) {
    line(x1, y1, x2, y2);
    pushMatrix();
    translate(x2, y2);
    float a = atan2(x1-x2, y2-y1);
    rotate(a);
    line(0, 0, -3, -3);
    line(0, 0, 3, -3);
    popMatrix();
  } 
  
  public void display(){
    if(displayVectors){
      //sum velocity vector
      arrow((float)coord.getX(),(float)coord.getY(),(float)(coord.getX()+velocity.x()*C_SCALE),(float)(coord.getY()+velocity.y()*C_SCALE));
      //x velocity vector
      arrow((float)coord.getX(),(float)coord.getY(),(float)(coord.getX()+velocity.x()*C_SCALE),(float)coord.getY());
      //y velocity vector
      arrow((float)coord.getX(),(float)coord.getY(),(float)coord.getX(),(float)(coord.getY()+velocity.y()*C_SCALE));
      
    }
  }
}
