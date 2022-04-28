Sky sky = new Sky();
Scoops scoops = new Scoops();
Clouds clouds = new Clouds();
Cone cone;
PShape coneSvg;
PImage life;
PImage nightPNG;
PImage checkMark;
PImage cloud;
Boolean shouldscore = false;
Scoreboard score = new Scoreboard();
//import ddf.minim.*;
//Minim minim;
//AudioPlayer player;
//import processing.sound.*;
 //SoundFile backgroundMusic;
//replace the sample.mp3 with your audio file name here
//String audioName = "data/mrplastic-hot-air-11027.mp3";
//String path;
PFont chalkFont, regFont;
  
void setup(){

    
  chalkFont = createFont("data/chalkFont.ttf", 30);
  regFont = createFont("data/regFont.ttf",50);
  checkMark = loadImage("data/x.png");
  size(510,800);
  scoops.loadShapes();
  //Cone(float xpos, float ypos, int speed)
  cone = new Cone(width/2,height-100,4);
  cone.loadImages();
  clouds.load();
  life = loadImage("data/heart.png");
  nightPNG = loadImage("data/night.png");
  frameRate(80);
}

void draw(){
  if(!score.lost()){
    background(sky.display());
    clouds.display();
    cone.display();
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
