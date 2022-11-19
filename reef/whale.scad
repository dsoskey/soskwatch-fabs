use <./base.scad>;

module whale(radius, height) {
    svgSize = radius * 5.5/4;
    baseTile(radius, height) {
        rotate([0, 0, 0])
        translate([-svgSize/2,-svgSize*1.25/2.25,0])
        resize([svgSize,svgSize,height/2])
        linear_extrude(height/2)
        import("res/whale.svg");
    }
}

radius=27.25/2;
whale(radius=radius, height=radius/2);