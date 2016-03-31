class Door{
  PImage door;
  PImage[] doorOpen=new PImage[4];
  
  Door(){
    PImage gridDoor=loadImage("door.png");
    door=gridDoor.get(0,0,160,180);
    for(int i=0;i<4;i++){
      doorOpen[i]=gridDoor.get(i*160,0,160,180);
    }
  }
}
