include <config/3d_printer.scad>;
use <mirror_copy.scad>;

module reference() {
  color("blue") {
    import("/Users/asks/Documents/OpenSCAD/sunglasses/DG_Frame_1_v2_v_rebuilt.stl");
  }
}

module funky_stuff(
  // Could this be frameThickness and be used in lens cutout?
  bridgeThickness = 1.5,

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
  bridgeBottom = bridgeTop - bridgeThickness;
  bridgePoints = [
    [0, bridgeTop],
    [ur[0], bridgeTop],
    [ur[0], bridgeBottom],
    [0, bridgeBottom]
  ];

  connectorPoints = [r2, rd, d, ld1];
  lensStart = [r1[0] + 1, noseTop - 1];
  Lur = [ur[0], frameTop - 1.5];
  Lr = [frameTopRight - 1, frameTop - 1.5];
  Ldr = [frameRightX - 1.5, frameRightY - .4];
  Ldr2 = [frameRightX - .5, ld2[1]];
  Ldl = [ld3[0] - .5, frameBottom + 1.5];
  Ll = [frameBottomLeftX + .5, frameBottom + 1.5];
  Lul = [ul1[0] + 1, ul1[1] + 1];
  Lul2 = [frameLeftX + 1.5, frameLeftY + .5];
  lensCutoutPoints = [lensStart, Lur, Lr, Ldr, Ldr2, Ldl, Ll, Lul, Lul2];

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
  funky_stuff(zThickness = 3,
    noseTop = 10,
    frameTop = 17,
    frameBottom = -24,
    frameTopRight = 55
  );
}
