public class UncontrollableCircle extends PhysicsObject {
  float radius;
  
  public UncontrollableCircle(float x, float y){
    super(x, y);
    radius = 15;
    objColor = #C97676;
    shape = "circle";
    displayVectors = true;
  }
  
  public UncontrollableCircle(float x, float y, float initialXVelocity, float initialYVelocity){
    super(x, y, initialXVelocity, initialYVelocity);
    radius = 15;
    objColor = #C97676;
    shape = "circle";
    displayVectors = true;
  }
  
  public UncontrollableCircle(float x, float y, float initialXVel, float initialYVel, float initialXAccel, float initialYAccel){
    super(x,y,initialXVel, initialYVel,initialXAccel,initialYAccel);
    radius = 15;
    objColor = #C97676;
    shape = "circle";
    displayVectors = true;
  }
    
  public void display(){
    fill(objColor);
    circle(coord.getX(),coord.getY(),radius*2);    
    displayClosestObjectLine();
    super.display();
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
    return false;
  }//isColliding
  
  public void collideWithRectangle(){
    //find direction in which we are colliding
    float cx = this.coord.getX();//rect's closest edges
    float cy = this.coord.getY();
    float testx = cx;
    float testy = cy;
    StaticRectangle other = (StaticRectangle)closestObject;
    Coordinate tempCoord = other.getUpperLeftCoord();
    float rx = tempCoord.getX();
    float ry = tempCoord.getY();
    float rw = other.xDim;
    float rh = other.yDim;    
    
    if ((cx) < rx || (cx) > (rx+rw)) { //circle is to the left or right of the rectangle
      this.setVelocity(new IVec(0-(velocity.x()*C_BOUNCE),velocity.y(),0));
      //this.setXVelocity(0-xVelocity);
    } else if ((cy) < ry || (cy) > (ry+rh)) { //circle is above or below rectangle
      this.setVelocity(new IVec(velocity.x(),0-(velocity.y()*C_BOUNCE),0));
      //this.setYVelocity(0-yVelocity);
    } 
  }
  
  public void collideWithCircle(){ // math comes from here: https://flatredball.com/documentation/tutorials/math/circle-collision/
    UncontrollableCircle other = (UncontrollableCircle) closestObject;
    float cx1 = this.coord.getX();
    float cy1 = this.coord.getY();
    float cx2 = closestObject.coord.getX();
    float cy2 = closestObject.coord.getY();
    float rad1 = this.radius;
    float rad2 = other.radius;
    
    IVec relDiff = new IVec(cx1-cx2,cy1-cy2,0); // vector with
    IVec relVel = this.velocity.dup();
    relVel.sub(other.getVelocity());
    double distance = relVel.len();
    if(distance < (rad1+rad2)){
      IVec normal = relDiff.unit();
      if(relVel.dot(normal) < 0){
        double dotValue = relVel.dot(normal);
        normal.mul(dotValue); //mul transforms normal
        normal.mul(C_BOUNCE);
        relVel.sub(normal);
        this.velocity.add(other.velocity);
        this.velocity.add(relVel);
      }
    }    
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
