include <config/3DPrinter.scad>;
use <roundedCube.scad>;

length = 100;
width = 29.2;
height = 18.4;

difference() {
    roundedCube(size=[length, width, height]);
    translate([0,0,height*2/3])
    rotate([0,90,0])
        cylinder(r=width *.4, h=length*1.1, center=true);
}

