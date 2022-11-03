include <config/3DPrinter.scad>;

module hookahBowlHolder(
zThickness = 3.69,
hookahRadius = 23.3/2,
bowlRadius = 7.25,
) {
    difference() {
        outerRadius = hookahRadius * 1.5;
        bowlXOffset = -outerRadius * 2.5;
        linear_extrude(height = zThickness) {
            difference() {
                circle(r = outerRadius);
                circle(r = hookahRadius);
                translate([hookahRadius, 0])
                    square(size = [outerRadius / 1.5, outerRadius], center = true);
            }

            translate([- outerRadius * 1.2, 0])
                square(size = [outerRadius, outerRadius], center = true);

            translate([bowlXOffset, 0])
                difference() {
                    circle(r = outerRadius);
                    circle(r = bowlRadius);
                }
        }

        translate([bowlXOffset,0,bowlRadius-1])
        sphere(r=bowlRadius + 1);
    }

}

hookahBowlHolder();