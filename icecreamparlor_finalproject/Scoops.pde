class Scoops{
   PShape[] shapes;

    ArrayList<Scoop> scoopList = new ArrayList<Scoop>();
    ArrayList<Scoop> scoopstack = new ArrayList<Scoop>();
    Scoop fallenScoop;

   
   Scoops(){
     this.shapes = new PShape[9];
   } 
   
   void loadShapes(){
     String[] flavors = new String[]{"vanilla", "chocolate", "mint", "grape", "cherry","blueberry", "coffee","lemon","strawberry"};
     
     for (int i=0; i<shapes.length; i++){
        String source = "data/" + flavors[i] + ".svg";
        shapes[i] = loadShape(source);
        Scoop scoop = new Scoop(i,shapes[i]);
        scoopList.add(scoop);
      }
   }//ends loadShapes
   
 
   
   void display(){
     for (Scoop scoop : scoopList){ 
       
        scoop.catchScoop();
        scoop.move();
        //make new scoop if scoop is caught
        if (scoop.caught){
          //create duplicate scoop to be stacked on cone
          Scoop newScoop = new Scoop(scoop.id,shapes[scoop.id]);
          newScoop.levelOnStack = scoop.levelOnStack;
          //add this duplicate scoop to the scoopstack
          scoopstack.add(newScoop);
        
          //reset the original scoop to top
            scoop.position.y = -50;
            //position.x = random(50,450);
            int newId = int(random(scoops.shapes.length));
            scoop.id = newId;
            scoop.shape = scoops.shapes[scoop.id];
            scoop.caught = false;
            scoop.velocity = (score.level+6)*random(1.3,1.6);
        }
      }
      
       if(fallenScoop != null){
           
           fallenScoop.discard(5);
           fallenScoop.display();
       }
       
      
   } // ends display()
   
   void reset(){
       scoopstack.clear();
       cone.numScoops = 0;
   }
  
   
   
   
  boolean meetsRequest(ArrayList<Scoop> request){
    for (int i = 0; i < scoopstack.size(); i ++){
         
      Scoop scoop = scoopstack.get(i);
      
      
          if (scoopstack.get(i).id != request.get(i).id){
            score.lives--;
            //play sound
            dropScoop.play();
            dropScoop.rewind();
            
            if(score.lost()){
              youreFired.play();
              youreFired.rewind();
            }
            //println("doesn't the request");
             scoop.position.x = cone.xpos+scoop.offsetCone.x;
             scoop.position.y = cone.ypos+scoop.offsetCone.y - scoop.levelOnStack*30;

            fallenScoop = scoop;
            fallenScoop.velocity = 0;

            reset();
            return false;
          } else {
            if (i == request.size()-1){
              chaChing.play();
              chaChing.rewind();
             println("GOOD JOB! you completed an order");

             // TO-DO : call scoreboard and add points
             reset();
             return true;
            }
          //println("matches for request");
           scoop.position.x = cone.xpos+scoop.offsetCone.x;
           scoop.position.y = cone.ypos+scoop.offsetCone.y - scoop.levelOnStack*30;
           scoop.display();
           
           //draw a check
           
          image(checkMark, 48+25*i,50,30,30);
          }
          

     }
     
    
     return false;
 }
   
}
