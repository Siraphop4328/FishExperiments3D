import com.jogamp.newt.opengl.GLWindow;
GLWindow r;

Map map1;
Camera playerCamera;
int FPS = 30;

void setup() {

  size(1920, 1200, P3D);
  noiseSeed(-1);
  frameRate(FPS);
  playerCamera = new Camera();
  map1 = new Map(4000, 4000);
  windowTitle("FoodChain3D");
  r = (GLWindow) surface.getNative();
  r.confinePointer(true);
  r.setPointerVisible(false);

  int x = (displayWidth - width) / 2;
  int y = (displayHeight - height) / 2;
  surface.setLocation(x, y);
  println(displayWidth);
  println(displayHeight);
  println(width);
  println(height);
}

void draw() {
  background(128, 221, 255);

  lights();

  playerCamera.handleCamera();
  map1.drawMap();
  map1.drawWater();
   

  camera();
  perspective(PI/3.0, (float)width/height, 1, 100000);
  noLights();
  drawUI();
}
