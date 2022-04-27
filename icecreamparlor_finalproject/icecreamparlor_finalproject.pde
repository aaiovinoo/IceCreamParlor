Sky sky = new Sky();
Scoops scoops = new Scoops();
Cone cone;
PShape coneSvg;
<<<<<<< Updated upstream
PImage nightPNG;
=======
>>>>>>> Stashed changes
Boolean shouldscore = false;
Scoreboard score = new Scoreboard();
//import ddf.minim.*;
//Minim minim;
//AudioPlayer player;
import processing.sound.*;
 SoundFile backgroundMusic;
//replace the sample.mp3 with your audio file name here
String audioName = "data/mrplastic-hot-air-11027.mp3";
String path;
PFont font;
  
void setup(){
    path = sketchPath(audioName);
    SoundFile file = new SoundFile(this, path);
    file.loop();
    
    font = createFont("data/font.ttf", 30);
    textFont(font, 30);
  size(510,800);
  scoops.loadShapes();
  //Cone(float xpos, float ypos, int speed)
  cone = new Cone(width/2,height-100,4);
<<<<<<< Updated upstream
  coneSvg = loadShape("data/cone_0.svg");
  
  nightPNG = loadImage("data/night.png");
=======
  coneSvg = loadShape("data/cone_reg_pink.svg");
  
>>>>>>> Stashed changes
  frameRate(80);
}

void draw(){
  background(sky.display());
  cone.display();
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
