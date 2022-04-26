class Cone {
  float xpos, ypos;
  int speed; 
  int numScoops; //should be equal to length of contents, but abi is initializing so she can write her code
  boolean moveLeft;
  
  Cone(float xpos, float ypos, int speed){
    this.xpos = xpos;
    this.ypos = ypos;
    this.speed = speed;
    numScoops = 0; //initalizes at empty
    moveLeft = true;
  }
  
  void display() {
    image(coneImg, xpos, ypos,60,100);

  } 
  
  boolean submit(Scoops curscoops) { 
   return curscoops.scoopstack.size() > 5;
  }
  
  void move() {

    if(keyPressed && (keyCode == LEFT || keyCode == RIGHT)){

        if (moveLeft){ 
          xpos -= speed;
        } else { 
          xpos += speed;
        }
    }
  }
                
}    
  
  
