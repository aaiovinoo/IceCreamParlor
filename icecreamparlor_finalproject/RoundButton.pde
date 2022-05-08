class RoundButton{
   PVector position;
   PVector size;
   color c;
   
   RoundButton(PVector position, PVector size, color c){
     this.position = position;
     this.size = size;
     this.c = c;
   }
   
   void display(){
    ellipseMode(CENTER);  
    float value;
    if (this.hover()){
      //c = color(250,220,254);
    } else{
      //c = color(121,130,187);
    }
    //stroke(color(hue(c)+10, saturation(c), brightness(c)));
    strokeWeight(2);
    //c = color(hue(c), value, brightness(c));
    fill(c);
    ellipse(position.x, position.y, size.x, size.y);
  }
  
  boolean hover(){
    //check distance from mouse position to center of circle
    float distance = sqrt(sq(mouseX - position.x)  + sq(mouseY - position.y));
    // dist(mouseX,position.x);
    return (distance < size.x/2);
  }
  

}  
