void keyPressed() {


  if (key == 'w' || key == 'W') playerCamera.w = true;
  if (key == 's' || key == 'S') playerCamera.s = true;
  if (key == 'a' || key == 'A') playerCamera.a = true;
  if (key == 'd' || key == 'D') playerCamera.d = true;
  if (key == ' ' )              playerCamera.sp = true;
  if (keyCode == SHIFT)         playerCamera.sh = true;

  if (key == 'v' || key == 'V') {
    playerCamera.TRAP_MOUSE = !playerCamera.TRAP_MOUSE;
    r.confinePointer(playerCamera.TRAP_MOUSE);
    r.setPointerVisible(!playerCamera.TRAP_MOUSE);
  }
  if (key == 'r' || key == 'R') {
    reloadWorld();
  }
  if (key == 'n' || key == 'N') {
    currentSeed = floor(random(1000000));
    
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') playerCamera.w = false;
  if (key == 's' || key == 'S') playerCamera.s = false;
  if (key == 'a' || key == 'A') playerCamera.a = false;
  if (key == 'd' || key == 'D') playerCamera.d = false;
  if (key == ' ' )              playerCamera.sp = false;
  if (keyCode == SHIFT)         playerCamera.sh = false;
}
