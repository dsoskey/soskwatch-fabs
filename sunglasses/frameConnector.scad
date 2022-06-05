include <config/3d_printer.scad>;
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
module frameConnectorBase(
  radius,
  width = 2.15,
) {
  donut(radius=radius, width=width, innerRadius=radius/1.9)
  frameConnectorCubes(radius, width);
}

module frameConnector(
  radius,
  width=4.1,
) {
  // TODO: should i subtract a middle donut from a longer donut instead of two smalls?
  frameConnectorBase(radius, width);
}
/* if (false) */
frameConnector(radius=2);
