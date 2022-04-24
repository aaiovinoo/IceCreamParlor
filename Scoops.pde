class Scoops{
   PShape[] shapes;
   ArrayList<Scoop> scoopList = new ArrayList<Scoop>();
    ArrayList<Scoop> scoopstack = new ArrayList<Scoop>();
    ArrayList<Scoop> fallingscoops = new ArrayList<Scoop>();
   
   Scoops(){
     this.shapes = new PShape[8];
     //this.shapes = new PShape[1];
   } 
   
   void loadShapes(){
     String[] flavors = new String[]{"vanilla", "chocolate", "mint", "grape", "blueberry", "coffee","lemon","strawberry"};
     //String[] flavors = new String[]{"mint"};
     
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
        }
      }
      
       for (Scoop scoop : fallingscoops){ 
           scoop.fall();
           scoop.display();
       }
      
   }
   
   void reset(){
       scoopstack.clear();
       cone.numScoops = 0;
   }
   
  boolean meetsRequest(ArrayList<Scoop> request){
    for (int i = 0; i < scoopstack.size(); i ++){
         
      Scoop scoop = scoopstack.get(i);
          if (scoopstack.get(i).id != request.get(i).id){
            //println("doesn't the request");
             scoop.position.x = cone.xpos+scoop.offsetCone.x;
             scoop.position.y = cone.ypos+scoop.offsetCone.y - scoop.levelOnStack*30;
            fallingscoops.add(scoop);
            reset();
            return false;
          } else {
            if (i == request.size()-1){
             print("GOOD JOB! you completed an order");
             // TO-DO : call scoreboard and add points
         
             reset();
             return true;
            }
          //println("matches for request");
           scoop.position.x = cone.xpos+scoop.offsetCone.x;
           scoop.position.y = cone.ypos+scoop.offsetCone.y - scoop.levelOnStack*30;
           scoop.display();
          }
          

     }
     
    
     return false;
 }
   
}
