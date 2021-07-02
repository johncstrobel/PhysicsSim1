void setup(){
 frameRate(60);
 size(600,500);
 background(200);
 
 //object instantiations
  c = new UncontrollableCircle(100,250,0,0,0,0);
  b = new StaticRectangle (150,200,100,100);
  d = new UncontrollableCircle(30, 250,0,0,0,0);
  e = new StaticRectangle (100,370,100,100);
  c.toggleClosestObjectLine(true);
  b.toggleClosestObjectLine(true);
  e.toggleClosestObjectLine(true);
  d.toggleClosestObjectLine(true);
  
  
  //wallN = new StaticObject(0,0,4.9,float(height));
  //wallE = new StaticObject(4.9,0,float(width)-10,4.9);
  //wallS = new StaticObject(0,0,4.9,float(height));
  //wallW = new StaticObject(4.9,0,float(width)-10,4.9);
  objects = new SimObject[20];
  objects[0] = c;
  objects[1] = b;
  objects[2] = e;
  //objects[3] = wallE;
  //objects[4] = wallS;
  //objects[5] = wallW;
  objects[6] = d;
  
}

//constants
public final float C_GRAVITY = 0.01;
public final float C_X_GRAVITY = 0;
public final float C_MAX_VELOCITY = 60;
public boolean PAUSED = false;

//object declarations
UncontrollableCircle c;
StaticRectangle b;
UncontrollableCircle d;
StaticRectangle e;
//StaticRectangle wallN;
//StaticRectangle wallE;
//StaticRectangle wallS;
//StaticRectangle wallW;
SimObject[] objects; 


//simulation methods
void mousePressed(){
  boolean spawned = false;
  for (int i = 0; i < objects.length; i++){
    if(objects[i] == null){
      objects[i] = new UncontrollableCircle(mouseX,mouseY);
      spawned = true;
      break;
    }
  }
  //if(!spawned){
    
}

void keyPressed(){
  if (key == ' '){
    if(PAUSED){PAUSED = false;}
    else {PAUSED = true;}
  }
}

void updateClosestObjects(){
  for (int i = 0; i < objects.length; i++){
    for (int j = 0; j < objects.length; j++){
      if (objects[i] != null && objects[j] != null && !objects[i].equals(objects[j])){
        if (objects[i].getClosestObject() == null){
          objects[i].setClosestObject(objects[j]); 
        } else { //compare distance
          float dist1 = objects[i].getDistance(objects[i].getClosestObject());
          float dist2 = objects[i].getDistance(objects[j]);
          if (dist1 > dist2){
            objects[i].setClosestObject(objects[j]);
            println("closest object changed");
          } // if dist
        } 
      } // if objects not null, not same object
    } // for j
  } //for i
} //updateClosestObjects




void draw(){
  if(!PAUSED){
    background(200);
    for (int i = 0; i < objects.length; i++){
      if (objects[i] != null){
        objects[i].display();
        if (objects[i].movable){
          objects[i].move();
          updateClosestObjects();
        }//movable
      }//displayable
    }//for
  } else {
    fill(#FFFFFF);
    text("PAUSED",10,10);
  }//paused
  
}
