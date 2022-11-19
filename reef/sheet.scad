use <./anglerfish.scad>;
use <./base.scad>;
use <./crab.scad>;
use <./dolphin.scad>;
use <./octopus.scad>;
use <./shark.scad>;
use <./starfish.scad>;
use <./turtle.scad>;
use <./whale.scad>;

module hex7Display(
    hexRadius
) {
    points = concat([[0,0]], coords(hexRadius, 6));
    for (index = [0:len(points)-1]) {
        point = points[index];

        translate([point.x, point.y, 0])
        rotate([0,0,90])
        children(index);
    }
}

radius=15;
height=9.35;
displayRadius = radius * 1.8;

if(false)
hex7Display(displayRadius) {
    shark(radius, height);
    turtle(radius, height);
    crab(radius, height);
    dolphin(radius, height);
    starfish(radius, height);
    whale(radius, height);
    octopus(radius, height);
}

//if(false)
hex7Display(displayRadius) {
    shark(radius, height);
    shark(radius, height);
    crab(radius, height);
    dolphin(radius, height);
    dolphin(radius, height);
    starfish(radius, height);
    anglerfish(radius, height);
}