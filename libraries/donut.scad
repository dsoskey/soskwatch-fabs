
module donut(
  width,
  radius,
  innerRadius
) {
  _innerRadius = innerRadius == undef ? radius / 2 : innerRadius;
  difference() {
    union() {
      cylinder(r=radius, h=width, center=true);
      children();
    }
    cylinder(r=_innerRadius, h=width + 1000, center=true);
  }
}
