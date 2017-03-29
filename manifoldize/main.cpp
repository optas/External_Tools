#include <GL/gl.h>
#include <GL/glu.h>
#include <GL/glut.h>
#include <stdlib.h>
#include <stdio.h>

#include "Model_OBJ.h"

int main(int argc, char** argv)
{
  Model_OBJ obj;
  int resolution = 20000;
  if (argc == 1)
  {
    cout << "./main input.obj output.obj [resolution=20000]\n";
  }
  obj.Load(argv[1]);

  if (argc > 3)
  {
    sscanf(argv[3], "%d", &resolution);
  }
  obj.Process_Manifold(resolution);
  obj.SaveOBJ(argv[2]);
   return 0; 
}
