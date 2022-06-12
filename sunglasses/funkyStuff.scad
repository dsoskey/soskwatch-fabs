include <config/3DPrinter.scad>;
include <BOSL2/std.scad>;

include <framePoints.scad>;
use <mirrorCopy.scad>;
use <donut.scad>;
use <earpiece.scad>;
use <frameConnector.scad>;
use <lensInset.scad>;

module reference() {
  color("blue") {
    import("/Users/asks/Documents/OpenSCAD/sunglasses/DG_Frame_1_v2_v_rebuilt.stl");
  }
}

module earpieceConnector(
  earpieceConnectorThickness=4.1,
  radius,
  bodyLength=91.3 + 20,
  bodyThickness=3,
  clearance = 0.25,
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
    cylinder(r=radius + clearance, h=earpieceConnectorThickness + clearance, center=true);
    frameConnectorCubes(radius + clearance, earpieceConnectorThickness + clearance);
  }
}

module funkyStuff(
  framePoints,
  // major dimenions
  // TODO: how does this relate to connectors
  length = 143.6,
  height = 53.5,
  frameThickness = 3,
  lensThickness = .5,
  zThickness = 4,
  showEarpiece = true,
  frameColor = "orange",
  //minor dimensions
  frameTop = 20,
  noseTop = 10,
  noseBottom = 4.25,
  connectorRight = 68,
) {
  nosePoints = [
    [0, noseTop],
    framePoints[0],
    framePoints[8],
    // TODO: define 2
    [2, noseBottom],
    [0, noseBottom]
  ];

  bridgeTop = frameTop - 1.5;
  bridgeBottom = bridgeTop - frameThickness;
  bridgePoints = [
    [0, bridgeTop],
    [framePoints[1][0], bridgeTop],
    [framePoints[1][0], bridgeBottom],
    [0, bridgeBottom]
  ];

  mirrorCopy() {
    connectorDonutRadius = frameThickness * 2 / 3;
    // TODO: derive translate and rotate from length and close points
    translate([70.14, -.1, -connectorDonutRadius])
    rotate([86.2, 90, 0]) {
      color(frameColor, .69)
      frameConnector(radius=connectorDonutRadius, width=4.1);
      if (showEarpiece)
        color(frameColor, .69)
        earpieceConnector(radius=connectorDonutRadius);
    }

    difference() {
      color(frameColor, .69)
      linear_extrude(height = zThickness) {
        difference() {
          union() {
            polygon(points=bridgePoints);
            polygon(points=nosePoints);
            polygon(points=framePoints);
          }
          offset(r=-frameThickness)
            polygon(points=framePoints);
        }
      }

      // lens inset
      translate([0, 0, (zThickness)/2])
      lensInset(
        framePoints=offsetF(framePoints, r=-frameThickness),
        radius=.5
      );
    }
  }
}

frameThickness = 3;
length = 143.6;
height = 53.5;
zThickness = 4;

//minor dimensions
frameTop = 20;
noseTop = 10;
frameTopRight = 58;
// nose
frameLeftX = 4;
frameLeftY = 3.5;
frameBottomLeftX = 27;
frameRightY = 5;

framePoints = generateFramePoints(
  length = length,
  height = height,
  frameTop = frameTop,
  noseTop = noseTop,
  frameTopRight = frameTopRight,
  frameLeftX = frameLeftX,
  frameLeftY = frameLeftY,
  frameBottomLeftX = frameBottomLeftX,
  frameRightY = frameRightY
);

if (false)
mirrorCopy([0,0,1])
translate([0,0,7])
earpieceConnector(radius=frameThickness * 2 / 3);

translate([0,0,1])
rotate([90,0,90]) {
//  reference();

//  if (false)
  funkyStuff(
    framePoints=framePoints,
    frameThickness=frameThickness,
    zThickness=zThickness,
    showEarpiece=true
  );

//  if (false)
  mirrorCopy()
  color("DeepSkyBlue",.1)
    translate([0, 0, (zThickness)/2])
      lensInset(
        framePoints=offsetF(framePoints, r=-frameThickness),
        radius=.5
      );
}
