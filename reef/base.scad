include <config/3DPrinter.scad>;

function angles(order)=[ for (i = [0:order-1]) i*(360/order) ];
function coords(r, order)=[ for (th=angles(order)) [r*cos(th), r*sin(th)] ];


module baseTile(r, ext) {
    hexPoints = coords(r, 6);

    difference(){
        linear_extrude(ext)
        polygon(hexPoints);

        h=ext/2;
        pointR = 0;
        baseR = h * 5/7;
        for(point=[0:len(hexPoints)-1]) {
            hull() {
                translate([hexPoints[point].x,hexPoints[point].y,ext*1.1])
                    cylinder(h=h, r1=pointR, r2=baseR, center=true);
                nextPoint = (point+1)%len(hexPoints);
                translate([hexPoints[nextPoint].x,hexPoints[nextPoint].y,ext*1.1])
                    cylinder(h=h, r1=pointR, r2=baseR, center=true);
            }

            hull() {
                translate([hexPoints[point].x,hexPoints[point].y,-ext*.1])
                    cylinder(h=h, r1=baseR, r2=pointR, center=true);
                nextPoint = (point+1)%len(hexPoints);
                translate([hexPoints[nextPoint].x,hexPoints[nextPoint].y,-ext*.1])
                    cylinder(h=h, r1=baseR, r2=pointR, center=true);
            }

        }

        translate([0,0,ext*.8])
            children();
    }
}

baseTile(4, 2) {
    resize([5,5,1])
        translate([-256,-100,0])
            linear_extrude(1)
                import("shark.svg");
}


