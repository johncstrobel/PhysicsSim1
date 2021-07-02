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
  
  public void displayClosestObjectLine(){
    stroke(#FFFFFF);
    line(coord.getX(),coord.getY(),closestObject.getCoord().getX(),closestObject.getCoord().getY());
    stroke(#000000);
  }
  
  public void display(){
    fill(objColor);
    circle(coord.getX(),coord.getY(),radius*2);    
    displayClosestObjectLine();
  }
  
  public float getRadius(){
    return radius;
  }
  
  public boolean isColliding(){ //check for collision
    if (closestObject.getShape() == "rectangle"){
      //variables
      StaticRectangle tempObj = (StaticRectangle) closestObject;
      float rx = tempObj.coord.getX();
      float ry = tempObj.coord.getY();
      float rw = tempObj.xDim;
      float rh = tempObj.yDim;
      float cx = this.coord.getX();
      float cy = this.coord.getY();
      
      //find rect closest side
      float testx = cx;//rect's closest edges
      float testy = cy;
      
      if (cx < rx) {testx = rx;}//right edge
      else if (cx > rx+rw) {testx = rx+rw;} //left edge
      
      if (cy < ry) {testy = ry;}//top edge
      else if (cy > ry+rh) {testy = ry+rh;}//bottom edge
      
      float distx = cx-testx;
      float disty = cy-testy;
      float distance = sqrt((distx*distx)+(disty*disty));
      
      if (distance <= this.radius) {
        return true;
      }
    } //if rect
    
    if (closestObject.getShape() == "circle"){
      UncontrollableCircle tempObj = (UncontrollableCircle) closestObject;
      float x1 = coord.getX();
      float x2 = tempObj.coord.getX();
      float y1 = coord.getY();
      float y2 = tempObj.coord.getY();
      float distance = sqrt(pow((x2-x1),2) + pow((y2-y1),2));
      if (distance < this.radius + tempObj.getRadius()){
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
