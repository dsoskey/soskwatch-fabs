include <BOSL2/std.scad>;
use <./lensInset.scad>;

module lensStencil(lensPoints, traceLineLength = 6, penWidth = .74) {
    innerLensPoints = offsetF(lensPoints, r=-traceLineLength);
    color("Gold",.4)
    difference() {
        lensInset(framePoints=lensPoints, radius=.25);
        for (index = [1 : len(lensPoints) - 1]) {
            point = lensPoints[index];
            joint = innerLensPoints[index];
            hull() {
                translate([point[0], point[1], -5])
                    cylinder(r=penWidth, h=10);
                translate([joint[0],joint[1], -5])
                    cylinder(r=penWidth, h=10);
            }
        }
    }
}