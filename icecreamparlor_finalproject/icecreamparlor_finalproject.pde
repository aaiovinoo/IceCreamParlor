Sky sky = new Sky();
Scoops scoops = new Scoops();;
Clouds clouds = new Clouds();
Cone cone;
PShape coneSvg;
PShape openSign;
PImage life;
PImage woodenWall;
PImage awning;
PImage checkMark;
PImage cloud;
Boolean shouldscore = false;
Scoreboard score = new Scoreboard();
import ddf.minim.*;
Minim              minim;
AudioPlayer backgroundMusic;
AudioPlayer catchScoop;
AudioPlayer dropScoop;;


//import processing.sound.*;
 //SoundFile backgroundMusic;
//replace the sample.mp3 with your audio file name here
//String audioName = "data/mrplastic-hot-air-11027.mp3";
//String path;
PFont chalkFont, regFont;
  
void setup(){
   minim  = new Minim(this);
 
  backgroundMusic = minim.loadFile("data/mrplastic-hot-air-11027.mp3");
  catchScoop = minim.loadFile("data/catchScoop.mp3");
  dropScoop = minim.loadFile("data/dropScoop.mp3");
  //backgroundMusic.play();
  backgroundMusic.loop();
  frameRate(25);
  chalkFont = createFont("data/chalkFont.ttf", 30);
  regFont = createFont("data/regFont.ttf",50);
  checkMark = loadImage("data/x.png");
  size(510,800);
  scoops.loadShapes();
  //Cone(float xpos, float ypos, int speed)
  cone = new Cone(width/2,height-100,8);
  cone.loadImages();
  clouds.load();
  life = loadImage("data/heart.png");
  woodenWall = loadImage("data/woodenWall.jpg");
  awning = loadImage("data/awning.png");
  openSign = loadShape("data/openSign.svg");


}

void draw(){
  if(!score.lost()){
    background(sky.display());
    clouds.display();
    cone.display();
    cone.move();
    scoops.display();
    image(woodenWall, 0, 0, width, 175);
    image(awning, -10, 175, width+10, 60);

    score.display(); 

    pushMatrix();
    //translate(100,-140);
    //rotate(PI/8);
    shape(openSign, width-150, 140,100, 75);
    popMatrix();
    score.display();

    shouldscore = cone.submit(scoops); 
    
  }else{
    //game over screen
    score.gameOver();
  }
 
  //noLoop();
}

void stop()
{
// always close Minim audio classes
backgroundMusic.close();
//catchScoop.close();
// always stop Minim before exiting
minim.stop();
// The super.stop() makes sure that all the normal cleanup routines are done
super.stop();
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
