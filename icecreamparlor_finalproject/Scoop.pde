class Scoop{
  int id, levelOnStack;
  PVector position, offsetCone;
  float velocity;
  PShape shape;
  boolean caught;

 
  Scoop(int id, PShape shape){
    this.id = id;
    this.shape = shape;
    position = new PVector(id*70,-50);
    offsetCone = new PVector(-20,-40);
    velocity = 2*random(.7,1.3); //pixels per frame
    // adding a small difference in velocities to make the cones fall at different times
    caught = false;  
    levelOnStack = 0;
}
  
  void display(){
    //Draws scoop based on id, vel, pos
    shape(shape, position.x, position.y, 100, 100); 
  }
  
  void move(){
    //makes scoop fall
    if (!caught){
      position.y += velocity;
      //reset velocity and position at top when it reaches the bottom of the screen
      if (position.y > height){
        if(id == score.createRequest().get(0).id){
            score.lives--;
        }
        position.y = -50;
        //position.x = random(50,450);
        int newId = int(random(scoops.shapes.length));
        id = newId;
        shape = scoops.shapes[id];
      }
    }
    
    display();
  }
  
  void fall(){
    position.x += 3;
    position.y -= 1;
  }
  
  void catchScoop(){
    //TO-DO: checks how close to the scoop is to the cone using their position attributes
    PVector collisionPoint = new PVector(cone.xpos+30,cone.ypos +30 - (levelOnStack*30+25));
    PVector bottom = new PVector (position.x+50,position.y+70);
    //ellipse(bottom.x,bottom.y,15,15);
    //rectMode(RADIUS);
    //rect(collisionPoint.x,collisionPoint.y,20,5);
    if (abs(collisionPoint.y - bottom.y) <10){
      if (abs(collisionPoint.x - bottom.x)<20){
        caught = true;
        //upping the contents;
        levelOnStack = cone.numScoops;
        cone.numScoops += 1;
      }
    }
  
         //TO-DO ASHWIN: add to scoreboard
      
    }
  
}
