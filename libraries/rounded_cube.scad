include <config/3d_printer.scad>;

module cubeOfSpheres(
  cubeSize,
  cornerRadius,
) {
  sphereCenter = (cubeSize - cornerRadius)/2;

  translate([sphereCenter, sphereCenter, sphereCenter])
  sphere(r=cornerRadius);
  translate([sphereCenter, -sphereCenter, sphereCenter])
  sphere(r=cornerRadius);
  translate([sphereCenter, sphereCenter, -sphereCenter])
  sphere(r=cornerRadius);
  translate([sphereCenter, -sphereCenter, -sphereCenter])
  sphere(r=cornerRadius);
  translate([-sphereCenter, sphereCenter, sphereCenter])
  sphere(r=cornerRadius);
  translate([-sphereCenter, -sphereCenter, sphereCenter])
  sphere(r=cornerRadius);
  translate([-sphereCenter, sphereCenter, -sphereCenter])
  sphere(r=cornerRadius);
  translate([-sphereCenter, -sphereCenter, -sphereCenter])
  sphere(r=cornerRadius);
}

module roundedCube(
  cubeSize = 15,
  cornerRadius = 1,
) {
  hull()
  cubeOfSpheres(cubeSize, cornerRadius);
}


module etchedCube(
  cubeSize = 15,
  cornerRadius = 1,
) {
  etchDepth = cubeSize/10;
  etchZ = (cubeSize+cornerRadius)/2 - etchDepth;
  difference() {
    roundedCube(cubeSize=cubeSize, cornerRadius=cornerRadius);

    translate([0, 0, etchZ])
    linear_extrude(etchDepth)
      children(0);

      rotate([90,0,0])
      translate([0, 0, etchZ])
      linear_extrude(etchDepth)
        children(1);

      rotate([90,0,90])
      translate([0, 0, etchZ])
      linear_extrude(etchDepth)
        children(2);

      rotate([90,0,-90])
      translate([0, 0, etchZ])
      linear_extrude(etchDepth)
        children(3);

      rotate([90,0,180])
      translate([0, 0, etchZ])
      linear_extrude(etchDepth)
        children(4);
      rotate([180,0,0])
      translate([0, 0, etchZ])
      linear_extrude(etchDepth)
        children(5);
  }
}

module dotDie(
  cubeSize = 15,
  cornerRadius = 1,
) {
  dotSize = cubeSize / 10;
  dotSpacing = 4.5;

  etchedCube(cubeSize, cornerRadius) {
    children();
    union() {
      translate([dotSpacing,dotSpacing,0])
      children();
      translate([-dotSpacing,-dotSpacing,0])
      children();
    }
    union() {
      children();
      translate([dotSpacing,dotSpacing,0])
      children();
      translate([-dotSpacing,-dotSpacing,0])
      children();
    }
    union() {
      translate([dotSpacing,dotSpacing,0])
      children();
      translate([-dotSpacing,-dotSpacing,0])
      children();
      translate([-dotSpacing,dotSpacing,0])
      children();
      translate([dotSpacing,-dotSpacing,0])
      children();
    }
    union() {
      children();
      translate([dotSpacing,dotSpacing,0])
      children();
      translate([-dotSpacing,-dotSpacing,0])
      children();
      translate([-dotSpacing,dotSpacing,0])
      children();
      translate([dotSpacing,-dotSpacing,0])
      children();
    }
    union() {
      translate([dotSpacing,dotSpacing,0])
      children();
      translate([-dotSpacing,-dotSpacing,0])
      children();
      translate([-dotSpacing,dotSpacing,0])
      children();
      translate([dotSpacing,-dotSpacing,0])
      children();
      translate([-dotSpacing,0,0])
      children();
      translate([dotSpacing,0,0])
      children();
    }
  }
}

roundedCube();
translate([20, 0, 0])
  cubeOfSpheres(15, 1);
