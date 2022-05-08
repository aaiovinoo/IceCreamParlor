class Scoop{
  int id, levelOnStack;
  PVector position, offsetCone;
  float velocity;
  PShape shape;
  boolean caught;
  float angle;

  Scoop(int id, PShape shape){
    this.id = id;
    this.shape = shape;
    position = new PVector(id*52,-50);
    offsetCone = new PVector(-20,-40);
    velocity = 6*random(1,2); //pixels per frame
    // adding a small difference in velocities to make the cones fall at different times
    caught = false;  
    levelOnStack = 0;
    angle = 0;
}
  
  void display(){
    //Draws scoop based on id, vel, pos
    pushMatrix();
    translate(position.x+50,position.y+50);
    rotate(angle);
    shape(shape, -50,-50, 100, 100); 
    popMatrix();
  }
  
  void move(){
    //makes scoop fall
    if (!caught){
      position.y += velocity;
      //reset velocity and position at top when it reaches the bottom of the screen
      if (position.y > height){
        if(id == score.createRequest().get(levelOnStack).id){
            //score.lives--;
        }
        position.y = -50;
        //position.x = random(50,450);
        int newId = int(random(scoops.shapes.length));
        id = newId;
        shape = scoops.shapes[id];
        //play random angry sound
       
        if (counter2%11 == 0 && !score.lost()){
          int idx;
          idx = counter%7;
          //println(idx);
          angryMan.get(idx).play();
          angryMan.get(idx).rewind();
          
          counter += 1;
        }
        counter2 += 1;
      }
    }
    
    display();
  }
  
  void discard(float dx){
    position.x += dx;
    position.y += velocity;
    velocity += 0.2+0.05*velocity;
    angle += radians(dx);
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
        //play sound
        catchScoop.play();
        catchScoop.rewind();
        //upping the contents;
        levelOnStack = cone.numScoops;
        cone.numScoops += 1;
      }
    }
  
         //TO-DO ASHWIN: add to scoreboard
      
    }
  
}
