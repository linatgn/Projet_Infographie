// Lina Taguengayte

WorkSpace workspace;
Camera camera;
Hud hud;
Map3D map;
Land land;
Gpx gpx; 

int frameStart = 0;
float sensibility=100; // Sensibilité des commandes de déplacement


void setup() {
  this.workspace = new WorkSpace(250 * 100);
  this.camera = new Camera();
  this.hud = new Hud();
  this.map = new Map3D("paris_saclay.data");
  this.gpx = new Gpx(this.map, "trail.geojson");
  this.land = new Land(this.map,"paris_saclay.jpg");

 
  size(1200, 800, P3D);
  frameRate(60);
  smooth(8);
}

void draw() {
  background(64);
  perspective();
  this.camera.update();
  this.workspace.update();
  this.land.update();
  this.hud.update();
  this.gpx.update();

}


void keyPressed() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        this.camera.adjustColatitude(-PI*this.sensibility/1000);
        break;
      case DOWN:
        this.camera.adjustColatitude(PI*this.sensibility/1000);
        break;
      case LEFT:
        this.camera.adjustLongitude(-PI*this.sensibility/1000);
        break;
      case RIGHT:
        this.camera.adjustLongitude(PI*this.sensibility/1000);
        break;
      default:
        break;
    }
  } else {
    switch (key) {
     
      
      case '+':
      case 'p':
      case 'P':
        // Zoom avant
        this.camera.adjustRadius(-this.sensibility);
        break;
        
      case '-':
       // Zoom arrière
        this.camera.adjustRadius(this.sensibility);
        break;
                     
     case 'w': 
     case 'W':
     // Hide/Show Land
     this.land.toggle(); 
     break;
      
      
      default:
        break;
    }
  }
}



void mouseWheel(MouseEvent event) {
  float ec = event.getCount();
  camera.adjustRadius(width * (ec / 10.0));
}

void mouseDragged() {
  if (mouseButton == CENTER) {
    float dx = mouseX - pmouseX;
    camera.adjustLongitude((-PI / 2) * (dx / width));
    float dy = mouseY - pmouseY;
    camera.adjustColatitude((PI / 2) * (-dy / width));
    }
  }
  void mousePressed() {
 if (mouseButton == LEFT)
 this.gpx.clic(mouseX, mouseY);

}
