include <config/3DPrinter.scad>;
use <roundedCube.scad>;

module wallOfRootsFace(
  size,
  toughness="0",
  font="Helvetica Neue:style=Bold"
) {
  text(str("-0/-",toughness),
   size=size,
   font=font,
   halign="center",
   valign="center",
   spacing=1.0,
   direction="ltr",
   language="en",
   script="latin"
 );
}

module wallOfRootsDie(
  cubeSize = 15,
  cornerRadius = 1,
  font="Papyrus:style=Condensed"
) {
  etchDepth = cubeSize/10;
  etchZ = (cubeSize+cornerRadius)/2 - etchDepth;
  fontSize = cubeSize/3-1;

  color("lime")
  etchedCube(cubeSize=cubeSize, cornerRadius=cornerRadius) {
    wallOfRootsFace(size=fontSize, toughness=1);
    wallOfRootsFace(size=fontSize, toughness=2);
    wallOfRootsFace(size=fontSize, toughness=3);
    wallOfRootsFace(size=fontSize, toughness=4);
    wallOfRootsFace(size=fontSize, toughness=5);
    wallOfRootsFace(size=fontSize, toughness=6);
  }
}

/* wallOfRootsDie(
  font="Helvetica Neue:style=Bold"
); */
/* module bolt(size = 2) {
  scale([size, size, 0])
  translate([-1, -1, 0])
  polygon(points=[
    [.8,0],
    [2,1.3],
    [.7,1.1],
    [1.2, 2],
    [0, .7],
    [1.3, .9]
  ]);
} */

/* translate([20,0,0])
dotDie(cornerRadius=2) {
  bolt();
} */

roundedCube();
