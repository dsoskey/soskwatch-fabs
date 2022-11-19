use <./base.scad>;

module starfish(radius, height) {
    svgSize = radius * 5.5 / 4;
    baseTile(radius, height) {
        rotate([0, 0, 0])
        translate([-svgSize/2,-svgSize/2,0])
        resize([svgSize,svgSize,height/2])
        linear_extrude(height/2)
        import("res/starfish.svg");
    }
}

radius=27.25/2;
starfish(radius=radius, height=radius/2);