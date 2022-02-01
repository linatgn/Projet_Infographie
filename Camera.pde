public class Camera {
 
    public float x, y , z;
    public float radius;
    public float longitude;
    public float colatitude;
   
    
    public Camera(){
        this.radius = 2600.0f;
        this.longitude = -PI / 2.0;
        this.colatitude = PI / 4.0;
        this.x = cos(longitude) * cos(PI/2 - colatitude) * radius;
        this.y = -sin(longitude) * cos(PI/2 - colatitude) * radius;
        this.z = cos(colatitude) * radius;
    }
    public Camera(int x,int y, int z){
        this.x = x;
        this.y = y;
        this.z = z;
    }
  
    //pour ajuster le zoom (en mètres)
   
    public void adjustRadius(float offset){
      this.radius = constrain(radius + offset, 0.5 * width, 3.0 * width);
      
      this.x = cos(longitude) * cos(PI/2 - colatitude) * radius;
      this.y = -sin(longitude) * cos(PI/2 - colatitude) * radius;
      this.z = cos(colatitude) * radius;
      
    }
    //pour se déplacer vers ladroite ou la gauche
  
    public void adjustLongitude(float delta){
      longitude += delta;
      if (longitude < -3*PI / 2.0) {
        longitude = PI / 2.0 + (longitude % (-3*PI / 2.0));
      } else if (longitude > PI / 2.0) {
        longitude = - 3*PI / 2.0 + (longitude % (PI / 2.0));
      }
      x = cos(longitude) * cos(PI/2 - colatitude) * radius;
      y = -sin(longitude) * cos(PI/2 - colatitude) * radius;
      }


    //pour définir l’angle de vue plongeante (en radians).
   
    public void adjustColatitude(float delta){
      if (this.colatitude+delta > 0.000001 && this.colatitude+delta < PI/2){
        this.colatitude += delta;
        this.x = radius*sin(colatitude)*cos(longitude);
        this.y = -radius*sin(colatitude)*sin(longitude);
        this.z = radius*cos(colatitude);
      
      }
    }
    
    
    
    public void update(){
      // 3D camera (X+ right / Z+ top / Y+ Front)
      camera(this.x, this.y, this.z, 0, 0, 0, 0, 0, -1);
    }
    
  
}
