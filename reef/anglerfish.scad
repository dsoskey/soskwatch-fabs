use <./base.scad>;

module anglerfish(radius, height) {
    svgSize = radius * 5.5 / 4;
    baseTile(radius, height) {
        rotate([0, 0, 30])
        translate([-svgSize/1.9,-svgSize/1.5,0])
        resize([svgSize,svgSize,height/2])
        linear_extrude(height/2)
        import("res/anglerfish.svg");
    }
}

radius=15;
height=9.35;
anglerfish(radius=radius, height=height);