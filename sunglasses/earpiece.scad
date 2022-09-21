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
  centerOfEarBottomX = -earLength * cos(earAngle);
  earMeasurementPointX = centerOfEarBottomX + tipRadius - 1;
  difference() {
    union() {
      hull() {
        circle(r=tipRadius);
        translate([centerOfEarBottomX, -earLength * sin(earAngle), 0])
          circle(r=tipRadius);
      }
      hull() {
        circle(r=tipRadius);
        squareSize = tipRadius * 1.5;
        translate([earMeasurementPointX + bodyLength, 0, 0])
          square(size=squareSize, center=true);
      }
    }
    hull()
      earCutout(earCutoutRadius=tipRadius * 2, earAngle=cutoutAngle);
  }
}

earAngle=45;
tipRadius=6.15;
oldBodyLength = 127.912;
bodyLength= oldBodyLength + 14.1731;
testerBodyLength = 175;
earLength = 40 - tipRadius;

// measure from inside of red rectangle forward to get bodyLength
color("red") {
  translate([-earLength * cos(earAngle) + tipRadius - 2,-earLength + tipRadius + 3,0])
    cube([2,earLength - tipRadius + 3,3]);
}
color("whitesmoke")
translate([0, 0, 0])
linear_extrude(3)
  earpiece(
    tipRadius=6.15,
    bodyLength=testerBodyLength,
    earLength=earLength
  );
if (false)
translate([0, 0, -2])
color("blue")
linear_extrude(1)
  earCutout(tipRadius * 2, earAngle/2);
