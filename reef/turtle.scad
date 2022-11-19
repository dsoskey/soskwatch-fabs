use <./base.scad>;

module turtle(radius, height) {
    svgSize = radius * 5.5 / 4;
    baseTile(radius, height) {
        rotate([0, 0, 90])
        translate([-svgSize/1.57,-svgSize/2,0])
        resize([svgSize,svgSize,height/2])
        linear_extrude(height/2)
        import("res/turtle-2.svg");
    }
}

radius=27.25/2;
translate([0,0,-radius/2])
turtle(radius=radius, height=radius/2);