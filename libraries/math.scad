/**
 * calculates a hypotenuse.
 * @a - first (or only) side
 * @b - optional second side
 */
function hyp(a, b) = (b == undef) ?
    (a ^ 2 + a ^ 2) ^ .5 :
    (a ^ 2 + b ^ 2) ^ .5;