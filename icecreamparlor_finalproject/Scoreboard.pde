class Scoreboard{
  int points, lives, level;
  int[] request;
  
 
 Scoreboard(){
    points = 0;
    lives = 3;
    level = 1;
    
    // TO DO make the request larger when level advances
   
    request = new int[level];
    for (int i = 0; i < request.length ; i++){
      request[i] = int(random(scoops.shapes.length));
      //println(int(random(scoops.shapes.length)));
    }
 }

  // creates an array list of scoops according to the request
 ArrayList<Scoop> createRequest(){
    int w = width-50;
     int h = 100;
     stroke(255,199,240);
     strokeWeight(10);
     fill(0);
     rect(25,25,w,h,10);
     fill(255);
     textSize(30);
     textAlign(CENTER,CENTER);
     text(points,w-90,h-25);
     
    ArrayList<Scoop> scoopsReq = new ArrayList<Scoop>();
    String[] flavors = new String[]{"vanilla", "chocolate", "mint", "grape", "blueberry", "coffee","lemon","strawberry"};
     for(int i = 0; i < request.length ; i++){
       //corrected some errors with having the right id
       String source = "data/" + flavors[request[i]] + ".svg";
       //print(flavors[request[i]]);
       PShape shape;
       shape = loadShape(source);
       Scoop temp = new Scoop(request[i],shape);
       scoopsReq.add(temp);
     }
     int d = 20;
     for(Scoop scoop : scoopsReq){
       scoop.position.x = 50+d;
       scoop.position.y = 80;
       pushMatrix();
       scale(0.6);
       scoop.display();
       popMatrix();
       d+=75;
     }
     return scoopsReq;
 }
 
 // creates a brand new request 
 // this method is called whenever the user completes an order
 void newRequest(){
   if(level < 6){
    request = new int[level];
   }else{
     request = new int[level];
   }
    for (int i = 0; i < request.length ; i++){
      request[i] = int(random(scoops.shapes.length));
      //println(int(random(scoops.shapes.length)));
    }
 }
 
 //displays the request and score
 void display(){
     ArrayList<Scoop> scoopsReq = createRequest();
     if (scoops.meetsRequest(scoopsReq)){
         //gets new request
         newRequest();
         upScore();
     };
     for(int i = 0; i<lives; i++){
        image(life,50+32*i,40,16,16);
     }
     
 }
 
 //increates score and increases level
 // the level dictates the size of the order
 void upScore(){
   points+=(request.length*10);  
   if (level == 8){ //max size of request
       level = int(random(5,8));
   } else{
     level += 1;
   }
   return;
   /*
   Boolean correct = true;
   println();
    for(int i = 0; i < sc.scoopstack.size(); i++){
        if (sc.scoopstack.get(i).id != request[i]){
          correct = false;
        }
    }
    
    if(correct){
      points++;
      for (int i = 0; i < request.length ; i++){
        request[i] = int(random(scoops.shapes.length));
        //println(int(random(scoops.shapes.length)));
      
      }
    }
    
     sc.scoopstack.clear();
     */
 }
 
 Boolean lost(){
     
     if (lives == 0){
        return true;
       /*
        textSize(100);
        textAlign(CENTER,CENTER);
        text("GAME OVER", width/2, height/2);
        */
     }
     return false;
 }
 
 void gameOver(){
        textSize(100);
        textAlign(CENTER,CENTER);
        text("GAME OVER", width/2, height/2);
 }
 
 void restart(){
    points = 0;
    
 }
  
}
