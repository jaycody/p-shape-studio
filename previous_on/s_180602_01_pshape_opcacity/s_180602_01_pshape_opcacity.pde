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
  shapeMode(CENTER);
  imageMode(CENTER);
  pg_1 = createGraphics (width*3, height*3, P2D);
  pg_1.imageMode(CENTER);

  bg = createGraphics (width*3, height*3, P2D);
  bg.imageMode(CENTER);

  ps_1 = createShape();
  //ps_1.shapeMode(CENTER);
  ps_1.setFill(color(255,0,120));
  ps_1.beginShape();
  ps_1.vertex(50, 10);
  ps_1.vertex(10, 200);
  ps_1.vertex(110, 200);
  ps_1.endShape(CLOSE);

  printInstructions();
}

void draw() {
  //  background(0); //colors the main graphics context

  pg_1.shapeMode(CENTER);
  pg_1.beginDraw();
  pg_1.clear();
  //pg_1.tint(255, 0, 0);
  pg_1.pushMatrix();

  pg_1.translate(width, height);
  pg_1.translate(mouseX, mouseY);


  pg_1.image(pg_1, 0, 0);
  pg_1.shape(ps_1, random(-3, 3), random(-3, 3));
  pg_1.image(pg_1, -20, -20, width*.9, height*.9);
  pg_1.shape(ps_1, 20, 20);
  //pg_1.image(pg_1, 0,0,width*.9, height*.9);
  pg_1.shape(ps_1, random(-3, 3), random(-3, 3));
  //pg_1.image(pg_1, 50, 80,250,250);
  //pg_1.shape(ps_1,0,0);
  pg_1.popMatrix();
  pg_1.endDraw();


/*
bg.shapeMode(CENTER);
 
  
  
  bg.beginDraw();
  
  
  bg.clear();
  
 bg.tint(0,0,255);
  
  
 bg.pushMatrix();
  
  bg.translate(width, height);
  bg.translate(mouseX, mouseY);
  
 
  bg.image(bg, 0, 0);
  pg_1.shape(ps_1, random(-3, 3), random(-3, 3));
  pg_1.image(pg_1, -20, -20, width*.9, height*.9);
  pg_1.shape(ps_1, 20, 20);
  // blendMode(SCREEN);
  //pg_1.image(pg_1, 0,0,width*.9, height*.9);
  //blendMode(BLEND);
  tint(255, 255);
  pg_1.shape(ps_1, random(-3, 3), random(-3, 3));
  //pg_1.image(pg_1, 50, 80,250,250);
  //pg_1.shape(ps_1,0,0);
  
  
  //bg.translate(width, height);
  //bg.translate(mouseX, mouseY);
  
  //bg.popMatrix();
  //bg.endDraw();
*/


  pushMatrix();
  translate (width/2, height/2);
  image(pg_1, 0, 0);
  //image(pg_1, 0, 0, width/2, height/2);

  popMatrix();

  checkRecordFrame();

  // checks for button press
  updateControlsFromKeyboard();
}
