class Scoreboard{
  int points, lives, level, pointsRaised, topScore; //pointsRaised is how many points the player won in their last cone
  int[] request;
  ArrayList<Message> messages = new ArrayList<Message>();
  Boolean scoreSaved;
   
 Scoreboard(){
    points = 0;
    lives = 3;
    level = 1;
    topScore = 0;
    scoreSaved = false;
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

     rectMode(CORNER);
     int h = 108;
     //stroke(161,91,205);
     //stroke(147,112,219);
     stroke(248,131,208);
     strokeWeight(6);

     fill(31,38,42);
     rect(25,30,w,h,10);
     fill(255);
     textAlign(RIGHT,CENTER);
     textFont(chalkFont, 30);
     text(points,w-25,h-40);
     textFont(chalkFont, 20);
     text("Level: "+level,w-25,h-5);
     
    ArrayList<Scoop> scoopsReq = new ArrayList<Scoop>();
    String[] flavors = new String[]{"vanilla", "chocolate", "mint", "grape", "cherry","blueberry", "coffee","lemon","strawberry"};
     for(int i = 0; i < request.length ; i++){
       //corrected some errors with having the right id
       String source = "data/" + flavors[request[i]] + ".svg";
       //print(flavors[request[i]]);
       PShape shape;
       shape = loadShape(source);
       Scoop temp = new Scoop(request[i],shape);
       scoopsReq.add(temp);
     }
     int d = 25;
     for(Scoop scoop : scoopsReq){
       scoop.position.x = 50+d;
       scoop.position.y = 78;
       pushMatrix();
       scale(0.5);
       scoop.display();
       popMatrix();
       d+=50;
     }
     return scoopsReq;
 }
 
 // creates a brand new request 
 // this method is called whenever the user completes an order
 void newRequest(){
   if(level < 9){
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
         upScore();
         newRequest();
     };
     for(int i = 0; i<lives; i++){
        image(life,50+32*i,90,16,16);
     }
     for (Message msg : messages){
       msg.display();
     }
     
 }
 
 //increates score and increases level
 // the level dictates the size of the order
 void upScore(){
   pointsRaised = (request.length*100);
   points+= pointsRaised;  
   messages.add(new Message("+"+String.valueOf(pointsRaised),new PVector(cone.xpos, height-100),cone.xpos));
   if (level == 9){ //max size of request
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
     }
     return false;
 }
 
 void gameOver(){
     rectMode(CENTER);
     
     stroke(255,199,240);
     strokeWeight(8);
     fill(31,38,42);
     rect(width/2,height/2, width-50, height-50,10);
     
    stroke(255);
    fill(255); 
    textFont(regFont, 70); 
    textAlign(CENTER,CENTER);
    text("GAME OVER", width/2, 100);
    textFont(regFont, 50); 
    String s = "SCORE: " + points;
    text(s,width/2,200);
    
    if(!scoreSaved){
      exportScore();
      scoreSaved = true;
    }
    s = "High Score: " + topScore;
    text(s,width/2,300);
    
    stroke(255,199,240);
    fill(245,166,224);
    rect(width/2,500,300,100,10);
    fill(255);
    text("RESTART",width/2,500);
    if((mouseX > width/2-150 && mouseX < width/2+150) && (mouseY > 500-50 && mouseY < 500+50)){
       cursor(HAND);
       if(mousePressed){
           restartGame();
           cursor(ARROW);
       }
    }
    else{
       cursor(ARROW); 
    }
    
 }
 
 void restart(){
    points = 0;
    
 }
 
 void exportScore(){
   
   Table highScores = loadTable("data/Scores.csv", "header");
   int[] scoreList = new int[highScores.getRowCount()+1]; 
   for(TableRow row : highScores.rows()){
       //println("Score: " + row.getInt("Score"));
   }
   TableRow newScore= highScores.addRow();
   newScore.setInt(highScores.getColumnCount()-1,points);
   println();
   int t = 0;
   for(TableRow row : highScores.rows()){
       println("Score: " + row.getInt("Score"));
       scoreList[t] = row.getInt("Score");
       t++;
   }
   println();
  saveTable(highScores,"data/Scores.csv");
  for(int sc : scoreList){
     println(sc); 
  }
  println();
  topScore = max(scoreList);
  
  
 }
 
  
}
