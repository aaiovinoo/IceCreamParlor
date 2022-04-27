class Cone {
  float xpos, ypos;
  int speed; 
  int numScoops; //should be equal to length of contents, but abi is initializing so she can write her code
  Boolean moveLeft;
  int w, h; //width and height to display;
  
  Cone(float xpos, float ypos, int speed){
    this.xpos = xpos;
    this.ypos = ypos;
    this.speed = speed;
    numScoops = 0; //initalizes at empty
    moveLeft = true;
    w = 60;
    h = 100;
  }
  
  void display() {
    image(coneImg, xpos, ypos,w,h);

  } 
  
  boolean submit(Scoops curscoops) { 
   return curscoops.scoopstack.size() > 5;
  }
  
  void move() {

    if(keyPressed && (keyCode == LEFT || keyCode == RIGHT)){
      if(this.xpos >= -60 && this.xpos <= width){
        this.xpos+=speed;
      }else if(this.xpos <-60){
         this.xpos = width-1; 
      }else{
         this.xpos = -59; 
      }
        
    }
  }
  
  void moveLeft(){
      speed = -1*abs(speed);
  }
  void moveRight(){
       speed = abs(speed);
  }
                
}    
  
  
