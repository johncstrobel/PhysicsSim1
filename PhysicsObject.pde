public class PhysicsObject{
 //shape
 //movable
 //movement function
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
}
