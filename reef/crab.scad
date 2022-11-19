use <./base.scad>;

module crab(radius, height) {
    svgSize = radius * 5.5 / 4;
    baseTile(radius, height) {
        rotate([0, 0, 0])
        translate([-svgSize/2,-svgSize/2.1,0])
        resize([svgSize,svgSize,height/2])
        linear_extrude(height/2)
        import("res/crab.svg");
    }
}

radius=27.25/2;
crab(radius=radius, height=radius/2);