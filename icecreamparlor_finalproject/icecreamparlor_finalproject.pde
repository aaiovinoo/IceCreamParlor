Sky sky = new Sky();
Scoops scoops = new Scoops();;
Clouds clouds = new Clouds();
Cone cone;
int counter = 0;
int counter2 = 0;
PShape coneSvg;
PShape openSign;
PImage life, woodenWall, awning, checkMark,cloud, day, night, mute, loud;
Boolean shouldscore = false;
Scoreboard score = new Scoreboard();
import ddf.minim.*;
import ddf.minim.ugens.*;
Minim  minim;
Oscil wave;
Gain       gain;
AudioOutput out;
AudioPlayer backgroundMusic, catchScoop, dropScoop;
AudioPlayer angryMan1, angryMan2, angryMan3, angryMan4, angryMan5, angryMan6, angryMan7, youreFired, chaChing;
ArrayList<AudioPlayer> angryMan = new ArrayList<AudioPlayer>(); 
PFont chalkFont, regFont;
Scrollbar scroll;
RadioButton backgroundWidget;
color backgroundColor;
color[] skyColors = new  color[2];

void setup(){
  skyColors[0] =  color(137,207,240);
  skyColors[1] =  color(10,0,102);
  backgroundColor = skyColors[sky.display()];
  background(backgroundColor);
  clouds.display();
  minim  = new Minim(this);
  backgroundMusic = minim.loadFile("data/mrplastic-hot-air-11027.mp3");
  catchScoop = minim.loadFile("data/catchScoop.mp3");
  dropScoop = minim.loadFile("data/dropScoop.mp3");
  youreFired = minim.loadFile("data/youreFired.mp3");
  chaChing =  minim.loadFile("data/chaChing.mp3");
 
  for (int i = 0; i < 7; i ++) {
    AudioPlayer player;
    player = minim.loadFile("data/angryMan"+(i+1)+".mp3");
    angryMan.add(player);
  }
  backgroundMusic.loop();
  //wave = new Oscil( 440, 0.5f, Waves.SINE );

  //gain = new Gain();

  //out = minim.getLineOut();

  //wave.patch(gain);
  //gain.patch(out);
  //backgroundMusic.play();
  //backgroundMusic.setGain(.5);
  // patch the file player to the output
 
 
                        
  frameRate(20);
  chalkFont = createFont("data/chalkFont.ttf", 30);
  regFont = createFont("data/regFont.ttf",50);
  checkMark = loadImage("data/x.png");
  
  size(510,800);
  scoops.loadShapes();
  //Cone(float xpos, float ypos, int speed)
  cone = new Cone((width-70)/2,height-100,10);
  cone.loadImages();
  clouds.load();
  life = loadImage("data/heart.png");
  frameRate(80);
  woodenWall = loadImage("data/woodenWall.jpg");
  awning = loadImage("data/awning2.png");
  openSign = loadShape("data/openSign.svg");
  night = loadImage("data/night.png");
  day = loadImage("data/day.png");
  mute = loadImage("data/mute.png");
  loud = loadImage("data/loud.png");
  
  scroll = new  Scrollbar(new PVector(84,174), 0, 40);
  backgroundWidget = new RadioButton(2, new PVector(390,174));
  backgroundWidget.createButtons();
  backgroundWidget.select(sky.display());
  frameRate(20);
  
  
}

void draw(){
  if(!score.lost()){
    background(backgroundColor);
    clouds.display();
    cone.display();
    cone.move();
    scoops.display();
    image(woodenWall, 0, 0, width, 210);
    image(awning, -10, 210, width+10, 40);
    //noStroke(); 
    //fill(31,38,42);
    //ellipse(45,170,50,45);
    image(mute, 25, 151,50,50);
    image(loud, 248, 151,50,50);
    scroll.display();
    image(day, 325, 151,50,50);
    image(night, 405, 151,50,50);
    backgroundWidget.display();
    

    //translate(100,-140);
    //rotate(PI/8);
    //shape(openSign, width-150, 190,100, 75);
    
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
        //println("debugL: "+cone.xpos);
        cone.moveLeft();
      } else  if (keyCode == RIGHT){
        //println("debugR: "+cone.xpos);
       cone.moveRight();
      }
    }
    if(score.lost() && key ==' '){
      //rstarts the game if on Game Over
      //println("debug");
      score = new Scoreboard();
      scoops = new Scoops();
      scoops.loadShapes();
    }   
}

void mousePressed(){
  if (backgroundWidget.hover()>=0){
     int i = backgroundWidget.hover();
     println("pressed button ",i);
     backgroundWidget.select(i);
     sky.toggleColor(skyColors[i]);
  }
  if (scroll.button.hover()){
    scroll.grab = true;
  }
}

void mouseReleased(){
  if (scroll.grab){
    scroll.grab = false;
    float value;
    if (mouseX>(scroll.position.x + scroll.w+10)){
      value = scroll.position.x + scroll.w;
    } else if (mouseX<(scroll.position.x-10)){
      value = scroll.position.x;
    }  else{
      value = mouseX;
    }
    scroll.buttonPosition.x = value;
 }
}
