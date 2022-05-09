class Scrollbar{
  int min, max, w;
  PVector position;
  PVector buttonPosition;
  RoundButton button;
  Boolean grab;
  Scrollbar(PVector position, int min, int max){
    this.position = position;
    this.min = min;
    this.max = max;
    buttonPosition = new PVector(position.x+150,position.y);
    w = 150; //default 300 pixels long
    grab = false;
  }
  
  void display(){
     strokeWeight(4);
     stroke(color(200,204,231));
     line(position.x, position.y, position.x+w, position.y);
     
     if (grab){
       float value;
       if (mouseX>(scroll.position.x + scroll.w+10)){
          value = scroll.position.x + scroll.w;
          grab = false;
       } else if (mouseX<(scroll.position.x-10)){
          value = scroll.position.x;
          grab = false;
       }  else{
        value = mouseX;
       }
       buttonPosition.x = value;
       button = new RoundButton(new PVector(value, position.y), new PVector(20,20),color(195,185,249));
     } else{
     button = new RoundButton(buttonPosition, new PVector(18,18),color(251,134,30));
     }
     button.display();
     
     float value;
     //println((buttonPosition.x-position.x)/w);
     value = lerp(min-40,max,(buttonPosition.x-position.x)/w);
     //gain.setValue(value);
     backgroundMusic.setGain(value);
     //println(backgroundMusic.getGain());
     for (AudioPlayer man : angryMan) {
        man.setGain(value);
     }
     catchScoop.setGain(value); 
     dropScoop.setGain(value);
     youreFired.setGain(value);
     //println("if the min is",min,"and the max is",max,"then the button is at",value);
  }
  
  
    
}
