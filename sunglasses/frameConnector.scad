include <config/3DPrinter.scad>;
use <donut.scad>;

module frameConnectorCubes(
  radius,
  width = 2.15,
) {
  translate([-radius, radius/3.2, 0])
  rotate([0, 0, 10])
    cube([radius*2, radius, width], center=true);
  translate([-radius/2, -radius/2, 0])
    cube([radius,radius, width], center=true);
}
module frameConnector(
  radius,
  width = 4.1,
  innerRadiusRatio=1.9
) {
  donut(radius=radius, width=width, innerRadius=radius/innerRadiusRatio)
  frameConnectorCubes(radius, width);
}

/* if (false) */
frameConnector(radius=2, innerRadiusRatio=1.4);
