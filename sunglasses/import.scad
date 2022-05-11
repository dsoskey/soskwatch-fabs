include <config/3d_printer.scad>;
use <mirror_copy.scad>;

module reference() {
  color("blue") {
    import("/Users/asks/Documents/OpenSCAD/sunglasses/DG_Frame_1_v2_v_rebuilt.stl");
  }
}

module funky_stuff(
  // Could this be frameThickness and be used in lens cutout?
  frameThickness = 3,
  noseTop = 12,
  noseBottom = 4.25,
  frameTop = 15,
  frameTopRight = 57,
  connectorRight = 68,
  frameLeftX = 4,
  frameLeftY = 3.5,
  frameBottomLeftX = 23,
  frameRightX = 64,
  frameRightY = 5,
  frameBottom = -17,
  zThickness = 1,
) {

  topMiddle = [0, noseTop];
  r1 = [frameLeftX + 1, noseTop];
  /* TODO: name ur[0] */
  ur = [17, frameTop];
  r2 = [frameTopRight, frameTop];
  rd = [connectorRight, frameTop - 2];
  d = [connectorRight, frameTop - 8];
  ld1 = [frameRightX, frameRightY];
  ld2 = [frameRightX + 1, -10];
  ld3 = [frameRightX - 10, frameBottom];
  l1 = [frameBottomLeftX, frameBottom];
  ul1 = [10, -10];
  ul2 = [frameLeftX, frameLeftY];
  ul3 = [2, noseBottom];
  l2 = [0, noseBottom];

  nosePoints = [topMiddle,r1,ul2,ul3,l2];

  framePoints = [
    /* topMiddle, */
    r1,
    ur,
    r2,
    /* rd,d, */
    ld1,
    ld2,
    ld3,
    l1,
    ul1,
    ul2,
    /* ul3 */
  ];

  bridgeTop = frameTop - 1;
  bridgeBottom = bridgeTop - frameThickness;
  bridgePoints = [
    [0, bridgeTop],
    [ur[0], bridgeTop],
    [ur[0], bridgeBottom],
    [0, bridgeBottom]
  ];

  connectorPoints = [r2, rd, d, ld1];
  lensStart = [r1[0] + 2 * frameThickness / 3, noseTop - 2 * frameThickness / 3];
  Lur = [ur[0], frameTop - frameThickness];
  Lr = [frameTopRight - 2 * frameThickness / 3, frameTop - frameThickness];
  Ldr = [frameRightX - frameThickness, frameRightY - frameThickness / 3.5];
  Ldr2 = [frameRightX - 5 / 8 * frameThickness, ld2[1] + frameThickness / 3];
  Ldl = [ld3[0] - frameThickness / 3, frameBottom + frameThickness];
  Ll = [frameBottomLeftX + frameThickness / 3, frameBottom + frameThickness];
  Lul = [ul1[0] + 2 * frameThickness / 3, ul1[1] + 2 * frameThickness / 3];
  Lul2 = [frameLeftX + frameThickness, frameLeftY + frameThickness / 3];
  lensCutoutPoints = [lensStart, Lur, Lr, Ldr, Ldr2, Ldl, Ll, Lul, Lul2];

  color("green")
  mirror_copy()
    difference() {
      linear_extrude(height = zThickness) {
        polygon(points=bridgePoints);

        polygon(points=nosePoints);
        polygon(points=framePoints);
        /* polygon(points=connectorPoints); */
      }
      translate([0, 0, -1])
      linear_extrude(height = zThickness * 10)
        polygon(points=lensCutoutPoints);
    }
}

/* reference(); */
translate([0,0,1]) {
  funky_stuff(zThickness = 4,
    noseTop = 10,
    frameTop = 20,
    frameBottom = -26,
    frameTopRight = 58,
    frameRightX = 68
  );
}
