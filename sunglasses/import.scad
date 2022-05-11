include <config/3d_printer.scad>;
use <mirror_copy.scad>;

module reference() {
  color("blue") {
    import("/Users/asks/Documents/OpenSCAD/sunglasses/DG_Frame_1_v2_v_rebuilt.stl");
  }
}

module funky_stuff(
  // major dimenions
  // TODO: how does this relate to connectors
  length = 143.6,
  height = 53.5,
  frameThickness = 3,
  //minor dimensions
  frameTop = 20,
  noseTop = 10,
  noseBottom = 4.25,
  frameTopRight = 58,
  connectorRight = 68,
  frameLeftX = 4,
  frameLeftY = 3.5,
  frameBottomLeftX = 27,
  frameRightX = 64,
  frameRightY = 5,
  zThickness = 1,
) {
  frameBottom = frameTop - height;
  frameRightX = length / 2 - 1; // TODO: remove -1 from this number?

  topMiddle = [0, noseTop];

  r1 = [frameLeftX + 1, noseTop];
  /* TODO: name ur[0] */
  ur = [17, frameTop];
  r2 = [frameTopRight, frameTop];
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
    r1,
    ur,
    r2,
    ld1,
    ld2,
    ld3,
    l1,
    ul1,
    ul2,
  ];

  bridgeTop = frameTop - 1.5;
  bridgeBottom = bridgeTop - frameThickness;
  bridgePoints = [
    [0, bridgeTop],
    [ur[0], bridgeTop],
    [ur[0], bridgeBottom],
    [0, bridgeBottom]
  ];


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
      }
      translate([0, 0, -1])
      linear_extrude(height = zThickness * 10)
        polygon(points=lensCutoutPoints);
    }
}

height = 46;
/* reference(); */
translate([0,0,1]) {
  funky_stuff(zThickness = 4);
}
