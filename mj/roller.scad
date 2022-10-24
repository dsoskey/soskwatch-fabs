include <config/3DPrinter.scad>;

length = 80;
width = 30;
height = width / 1.5;

difference() {
    cube(size=[length, width, height], center=true);
    translate([0,0,height*2/3])
    rotate([0,90,0])
        cylinder(r=width *.4, h=length*1.01, center=true);
}

