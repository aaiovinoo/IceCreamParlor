class Sky{
  color day1 = color(69,177,232);
  color day2 = color(126,212,230);
  color evening1 = color(89,70,178);
  color evening2 = color(250,110,121);
  color night1 = color(0,28,61);
  color night2 = color(25,25,112);
  color morning1 =  color(105,53,156);
  color morning2 =  color(214,82,130);
  PShape night;
  color c;
  Sky(){
    
  }
  
  color display(){
       int h = hour();
       if (20 < h || h < 8){
         c = color(10,0,102);
       } else{
         c = color(137,207,240);
       }
       return c;
  }
  /*
  void display(color c1, color c2){
    noFill();  
    for (int i = 0; i <= 0+height; i++) {
      float inter = map(i, 0, height, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(0, i, width, i);
    }
  }*/
}
