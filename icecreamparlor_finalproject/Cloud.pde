class Cloud{
  PImage cloud;
  PVector position, size;
  
  
  Cloud(PImage cloud, PVector position, PVector size){
    this.cloud = loadImage("data/cloud.png");
    this.position = position;
    this.size = size;
  }
  
  void move(){
    if (position.x>height+100){
        position.x = random(-200,-170);
    } else{
       position.x += 1;
    }
    image(cloud, position.x, position.y, size.x, size.y);
  }
}
