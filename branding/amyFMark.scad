use <hedron.scad>;
include <config/3DPrinter.scad>;

markCenterX = -45.5;
markCenterY = -26.5;

markDepth = 3;

holderSideLength = 12;
holderDepth = 50;

module mark(
    holderSideLength,
    holderDepth,
    markDepth
) {
    hedronRadius = holderSideLength / 4;
    difference() {
        cube(size=[holderSideLength, holderSideLength, holderDepth], center=true);
        translate([0,holderSideLength / 2,.4 * holderDepth])
            octohedron(radius=hedronRadius);
    }
    color("red")
    mirror([1,0,0])
    translate([markCenterX, markCenterY, holderDepth / 2 - .01])
    linear_extrude(markDepth)
        import("./MusicalFlowAF_final.svg");
}

module negativeMark(
    holderRadius,
    holderDepth,
    markDepth
) {
    difference() {
        cylinder(r=holderRadius, h=holderDepth, center=true);
        color("red")
        mirror([1,0,0])
        translate([markCenterX, markCenterY - .625, (holderDepth) / 2 - markDepth + 0.01])
        linear_extrude(markDepth + 0.09)
            #import("./MusicalFlowAF_final.svg");
    }  
}

//if(false)
mark(
    holderSideLength = holderSideLength,
    holderDepth = holderDepth,
    markDepth = markDepth
);


//if (false)
translate([holderSideLength * 1.5, 0,0])
negativeMark(holderRadius=holderSideLength/2, holderDepth=holderDepth, markDepth=markDepth);