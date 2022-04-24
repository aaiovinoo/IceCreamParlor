color sky = color(124,185,232);
Scoops scoops = new Scoops();
Cone cone;
PImage coneImg;
Boolean shouldscore = false;
Scoreboard score = new Scoreboard();

void setup(){
  size(510,800);
  scoops.loadShapes();
  //Cone(float xpos, float ypos, int speed)
  cone = new Cone(width/2,height-100,5);
  coneImg = loadImage("data/cone.png");
}

void draw(){
  background(sky);
  cone.drawcone();
  cone.move();
  scoops.display();
  score.display();
  shouldscore = cone.submit(scoops); 
 
  
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
   
}
