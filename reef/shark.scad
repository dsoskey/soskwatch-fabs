use <./base.scad>;

module shark(radius, height) {
    svgSize = radius * 5.5 / 4;
    baseTile(radius, height) {
        translate([-radius, 0, 0])
        rotate([0, 0,-45])
        resize([svgSize,svgSize,height / 2])
        linear_extrude(height / 2)
        import("res/shark-2.svg");
    }
}

radius=27.25/2;
shark(radius, radius/2);