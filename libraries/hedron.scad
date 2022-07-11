use <mirrorCopy.scad>;
use <math.scad>;

module octohedron(radius) {
    rotate([0,0,45])
    mirrorCopy([0,0,-1])
    polyhedron(
        // the four points at base
        points=[ [radius,radius,0],[radius,-radius,0],[-radius,-radius,0],[-radius,radius,0],
        // the apex point
            [0,0,hyp(radius)]  ],
        // each triangle side
        faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],
        // two triangles for square base
            [1,0,3],[2,1,3] ]
    );
}

color("DeepPink")
octohedron(radius=25);