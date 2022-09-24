include <config/3DPrinter.scad>;
use <mirrorCopy.scad>;
use <donut.scad>;
use <../earpiece.scad>;
use <../frameConnector.scad>;
use <../../branding/skeyMark.scad>;

oldautozoneEarLength = 108;
autozoneEarLength = oldautozoneEarLength + 14.1731;
oldBannyEarLength = 118;
bannyEarpieceLength = 118 + 14.1731;
// TODO: Single source of truth
frameThickness = 3;
connectorPinRadius = .7;

module earpieceConnector(
    earpieceConnectorThickness=4.1,
    radius,
    innerRadius,
    showMark,
    bodyLength=bannyEarpieceLength,
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
            tipRadius = 6.15;
            earLength = 40 - tipRadius;
            earAngle = 45;
            difference() {
                translate([bodyLength - (earLength * cos(earAngle) - tipRadius * 1.2), 0, 0])
                rotate([-90,0,0])
                mirror([1,0,0])
                linear_extrude(bodyThickness)
                    earpiece(
                        tipRadius=tipRadius,
                        bodyLength=bodyLength,
                        earLength=earLength,
                        earAngle=earAngle
                    );
                if (showMark)
                    translate([bodyLength + tipRadius * 1.15, bodyThickness + .1, earLength * sin(earAngle)])
                    rotate([-90,0,180])
                linear_extrude(bodyThickness/2)
                    skeyMark(1);
            }
        }
        cylinder(r=radius + clearance, h=earpieceConnectorThickness + clearance, center=true);
        rotate([0, 0, 15])
        frameConnectorCubes(radius + clearance, earpieceConnectorThickness + clearance);
    }
}

rotate([270,0,0]){
    translate([0,0,7])
    earpieceConnector(
        bodyLength=bannyEarpieceLength,
        radius=frameThickness * .8,
        innerRadius=connectorPinRadius
    );
    translate([0,0, -7])
    mirror([0,0,1])
    earpieceConnector(
        bodyLength=bannyEarpieceLength,
        radius=frameThickness * .8,
        innerRadius=connectorPinRadius,
        showMark=true
    );

}
