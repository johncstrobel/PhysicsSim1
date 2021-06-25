public class UncontrollableCircle extends PhysicsObject {
  float radius;
  
  public UncontrollableCircle(float x, float y){
    super(x, y);
    radius = 30;
    objColor = #C97676;
  }
  
  public UncontrollableCircle(float x, float y, float initialXVelocity, float initialYVelocity){
    super(x, y, initialXVelocity, initialYVelocity);
    radius = 30;
    objColor = #C97676;
  }
  
  public UncontrollableCircle(float x, float y, float initialXVel, float initialYVel, float initialXAccel, float initialYAccel){
    super(x,y,initialXVel, initialYVel,initialXAccel,initialYAccel);
    radius = 30;
    objColor = #C97676;
  }
  
  public void display(){
    fill(objColor);
    circle(coord.getX(),coord.getY(),radius);    
  }
  
  public void move(){
    super.move();
  }
  
  
  
  
  
  
  
  
  
  
  
  
  //TODO  
  public boolean isColliding(){ //check for collision
    throw new RuntimeException("UncontrollableCircle.isColliding()");
  }
  
  public void collide(){ //what to do on collision
    throw new RuntimeException("UncontrollableCircle.collide()");
  }
}
