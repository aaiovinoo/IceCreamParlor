class RadioButton{
  int numButtons, spacing;
  PVector position;
  ArrayList<RoundButton> buttons;
  RadioButton(int numButtons, PVector position){
    this.numButtons = numButtons;
    this.position = position;
    buttons = new ArrayList<RoundButton>();
    spacing = 80;
  }
  
  void createButtons(){
    for (int i = 0; i<numButtons; i++){
        RoundButton b =new RoundButton(new PVector(position.x+i*spacing,position.y), new PVector(18,18), color(201,192,248));
        b.display();
        buttons.add(b);
      }
  }
  void display(){
      for (int i = 0; i<numButtons; i++){
        RoundButton b =buttons.get(i);
        b.display();
      }
  }
  
  //checks if any of the buttons are being hover over
  int hover(){
   for (int i = 0; i<buttons.size(); i++){
    RoundButton b = buttons.get(i);
    if (b.hover()){
        return int(i);
    }
  } return -1;
}
  
  void select(int selected){
    println("num of buttons: ", buttons.size());
    for (int i = 0; i<numButtons; i++){
      if (i == selected){
         //println("selecting ",i);  
         //buttons.get(i).c = color(109,103,235);
         //buttons.get(i).c = color(121,130,187);
         //buttons.get(i).c = color(147,112,219);
         //buttons.get(i).c = color(21,18,55); //dark blue
         buttons.get(i).c = color(251,134,30); //orange
      } else{
        //println("reseting ", i);  
        buttons.get(i).c = color(201,192,248); //light purple
      }
    }
  }

}
