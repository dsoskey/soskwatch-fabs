include <config/3DPrinter.scad>;
include <BOSL2/std.scad>;
use <mirrorCopy.scad>;
use <donut.scad>;
use <hedron.scad>;
use <framePoints.scad>;
use <earpiece.scad>;
use <../frameConnector.scad>;
use <../lens/lensInset.scad>;

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
  bridgeBottom = bridgeTop - _frameThickness;
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
        earpieceConnector(
          bodyLength=120,
          radius=connectorRadius,
          innerRadius=connectorPinRadius
        );
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

_frameThickness = default(frameThickness, 3);
_connectorPinRadius = default(connectorPinRadius, .7);
_noseWidth = default(noseWidth, 8);
_noseHeight = default(noseHeight, 20);
_frameLength = default(frameLength, 143.6);
_frameHeight = default(frameHeight, 53.5);
_zThickness = default(zThickness, 4);

assembled = false;
nosePoints = generateNosePoints(noseWidth = _noseWidth);

framePoints = generateFramePoints(
  length = _frameLength,
  height = _frameHeight,
  nosePoints = nosePoints,
  noseHeight = _noseHeight,
  noseWidth = _noseWidth
);

translate([0, 0, 1])
rotate([assembled ? 90 : 180, 0, 90]) {
  funkyStuff(
    framePoints=framePoints,
    nosePoints=nosePoints,
    frameThickness=_frameThickness,
    connectorPinRadius=_connectorPinRadius,
    zThickness=_zThickness,
    showEarpiece=assembled
  );

  if (assembled)
  mirrorCopy()
  color("Gold",.4)
    translate([0, 0, (zThickness)/2])
      lensInset(
        framePoints=offsetF(framePoints, r=-_frameThickness),
        radius=.125
      );
}
