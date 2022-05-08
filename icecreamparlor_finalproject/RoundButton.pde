class RoundButton{
   PVector position;
   PVector size;
   color c;
   int hueOn;
   int hueOff;
   
   RoundButton(PVector position, PVector size, color c){
     this.position = position;
     this.size = size;
     this.c = c;
     hueOn = 0;
     hueOff = 100;
   }
   
   void display(){
    ellipseMode(CENTER);  
    float value;
    if (this.hover()){
      value = 30;
    } else{
      value = 60;
    }
    stroke(color(hue(c)+10, saturation(c), brightness(c)));
    strokeWeight(3);
    c = color(hue(c), value, brightness(c));
    fill(c);
    ellipse(position.x, position.y, size.x, size.y);
  }
  
  boolean hover(){
    //check distance from mouse position to center of circle
    float distance = sqrt(sq(mouseX - position.x)  + sq(mouseY - position.y));
    // dist(mouseX,position.x);
    return (distance < size.x/2);
  }
  
   
   void turnOn(){
     println("turn on");
    c = color(hueOn,saturation(c),brightness(c));
  }
  
  void turnOff(){
   c = color(hueOff,saturation(c),brightness(c));
  }
}  
