// A custom mirror module that retains the original
// object in addition to the mirrored one.
module mirror_copy(v = [1, 0, 0]) {
    children();
    mirror(v) children();
}
