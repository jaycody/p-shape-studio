/*jstephens  - 2018_05
 kidsPace 
 R&D with PShape, PGraphics, textures and feedback loops
 
 TODO:
 - [] Create a PGraphic layer
 - [] Create a PShape
 - [] Texture PShape with an image
 - [] Control PShape with perlin noise 
 - scale size
 - translate (xy location)
 - rotation
 - vertex location
 - HSB
 - verticies 
 -----------
 
 */

boolean saveFrameIsOn = false;
boolean recordIsOn = false;
boolean cursorIsOn = true;

String SNAP_FOLDER_PATH = ("../../../snaps/");
String FRAME_FOLDER_PATH = ("../../../frames/");
String directoryStartTime = (""); //timestamp to be called only once
String project = "KidsPace";
String version = "prototype";


PGraphics pg_1;
PGraphics bg;
PShape    ps_1;

void setup () {
  size(640, 480, P2D); 
  background(0); //colors the main graphics context
  smooth();
  shapeMode(CENTER);
  imageMode(CENTER);

  pg_1 = createGraphics (width*3, height*3, P2D);
  pg_1.imageMode(CENTER);
  pg_1.shapeMode(CENTER);

  bg = createGraphics (width*3, height*3, P2D);
  bg.imageMode(CENTER);
  bg.shapeMode(CENTER);

  ps_1 = createShape();
  //ps_1.shapeMode(CENTER);
  //ps_1.setFill(color(255,0,0));
  ps_1.beginShape();
  //ps_1.tint(255,0,0,10);
  //ps_1.texture(pg_1);
  ps_1.stroke(0);
  ps_1.strokeWeight(1);
  ps_1.vertex(50, 10);
  ps_1.vertex(10, 200);
  ps_1.vertex(110, 200);
  ps_1.vertex(0, 0);
  ps_1.endShape(CLOSE);

  printInstructions();
}

void draw() {
  // background(0); //colors the main graphics context

  ps_1.setFill(color(0, 255, 0));



  pg_1.beginDraw();
  pg_1.clear();



  //pg_1.tint(255, 0, 0);
  pg_1.pushMatrix();

  pg_1.translate(width, height);
  pg_1.translate(mouseX, mouseY);

  //pg_1.shape(ps_1, 0,0);//random(-3, 3), random(-3, 3));
  pg_1.image(pg_1, -20, -20, width*2.8, height*2.8);
  //pg_1.image(pg_1, 0, 0, width*1.2, height*1.2);
  //pg_1.image(pg_1, 0, 0);

  pg_1.pushMatrix();
  //pg_1.shape(ps_1, 20, 20);
  //pg_1.image(pg_1, 0, 0);
  pg_1.scale(1.5);

  //pg_1.shape(ps_1, 20, 20);
  //pg_1.rotate(millis()*.0001);
  pg_1.shape(ps_1, -20, -20);
  pg_1.blendMode(BLEND);
  pg_1.image(pg_1, 0, 0, width*1.2, height*1.2);


  //pg_1.pushMatrix();
  //pg_1.rotate(millis()*(-.0001));
  pg_1.shape(ps_1, 0, 0);
  //pg_1.popMatrix();
  //pg_1.shape(ps_1, 0, 0);


  pg_1.image(bg, 0, 0, width*2.8, height*2.8);
  
  pg_1.popMatrix();
  //pg_1.image(pg_1, 0, 0, width*.9, height*.9);


  pg_1.image(pg_1, 0, 0, width*1.2, height*1.2);

  pg_1.shape(ps_1, 0, 0);//random(-3, 3), random(-3, 3));
  //pg_1.shape(ps_1,0,0);

  pg_1.endDraw(); 

  bg.pushMatrix();
  //bg.translate(0,0);
 // bg.translate(width, height);
  //bg.translate(mouseX,mouseY);
  bg.beginDraw();
  bg.clear();
  //bg.scale(1.2);
  bg.image(pg_1, 0,0, width*1.8, height*1.8);
  //bg.image(pg_1, width, height, width, height);
  bg.stroke(255,0,0);
  bg.fill(255,0,0,100);
  //bg.rect(0, 0, width*3, height*3);
  bg.endDraw();
  bg.popMatrix();
  
  pg_1.popMatrix();




  pushMatrix();
  translate (width/2, height/2);
  //translate (mouseX, mouseY);
  image(pg_1, 0, 0, width*3, height*3);
  popMatrix();

  checkRecordFrame();

  // checks for button press
  updateControlsFromKeyboard();
}
