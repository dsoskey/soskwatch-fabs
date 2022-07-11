include <config/3DPrinter.scad>;
include <BOSL2/std.scad>;
use <mirrorCopy.scad>;
use <donut.scad>;

use <framePoints.scad>;
use <../earpiece.scad>;
use <../frameConnector.scad>;
use <../lensInset.scad>;

module reference() {
  color("blue")
  import("../DG_Frame_1_v2_v_rebuilt.stl");
}

module earpieceConnector(
  earpieceConnectorThickness=4.1,
  radius,
  innerRadius,
  bodyLength=129,
  bodyThickness=3,
  clearance = 0.25,
) {
  difference() {
    donut(
      radius=radius,
      width=earpieceConnectorThickness + 5,
      innerRadius=innerRadius
    ) {
      zcenter = -earpieceConnectorThickness / 2;
      translate([bodyLength - radius, 0, 0])
      rotate([-90,0,0])
      mirror([1,0,0])
      linear_extrude(bodyThickness)
        earpiece(
          tipRadius=6.15,
          bodyLength=bodyLength,
          earLength=40 - 6.15,
          earAngle=45
        );
    }
    cylinder(r=radius + clearance, h=earpieceConnectorThickness + clearance, center=true);
    frameConnectorCubes(radius + clearance, earpieceConnectorThickness + clearance);
  }
}

module funkyStuff(
  framePoints,
  nosePoints,
  // major dimenions
  // TODO: how does this relate to connectors
  length = 143.6,
  frameThickness = 3,
  lensThickness = .5,
  zThickness = 4,
  showEarpiece = true,
  frameColor = "orange",
  //minor dimensions
  frameTop = 20,
) {
  bridgeTop = frameTop - 1.5;
  bridgeBottom = bridgeTop - frameThickness;
  bridgePoints = [
    [0, bridgeTop],
    [framePoints[1][0], bridgeTop],
    [framePoints[1][0], bridgeBottom],
    [0, bridgeBottom]
  ];

  mirrorCopy() {
    connectorDonutRadius = frameThickness * .8;

    // TODO: derive translate and rotate from length and close points
    translate([69.25 + connectorDonutRadius / 2, -.1, -connectorDonutRadius])
    rotate([86.2, 90, 0]) {
      color(frameColor)
      frameConnector(radius=connectorDonutRadius, width=4.1);
      if (showEarpiece)
        color(frameColor)
        earpieceConnector(radius=connectorDonutRadius);
    }

    difference() {
      color(frameColor)
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
      // noseInset TODO: maybe rename inset?
      lensInset(framePoints=[nosePoints[4], nosePoints[3], nosePoints[2], framePoints[7]]);
      // lens inset
      translate([0, 0, (zThickness)/2])
      lensInset(
        framePoints=offsetF(framePoints, r=-frameThickness),
        radius=.5
      );
    }
  }
}

earpieceLength = 129;
noseWidth = 8;
noseHeight = 20;
frameThickness = 3;
length = 143.6;
height = 53.5;
zThickness = 4;

//minor dimensions
frameTop = 20;
noseTop = 10;
// nose
frameLeftY = 3.5;

nosePoints = generateNosePoints(
  noseTop = noseTop,
  noseBottom = 4.25,
  noseWidth = noseWidth
);
echo(nosePoints);

framePoints = generateFramePoints(
  length = length,
  height = height,
  nosePoints = nosePoints,
  frameTop = frameTop,
  noseTop = noseTop,
  noseHeight = noseHeight,
  noseWidth = noseWidth
);

translate([0,0,1])
rotate([90,0,90]) {
//  reference();

//  if (false)
  funkyStuff(
    framePoints=framePoints,
    nosePoints=nosePoints,
    frameThickness=frameThickness,
    zThickness=zThickness,
    showEarpiece=false
  );

  if (false)
  mirrorCopy()
  color("Gold",.4)
    translate([0, 0, (zThickness)/2])
      lensInset(
        framePoints=offsetF(framePoints, r=-frameThickness),
        radius=.125
      );
}
