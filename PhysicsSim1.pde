void setup(){
 frameRate(60);
 size(600,500);
 background(200);
 
 //object instantiations
  c = new UncontrollableCircle(200,100,0,0,0,0);
  b = new StaticObject (200,200,100,100);
  //wallN = new StaticObject(0,0,4.9,float(height));
  //wallE = new StaticObject(4.9,0,float(width)-10,4.9);
  //wallS = new StaticObject(0,0,4.9,float(height));
  //wallW = new StaticObject(4.9,0,float(width)-10,4.9);
  objects = new SimObject[6];
  objects[0] = c;
  objects[1] = b;
  objects[2] = wallN;
  objects[3] = wallE;
  objects[4] = wallS;
  objects[5] = wallW;
  
}

//constants
public final float C_GRAVITY = 0.02;
public final float C_MAX_VELOCITY = 60;

//object declarations
UncontrollableCircle c;
StaticObject b;
StaticObject wallN;
StaticObject wallE;
StaticObject wallS;
StaticObject wallW;
SimObject[] objects; 

void draw(){
  background(200);
  for (int i = 0; i < objects.length; i++){
    if (objects[i] != null){
      objects[i].display();
      if (objects[i].movable){
        objects[i].move();
      }
    }
  }
  
  
  //if(wallN != null){wallN.display();}
  //if(wallE != null){wallE.display();}
  //if(wallS != null){wallS.display();}
  //if(wallW != null){wallW.display();}
  
}
