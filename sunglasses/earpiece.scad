include <config/3DPrinter.scad>;

module earCutout(
  earCutoutRadius,
  earAngle,
) {
  ringus = 3.5;
  translate([earCutoutRadius * 1.35, -earCutoutRadius * 1.25, 0])
  resize([earCutoutRadius * ringus + 2, 0, 0], auto=[true,false,false])
  circle(r=earCutoutRadius);

  translate([earCutoutRadius * .15, -earCutoutRadius * 2, 0])
  rotate([0, 0, earAngle])
  resize([earCutoutRadius * ringus, 0, 0], auto=[true,false,false])
  circle(r=earCutoutRadius);
}

module earpiece(
  tipRadius=2,
  bodyLength=24,
  earLength=10,
  earAngle=45,
  cutoutAngle=45/2
) {
  difference() {
    union() {
      hull() {
        circle(r=tipRadius);
        translate([-earLength * cos(earAngle), -earLength * sin(earAngle), 0])
        circle(r=tipRadius);
      }
      hull() {
        circle(r=tipRadius);
        squareSize = tipRadius*1.5;
        translate([bodyLength - squareSize / 2,0, 0])
        square(size=squareSize, center=true);
      }
    }
    hull()
      earCutout(earCutoutRadius=tipRadius * 2, earAngle=cutoutAngle);
  }

}

earAngel=45;
tipRadius=6.15;
oldBodyLength = 124.3;
bodyLength= 127.912;
rightx = bodyLength + tipRadius * .75 - 1;
echo(rightx);
color("red") {
  translate([-1,-10,0])
    cube([1,20,5]);

  translate([bodyLength-1,-10,0])
    cube([1,20,5]);
}
color("whitesmoke")
translate([0, 0, -1])
linear_extrude(3)
  earpiece(
    tipRadius=6.15,
    bodyLength=bodyLength,
    earLength=40 - 6.15
  );
translate([0, 0, -2])
color("blue")
linear_extrude(1)
  earCutout(tipRadius * 2, earAngel/2);
