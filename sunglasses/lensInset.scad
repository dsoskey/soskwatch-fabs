use <mirror_copy.scad>;
module hedron(
  radius
) {
  hyp = (radius ^ 2 + radius ^ 2) ^ .5;
  rotate([0,0,45])
  mirror_copy([0,0,-1])
  polyhedron(
  points=[ [radius,radius,0],[radius,-radius,0],[-radius,-radius,0],[-radius,radius,0], // the four points at base
           [0,0,hyp]  ],                                 // the apex point
  faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],              // each triangle side
              [1,0,3],[2,1,3] ]                         // two triangles for square base
 );
}

module lensInset(
  framePoints,
  radius = 1,
) {
  //
  hull() {
    for(point = framePoints) {
      translate([point[0], point[1]])
      hedron(radius=radius);
    }
  }
}

/* if (false) */
lensInset(
  framePoints = [[10, 10], [20,0], [5, -20] ]
);

if (false)
color("DeepPink")
hedron(radius=10);
