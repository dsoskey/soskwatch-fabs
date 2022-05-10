include <config/3d_printer.scad>;
use <mirror_copy.scad>;

module reference() {
  color("blue") {
    import("/Users/asks/Documents/OpenSCAD/sunglasses/DG_Frame_1_v2_v_rebuilt.stl");
  }
}

module funky_stuff(
  bridgeThickness = 1,

  noseTop = 12,
  noseBottom = 4.25,
  frameTop = 15,
  frameTopRight = 57,
  connectorRight = 68,
  frameRight = 64,
  frameBottom = -17,
  thickness = 1,
) {

  topMiddle = [0, noseTop];
  r1 = [5, noseTop];
  ur = [17, frameTop];
  r2 = [frameTopRight, frameTop];
  rd = [connectorRight, frameTop - 2];
  d = [connectorRight, frameTop - 8];
  ld1 = [frameRight, 5];
  ld2 = [frameRight + 1, -10];
  ld3 = [frameRight - 10, frameBottom];
  l1 = [23, frameBottom];
  ul1 = [10, -10];
  ul2 = [4, 3.5];
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

  bridgeBottom = ur[1] - bridgeThickness - 1;
  bridgePoints = [
    [0, frameTop - 1],
    [ur[0], frameTop - 1],
    [ur[0], bridgeBottom],
    [0, bridgeBottom]
  ];

  connectorPoints = [r2, rd, d, ld1];
  lensStart = [r1[0] + 1,11];
  Lur = [17, frameTop - 1.5];
  Lr = [frameRight - 7.5, frameTop - 1.5];
  Ldr = [frameRight - 1.5, 5];
  Ldr2 = [frameRight - .5, -9.2];
  Ldl = [frameRight - 10, frameBottom + 1.4];
  Ll = [23, frameBottom + 1.4];
  Lul = [11, -9];
  Lul2 = [5, 4.5];
  lensCutoutPoints = [lensStart, Lur, Lr, Ldr, Ldr2, Ldl, Ll, Lul, Lul2];

  mirror_copy()
    difference() {
      translate([0, 0, 1]) {
        linear_extrude(height = thickness) {
          polygon(points=bridgePoints);

          polygon(points=nosePoints);
          polygon(points=framePoints);
          polygon(points=connectorPoints);
        }
      }
      linear_extrude(height = thickness * 10)
        polygon(points=lensCutoutPoints);
    }
}

translate([0,0,-2]) {
  /* reference(); */
  funky_stuff(thickness = 1);
}
