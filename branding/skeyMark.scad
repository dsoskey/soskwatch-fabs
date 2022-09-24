include <config/3DPrinter.scad>;

module skeyMark(stroke) {
    baseLineDistance = stroke * 2;
    sMultiplier = 1.35;
    kArmMultiplier = 1.35;
    kHeightMultiplier = 1.5;

    hull() {
        translate([baseLineDistance * kArmMultiplier, baseLineDistance * kArmMultiplier, 0])
        circle(d=stroke);
        translate([-baseLineDistance * sMultiplier,-baseLineDistance * sMultiplier,0])
        circle(d=stroke);
    }

    hull() {
        translate([0, sqrt(2 * pow(baseLineDistance * sMultiplier, 2)) + baseLineDistance * sMultiplier / 2, 0])
            circle(d=stroke);
        translate([-baseLineDistance * sMultiplier, baseLineDistance * sMultiplier, 0])
            circle(d=stroke);
    }

    hull() {
        translate([-baseLineDistance * sMultiplier, baseLineDistance * sMultiplier, 0])
            circle(d=stroke);
        translate([baseLineDistance * kArmMultiplier, -baseLineDistance * kArmMultiplier, 0])
            circle(d=stroke);
    }

    hull() {
        translate([0, baseLineDistance * kHeightMultiplier, 0])
            circle(d=stroke);
        translate([0, -baseLineDistance * kHeightMultiplier, 0])
            circle(d=stroke);
    }
}

color("Purple")
for (i = [1:5]) {
    translate([i * i * 7.5 , 0, 0])
        linear_extrude(.01)
        skeyMark(stroke=2*i);
}
