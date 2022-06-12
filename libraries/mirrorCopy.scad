// A custom mirror module that retains the original
// object in addition to the mirrored one.
module mirrorCopy(v = [1, 0, 0]) {
    children();
    mirror(v) children();
}
