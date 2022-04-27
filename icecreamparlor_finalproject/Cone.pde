class Cone {
  float xpos, ypos;
  int speed; 
  int numScoops; //should be equal to length of contents, but abi is initializing so she can write her code
  boolean moveLeft;
  ArrayList<PImage> cones;
  PImage currentCone;
  
  Cone(float xpos, float ypos, int speed){
    this.xpos = xpos;
    this.ypos = ypos;
    this.speed = speed;
    numScoops = 0; //initalizes at empty
    moveLeft = true;
    cones = new ArrayList<PImage>();
  }
  
  void loadImages(){
       String[] types = new String[]{"cone_1", "cone_2", "cone_4", "cone_reg_white", "cone_choco_white",
     "cone_reg_strawberry","cone_choco_strawberry", "cone_reg_mint", "cone_choco_mint"};
     
     for (int i=0; i<types.length; i++){
        String source = "data/" + types[i] + ".png";
        PImage img = loadImage(source);
        cones.add(img);
      }
      
      print(cones.size());
   }//ends loadImages
     
  
  void display() {
    currentCone = cones.get(score.level-1);
    image(currentCone, xpos, ypos,60,100);

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
  
  
