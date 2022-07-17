include <config/3DPrinter.scad>;
include <BOSL2/std.scad>;
use <mirrorCopy.scad>;
use <donut.scad>;

use <framePoints.scad>;
use <earpiece.scad>;
use <../frameConnector.scad>;
use <../lensInset.scad>;

module reference() {
  color("blue")
  import("../DG_Frame_1_v2_v_rebuilt.stl");
}

module funkyStuff(
  framePoints,
  nosePoints,
  frameThickness = 3,
  lensThickness = .5,
  zThickness = 4,
  showEarpiece,
  frameColor = "orange",
  connectorPinRadius = .6,
) {
  noseTop = nosePoints[0][1];
  bridgeTop = frameTopY() - 1.5;
  bridgeBottom = bridgeTop - frameThickness;
  bridgePoints = [
    [0, bridgeTop],
    [framePoints[1][0], bridgeTop],
    [framePoints[1][0], bridgeBottom],
    [0, bridgeBottom]
  ];

  connectorY = noseTop - 10.1;
  mirrorCopy() {
    connectorRadius = frameThickness * .8;

    // TODO: derive translate and rotate from length and close points
    translate([69.25 + connectorRadius / 2, connectorY, -connectorRadius])
    rotate([86.2, 90, 0]) {
      color(frameColor)
      frameConnector(radius=connectorRadius, width=4.1, innerRadius=connectorPinRadius);
      if (showEarpiece)
        color(frameColor)
        earpieceConnector(radius=connectorRadius, innerRadius=connectorPinRadius);
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

assembled = false;
noseWidth = 8;
noseHeight = 20;
frameThickness = 3;
length = 143.6;
height = 53.5;
zThickness = 4;
connectorPinRadius = .62;

nosePoints = generateNosePoints(
  noseWidth = noseWidth
);

framePoints = generateFramePoints(
  length = length,
  height = height,
  nosePoints = nosePoints,
  noseHeight = noseHeight,
  noseWidth = noseWidth
);

translate([0, 0, 1])
rotate([assembled ? 90 : 180, 0, 90]) {
  funkyStuff(
    framePoints=framePoints,
    nosePoints=nosePoints,
    frameThickness=frameThickness,
    connectorPinRadius=connectorPinRadius,
    zThickness=zThickness,
    showEarpiece=assembled
  );

  if (assembled)
  mirrorCopy()
  color("Gold",.4)
    translate([0, 0, (zThickness)/2])
      lensInset(
        framePoints=offsetF(framePoints, r=-frameThickness),
        radius=.125
      );
}
