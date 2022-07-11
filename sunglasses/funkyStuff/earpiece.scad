include <config/3DPrinter.scad>;
use <mirrorCopy.scad>;
use <index.scad>;

// measured old 133
autozoneEarLength = 118;
bannyEarLength = 129;
// TODO: Single source of truth
frameThickness = 3;

rotate([270,0,0])
mirrorCopy([0,0,1])
translate([0,0,7])
    earpieceConnector(
    bodyLength=autozoneEarLength,
    radius=frameThickness * .8,
    innerRadius=1
);