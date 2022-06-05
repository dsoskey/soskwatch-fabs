include <config/3d_printer.scad>;
use <mirror_copy.scad>;
use <donut.scad>;
use <earpiece.scad>;
use <frameConnector.scad>;

module reference() {
  color("blue") {
    import("/Users/asks/Documents/OpenSCAD/sunglasses/DG_Frame_1_v2_v_rebuilt.stl");
  }
}



module earpieceConnector(
  earpieceConnectorThickness=4.1,
  radius,
  bodyLength=91.3,
  bodyThickness=3,
) {
  difference() {
    donut(
      radius=radius,
      width=earpieceConnectorThickness + 5
    ) {
      zcenter = -earpieceConnectorThickness / 2;
      translate([bodyLength + radius * 1.31, 0, 0])
      rotate([-90,0,0])
      mirror([1,0,0])
      linear_extrude(bodyThickness)
        earpiece(
          tipRadius=6.15,
          bodyLength=bodyLength,
          earLength=40 - 6.15
        );
    }
    cylinder(r=radius + 0.1, h=earpieceConnectorThickness + 0.05, center=true);
    frameConnectorCubes(radius + 0.1, earpieceConnectorThickness + 0.05);
  }
}

module funky_stuff(
  // major dimenions
  // TODO: how does this relate to connectors
  length = 143.6,
  height = 53.5,
  frameThickness = 3,
  lensThickness = .5,
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
  zThickness = 4,
  showEarpiece = true,
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

  mirror_copy() {
    connectorDonutRadius = frameThickness * 2 / 3;
    // TODO: derive translate and rotate from length and close points
    translate([70.14, -.1, -connectorDonutRadius])
    rotate([86.2, 90, 0]) {
      color("green")
      frameConnector(radius=connectorDonutRadius);
      if (showEarpiece)
        color("green", 1)
        earpieceConnector(radius=connectorDonutRadius);
    }

    color("yellow", 1)
    difference() {
      // lens
      linear_extrude(height = zThickness) {
        difference() {
          union() {
            polygon(points=bridgePoints);
            polygon(points=nosePoints);
            polygon(points=framePoints);
          }
          offset(r= -frameThickness)
            polygon(points=framePoints);
        }
      }
      // lens inset
      translate([0, 0, (zThickness - lensThickness)/2])
      linear_extrude(height = lensThickness)
      offset(r = -frameThickness + .5)
        polygon(points=framePoints);
    }



  }
}

/* reference(); */
frameThickness = 3;


if (false)
mirror_copy([0,0,1])
translate([0,0,10])
earpieceConnector(radius=frameThickness * 2 / 3);

/* if (false) */
translate([0,0,1])
rotate([90,0,90]) {
  funky_stuff(
    frameThickness=frameThickness,
    zThickness = 4,
    showEarpiece=true
  );
}
