use <./base.scad>;

module dolphin(radius, height) {
    svgSize = radius * 5.5 / 4;
    baseTile(radius, height) {
        rotate([0, 0, 15])
        translate([-svgSize/2.1,-svgSize/1.65,0])
        resize([svgSize,svgSize,height/2])
        linear_extrude(height/2)
        import("res/dolphin.svg");
    }
}

radius=27.25/2;
dolphin(radius=radius, height=radius/2);