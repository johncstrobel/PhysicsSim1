import igeo.*;
import igeo.gui.*;
import igeo.io.*;
import igeo.p.*;

//------------------------------------------------------------------------------------------------------------------------
//--VARIABLES-------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------------
public final IVec C_GRAVITY = new IVec(0,0.01,0); // combine x and y gravity into the same vector
public final float C_MAX_VELOCITY = 10; // maximum velocity
public final float C_BOUNCE = 0.98; // percentage of "energy" conserved in collisions
public boolean PAUSED = false;

//object declarations
StaticRectangle b;
StaticRectangle e;
StaticRectangle wallN;
StaticRectangle wallE;
StaticRectangle wallS;
StaticRectangle wallW;
SimObject[] objects; 


//------------------------------------------------------------------------------------------------------------------------
//--SIM HELPER METHODS----------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------------
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
          } // if dist
        } 
      } // if objects not null, not same object
    } // for j
  } //for i
} //updateClosestObjects

void addToObjects(SimObject o){
  for (int i = 0; i < objects.length; i++){
    if(objects[i] == null){
      objects[i] = o;
      return;
    }
  }
  throw new RuntimeException("addToObjects: no further space in objects");
}


//------------------------------------------------------------------------------------------------------------------------
//--CONTROL METHODS-------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------------
void mousePressed(){
  boolean spawned = false;
  for (int i = 0; i < objects.length; i++){
    if(objects[i] == null){
      if(mouseButton == LEFT){
        objects[i] = new UncontrollableCircle(mouseX,mouseY,-1,0);
        objects[i].toggleClosestObjectLine(true);
      } else if (mouseButton == RIGHT){
        objects[i] = new UncontrollableCircle(mouseX,mouseY,1,0);
        objects[i].toggleClosestObjectLine(true);
      } else if (mouseButton == CENTER){
        objects[i] = new UncontrollableCircle(mouseX,mouseY,0,-1);
        objects[i].toggleClosestObjectLine(true);
      }
      spawned = true;
      break;
    }
  }    
}

void keyPressed(){
  if (key == ' '){
    if(PAUSED){PAUSED = false;}
    else {PAUSED = true;}
  }
}


//------------------------------------------------------------------------------------------------------------------------
//--SIM MAIN METHODS AND DRAWING------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------------

void setup(){
 frameRate(60);
 size(600,500);
 background(200);
 
 //object instantiations
  b = new StaticRectangle (150,200,100,100);
  e = new StaticRectangle (100,370,100,100);
  b.toggleClosestObjectLine(true);
  e.toggleClosestObjectLine(true);
  
  
  wallN = new StaticRectangle(4.9,0,float(width)-10,4.9);
  wallE = new StaticRectangle(0,0,4.9,float(height));
  wallS = new StaticRectangle(4.9,height-5,float(width)-10,4.9);
  wallW = new StaticRectangle(float(width)-5,0,4.9, float(height));
  objects = new SimObject[20];
  addToObjects(b);
  addToObjects(e);
  addToObjects(wallE);
  addToObjects(wallS);
  addToObjects(wallN);
  addToObjects(wallW);  
}

void draw(){
  if(!PAUSED){
    background(200);
    for (int i = 0; i < objects.length; i++){
      if (objects[i] != null){
        objects[i].display();
        if (objects[i].movable){
          objects[i].move();
          if( objects[i].outOfBounds()){
            objects[i] = null;
          }
          updateClosestObjects();
        }//movable
      }//displayable
    }//for
  } else {
    fill(#FFFFFF);
    text("PAUSED",10,10);
  }//paused
  
}
