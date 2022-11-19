use <./base.scad>;

module octopus(radius, height) {
    svgSize = radius * 5.5 / 4;
    baseTile(radius, height) {
        rotate([0, 0, 30])
        translate([-svgSize/1.9,-svgSize/2,0])
        resize([svgSize,svgSize,height/2])
        linear_extrude(height/2)
        import("res/octopus.svg");
    }
}

radius=27.25/2;
octopus(radius=radius, height=radius/2);