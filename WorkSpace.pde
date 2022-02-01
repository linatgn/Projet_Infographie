class WorkSpace{
  PShape gizmo;
  PShape grid;
  
  public WorkSpace(int size){
    this.gizmo= gizmo(size);
    this.grid = grid(size);
  }
  
  PShape gizmo(int size){
    PShape shape = createShape();
    shape.beginShape(LINES);
    shape.noFill();
    shape.strokeWeight(3.0f);
    
  // red x
   shape.stroke(0xAAFF3F7F);
    shape.strokeWeight(1.0f);
    shape.vertex(-size/2, 0, 0);
   shape.vertex(size/2, 0, 0);
   shape.strokeWeight(3.0f);
    shape.vertex(0, 0, 0);
    shape.vertex(size/100, 0, 0);
  // green Y
   shape.stroke(0xAA3FFF7F);
    shape.strokeWeight(1.0f);
    shape.vertex(0,-size/2,  0);
    shape.vertex(0,size/2,  0);
    shape.strokeWeight(3.0f);
    shape.vertex(0,0,  0);
    shape.vertex(0,size/100,  0);
  // blue z
   shape.stroke(0xAA3F7FFF);
     shape.strokeWeight(1.0f);
     shape.strokeWeight(3.0f);
     shape.vertex( 0,0, 0);
     shape.vertex( 0, 0,size/100);


    shape.endShape();
    return shape;
  }
  
  PShape grid(int size){
    PShape shape = createShape();
    shape.beginShape(LINES);
    shape.noFill();
    shape.stroke(#B7B1B1);
    shape.strokeWeight(0.5f);
   for(int x=-size/2;x<size/2;x+=100){
      for(int y=-size/2;y<size/2;y+=100){
        print(size,"\n");
        
        shape.vertex(x,y);
        shape.vertex(x+100,y);
        shape.vertex(x+100,y+100);
          shape.vertex(x+100,y);
          

      }
    }
    shape.endShape();
    return shape;
  }
 void update(){
    shape(gizmo);
    shape(grid);
  
  }
   /**
* Toggle Grid & Gizmo visibility.
*/
void toggle() {
 this.gizmo.setVisible(!this.gizmo.isVisible());
}

}
