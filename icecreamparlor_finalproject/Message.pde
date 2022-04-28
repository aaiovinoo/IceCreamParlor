class Message{
  String msg;
  PVector position;
  float start;
  float x;
  Message(String msg, PVector position, float start){
    this.msg = msg;
    this.position = position;
    this.start = start;
    this.x = 1;
  }
  
  void display(){
    
   if (position.x<height+50 && -50<position.x){
    if (start > width/2){ //go left
       position.x -= 4;
    } else{
       position.x += 6;
    }
     position.y -= 4;
     textAlign(CENTER,CENTER);
     if (1/(2*x)<3){
        textFont(regFont, 50*(1/(2*x+.1)));
     } else {
         textFont(regFont, 170);   
     }
     colorMode(RGB, 255, 255, 255, 1);
     fill(255,255,255,x);
     text(msg,position.x, position.y-100);
     colorMode(RGB, 255, 255, 255);
     
     //dim opacity
     if (x>=0){
       x -= .01;
     }
   }}
  
  
}
