use <framePoints.scad>;
use <../lens/stencil.scad>;

_frameThickness = default(frameThickness, 3);
_noseWidth = default(noseWidth, 8);
_noseHeight = default(noseHeight, 20);
_frameLength = default(frameLength, 143.6);
_frameHeight = default(frameHeight, 53.5);

nosePoints = generateNosePoints(noseWidth = _noseWidth);

framePoints = generateFramePoints(
    length = _frameLength,
    height = _frameHeight,
    nosePoints = nosePoints,
    noseHeight = _noseHeight,
    noseWidth = _noseWidth
);

lensStencil(lensPoints = offsetF(framePoints, r=-_frameThickness));
