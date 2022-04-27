class Clouds{
  int numClouds;
  ArrayList<Cloud> clouds = new ArrayList<Cloud>();
  
  Clouds(){
    this.numClouds = 8;
    this.clouds = new ArrayList<Cloud>();
  }
  
  void load(){
     for (int i=0; i<numClouds; i++){
       Cloud currCloud = new Cloud(cloud, new PVector(random(-1,1)*80*i,i*80), new PVector (random(150,200), random(100,120)));
       clouds.add(currCloud);
      } 
      println(clouds.size());
  }
  
  void display(){
       for (Cloud cloud : clouds){ 
           cloud.move();
       }
  }
}
