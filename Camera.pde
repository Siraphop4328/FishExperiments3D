class Camera
{

  float camX;
  float camY;
  float camZ;
  float yaw;
  float pitch;
  float velocityZ;
  float gravity;
  float jumpStrength;
  float spd;
  float FLOOR_z;

  boolean w, a, s, d, sp, sh;
  boolean TRAP_MOUSE;



  Camera() {

    camX = 0;
    camY = 0;
    camZ = 200;
    yaw = 180;
    pitch = 2.4;
    velocityZ = 0;
    gravity = 0.1;
    jumpStrength = 5;
    spd = 2;
    FLOOR_z = 30;
    TRAP_MOUSE = true;
  }


  void handleCamera ()
  {

    velocityZ -= gravity;
    camZ += velocityZ;

    if (camZ <= FLOOR_z)
    {
      camZ = FLOOR_z;
      velocityZ = 0;
    }


    if (TRAP_MOUSE)
    {
      yaw += (mouseX - width / 2) * 0.003;
      pitch += (mouseY - height / 2) * 0.003;
      pitch = constrain (
        pitch, -HALF_PI + 0.0001,
        HALF_PI - 0.0001);

      r.warpPointer (width / 2, height / 2);
    }
    float fx = cos (yaw);
    float fy = sin (yaw);
    if (w)
    {
      camX += fx * spd;
      camY += fy * spd;
    }
    if (s)
    {
      camX -= fx * spd;
      camY -= fy * spd;
    }
    if (a)
    {
      camX += cos (yaw - HALF_PI) * spd;
      camY += sin (yaw - HALF_PI) * spd;
    }
    if (d)
    {
      camX += cos (yaw + HALF_PI) * spd;
      camY += sin (yaw + HALF_PI) * spd;
    }
    if (sp && camZ <= FLOOR_z + 0.1)
    {
      velocityZ = jumpStrength;
    }

    if (sh)
      camZ -= spd;

    float lookX = camX + cos (yaw) * cos (pitch) * 100;
    float lookY = camY + sin (yaw) * cos (pitch) * 100;
    float lookZ = camZ - sin (pitch) * 100;

    camZ = constrain (camZ, FLOOR_z, 1000);

    camera (camX, camY, camZ, lookX, lookY, lookZ, // camera funtion
      0, 0, -1);

    perspective (PI / 3, float (width) / height, 1,
      1000000); // adjust clipping distance

    lights (); // lights
  }
}
