include <config/3DPrinter.scad>;
use <mirrorCopy.scad>;
use <donut.scad>;
use <../earpiece.scad>;
use <../frameConnector.scad>;

// measured old 133
autozoneEarLength = 118;
bannyEarLength = 118;
// TODO: Single source of truth
frameThickness = 3;
connectorPinRadius = .7;

module earpieceConnector(
    earpieceConnectorThickness=4.1,
    radius,
    innerRadius,
    bodyLength=bannyEarLength,
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
        rotate([0, 0, 15])
        frameConnectorCubes(radius + clearance, earpieceConnectorThickness + clearance);
    }
}

rotate([270,0,0])
//mirrorCopy([1,0,0])
mirrorCopy([0,0,1])
translate([5,0,7])
    earpieceConnector(
    bodyLength=autozoneEarLength,
    radius=frameThickness * .8,
    innerRadius=connectorPinRadius
);