color sky = color(124,185,232);
Scoops scoops = new Scoops();
Cone cone;
PImage coneImg;
PImage life;
Boolean shouldscore = false;
Scoreboard score = new Scoreboard();

void setup(){
  size(510,800);
  scoops.loadShapes();
  //Cone(float xpos, float ypos, int speed)
  cone = new Cone(width/2,height-100,5);
  coneImg = loadImage("data/cone.png");
  life = loadImage("data/heart.png");
}

void draw(){
  
  if(!score.lost()){
    background(sky);
    cone.drawcone();
    cone.move();
    scoops.display();
    score.display();
    shouldscore = cone.submit(scoops); 
  }else{
    //game over screen
        score.gameOver();
  }
  
 
  
  //noLoop();
}

void keyPressed() {
    if (key == CODED){
      if (keyCode == LEFT){
        cone.moveLeft = true;
      } else  if (keyCode == RIGHT){
       cone.moveLeft = false;
      }
    }
    if(score.lost() && key ==' '){
      //rstarts the game if on Game Over
      println("debug");
      score = new Scoreboard();
      scoops = new Scoops();
      scoops.loadShapes();
    }
   
}
