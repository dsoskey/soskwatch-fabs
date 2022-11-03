include <config/3DPrinter.scad>;

module cubeOfSpheres(size, cornerRadius) {
  x = is_list(size) ? size.x : size;
  sphereCenterX = (x - cornerRadius)/2;

  y = is_list(size) ? size.y : size;
  sphereCenterY = (y - cornerRadius)/2;

  z = is_list(size) ? size.z : size;
  sphereCenterZ = (z - cornerRadius)/2;

  translate([sphereCenterX, sphereCenterY, sphereCenterZ])
  sphere(r=cornerRadius);
  translate([sphereCenterX, -sphereCenterY, sphereCenterZ])
  sphere(r=cornerRadius);
  translate([sphereCenterX, sphereCenterY, -sphereCenterZ])
  sphere(r=cornerRadius);
  translate([sphereCenterX, -sphereCenterY, -sphereCenterZ])
  sphere(r=cornerRadius);
  translate([-sphereCenterX, sphereCenterY, sphereCenterZ])
  sphere(r=cornerRadius);
  translate([-sphereCenterX, -sphereCenterY, sphereCenterZ])
  sphere(r=cornerRadius);
  translate([-sphereCenterX, sphereCenterY, -sphereCenterZ])
  sphere(r=cornerRadius);
  translate([-sphereCenterX, -sphereCenterY, -sphereCenterZ])
  sphere(r=cornerRadius);
}

module roundedCube(
  size = 15,
  cornerRadius = 1,
) {
  hull()
  cubeOfSpheres(size, cornerRadius);
}

module etchedCube(
  size = 15,
  cornerRadius = 1,
) {
  assert(!is_list(size), "etched cube is not designed for size lists");
  etchDepth = size/10;
  etchZ = (size+cornerRadius)/2 - etchDepth;
  difference() {
    roundedCube(size=size, cornerRadius=cornerRadius);

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
  size = 15,
  cornerRadius = 1,
) {
  dotSize = size / 10;
  dotSpacing = 4.5;

  etchedCube(size, cornerRadius) {
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

roundedCube(size=[1,15,50]);
translate([20, 0, 0])
  cubeOfSpheres(15, 1);
