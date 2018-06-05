PShader shad;

PShape edificio;
PImage edificioText;

PShape piso;
PImage pisoText;

PVector pelotaLocation;  
PVector pelotaVelocity;  
PVector pelotaGravity;  
PShape pelota;
PImage pelotaText;

PShape lapiz;
PImage lapizText;

PShape lapiz2;

PImage vasoText;
PShape vaso;

PShape libro;

PShape cono;
PImage conoText;
int sides = 50;
int h = 42;
int r1 =20;
int r2 =10;
float angle = 360 / sides;
float halfHeight = h / 2;

float gain = 0.0;
float change = 0.0;

float rojo = 0.0;
float verde = 0.0;
float azul = 0.0;


void setup() {
  size(650,650, P3D);
  noStroke();
  fill(204);
  
  edificioText = loadImage("buildText.jpg");
  edificio = createShape(BOX, 100);
  edificio.setTexture(edificioText);
  
  
  pisoText = loadImage("street.jpg");
  piso = createStreet(0,25, -30, edificioText);
  piso.setTexture(pisoText);
  
  vasoText = loadImage("vaso.jpg");
  vaso = createCan(25, 50, 32, vasoText);
  
  lapiz = loadShape("pencil.obj");
  lapiz.scale(64.0,64.0,64.0); 
  
  lapiz2 = loadShape("pencil2.obj");
  lapiz2.scale(64.0,64.0,64.0); 
  
  libro = loadShape("book.obj");
  libro.scale(32.0);
  
  cono = Createcono(angle,halfHeight);
  conoText = loadImage("purple.jpeg");
  cono.setTexture(conoText);
  
  pelotaText = loadImage("pelota.png");
  pelota = createShape(SPHERE, 50);
  pelota.setTexture(pelotaText);
  pelotaLocation = new PVector(-100,-200);
  pelotaVelocity = new PVector(1.5,2.1);
  pelotaGravity = new PVector(0,0.2);
  shad = loadShader("pixlightxfrag.glsl", "pixlightxvert.glsl");
}


void draw() {
  sphereDetail(400 / 10);
  shader(shad);
  background(46,200,121);
  pointLight(0,0,0, 250 + (frameCount*0.01%10)-1, 250 + (frameCount*0.01%10)-1, 0);
  translate( 250 + (frameCount*0.01%10)-1, 250 + (frameCount*0.01%10)-1, 0);
  sphere(20);
  translate (-(250+(frameCount*0.01%10)-1), -(250+(frameCount*0.01%10)-1), 0);
  
  
  //pointLight(0,0,0, 0 , 100 , 100);
  translate( 0 , 100, 100);
  sphere(20);
  translate (0, -(100), -100);
  
  translate(width/2, height/2);
  
  
  fill(0,255,0,190);
  rotateY(frameCount*0.01);
  //rotateX(frameCount*0.01);
  
  
  
  translate(250,0,300);
  rotateX(PI/2);
  shape(cono);
  rotateX(-PI/2);
  translate(-250,0,-300);
  /*translate(150,0);
  fill(255,0,0,80);
  sphere(60);
  translate(-300,0);
  fill(0,0,255);
  sphere(60);
  translate(0,150);
  fill(0,255,255);
  sphere(60);*/
  
  pelotaLocation.add(pelotaVelocity);
  pelotaVelocity.add(pelotaGravity);
  
  if ((pelotaLocation.x > width) || (pelotaLocation.x < 0)) {
    pelotaVelocity.x = pelotaVelocity.x * -1;
  }
  if (pelotaLocation.y > 60) {
    pelotaVelocity.y = pelotaVelocity.y * -0.95; 
    pelotaLocation.y = 60;
  }
  stroke(255);
  strokeWeight(2);
  fill(127);
  
  
  shape(piso);
  //translate(300,-25,25);
  
  //shape(edificio);
  translate(300,0,25);
  shape(vaso);
  
  rotateX(PI/6);
  translate(0,-70,0);
  shape(lapiz, 0, 0);
  rotateX(-PI/6);
  translate(10,0,25);
  shape(lapiz2, 0, 0);
  translate(-10,0,-5);
  translate(-200,75,100);
  rotateX(PI/2);
  shape(libro);
  rotateX(-PI/2);
  translate(200,-100,-100);
  //shape(lap);
  translate(pelotaLocation.x,pelotaLocation.y,100);
  shape(pelota);
  //shape(lapiz2,0,0);
  /*shape(lapiz, 0, 0);
  translate(-30,0,5);
  shape(lapiz, 0, 0);*/
  
  
}

PShape createStreet(float x, float y, float z, PImage tex) {
  //textureMode(NORMAL);
  PShape sh = createShape();
  sh.beginShape(QUAD_STRIP);
  //sh.texture(tex);
  sh.vertex(x,y,z);
  sh.vertex(x,y,z+400);
  sh.vertex(x+450,y,z);
  sh.vertex(x+450,y,z+400); 
  sh.endShape();
  return sh;
}

PShape createBuild(float x, float y, float z, PImage tex) {
  //textureMode(NORMAL);
  PShape sh = createShape();
  sh.beginShape(QUAD_STRIP);
  sh.noStroke();
  //sh.texture(tex);
  sh.vertex(x,y,z);
  sh.vertex(x,y+300,z);
  sh.vertex(x+400,y,z);
  sh.vertex(x+400,y+300,z);
  sh.endShape();
  return sh;
}

PShape createCan(float r, float h, int detail, PImage tex) {
  textureMode(NORMAL);
  PShape sh = createShape();
  sh.beginShape(QUAD_STRIP);
  sh.noStroke();
  sh.texture(tex);
  for (int i = 0; i <= detail; i++) {
    float angle = TWO_PI / detail;
    float x = sin(i * angle);
    float z = cos(i * angle);
    float u = float(i) / detail;
    sh.normal(x, 0, z);
    sh.vertex(x * r, -h/2, z * r, u, 0);
    sh.vertex(x * r, +h/2, z * r, u, 1);
  }
  sh.endShape();
  return sh;
}

PShape Createcono(float angle, float halfHeight) {
  PShape sh = createShape();
  sh.beginShape(TRIANGLE_STRIP);
  //sh.fill(255,0,0);
  sh.noStroke();
  for (int i = 0; i < 55; i++) {
      float x1 = cos( radians( i * angle ) ) * r1;
      float y1 = sin( radians( i * angle ) ) * r1;
      float x2 = cos( radians( i * angle ) ) * r2;
      float y2 = sin( radians( i * angle ) ) * r2;
      sh.vertex( x2, y2, halfHeight);
      sh.vertex( x1, y1, -halfHeight);

  }
  sh.endShape(CLOSE);
  return sh;
}

void keyPressed() {
  if (key == '+'){
    gain= gain+ 0.2; 
    shad.set("intensityGain",gain);
  }  
  if (key == '-'){
    gain= gain- 0.2; 
    shad.set("intensityGain",gain);
  }
  if (key == 'a'){
    azul= azul+30; 
    shad.set("blue",azul);
  }
  if (key == 'v'){
    verde= verde+30; 
    shad.set("green",verde);
  }
  if (key == 'r'){
    rojo= rojo+30; 
    shad.set("red",rojo);
  }
  if(key == ' '){
    rojo= 0.0; 
    verde=0.0;
    azul=0.0;
    gain=0.0;
    shad.set("red",rojo);
    shad.set("green",verde);
    shad.set("blue",azul);
    shad.set("intensityGain",gain);
  }
}