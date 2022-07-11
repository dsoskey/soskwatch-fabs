use <mirrorCopy.scad>;
use <hedron.scad>;

module lensInset(
  framePoints,
  radius = 1,
) {
  hull() {
    for(point = framePoints) {
      translate([point[0], point[1]])
      octohedron(radius=radius);
    }
  }
}

framePoints = [ [10, 0], [0, 10], [-10, 0], [0, -10] ];

deg=$t*360;
highPass=.2;
limited=$t-highPass < highPass ? highPass : $t;
alpha=.25 * sin(deg) + .5;

echo(alpha);
rotate([deg, deg, deg])
color([1-alpha, 0, 0.5]) {
  lensInset(framePoints=framePoints);
  rotate([90,0,0])
  lensInset(framePoints=framePoints);
  rotate([0,90,0])
  lensInset(framePoints=framePoints);
}
