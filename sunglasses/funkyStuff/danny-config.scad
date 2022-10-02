/** # My Configuration

## Measurement instructions

1. place your finger horizontally on the spot of your nose where your glasses rest, pointing right at 90deg.
2. measure the distance from the back of your ear to your finger along the side of your temple
3. change earpieceLength to your value.
*/
earpieceLength = 132.2;

/** ## Advanced Parameters.

You only need to change these if you are hacking the glasses.
These parameters are included in this file to be the single source of truth for shared variables across modules
*/

/** ### frameThickness
Thickness of the frame.
Tread lightly with this one: I haven't fully tested its scaling capabilities
*/
frameThickness = 3.;

/** ### connectorPinRadius
radius of the connector pin (plus tolerance).
Change this if you're using a different kind of pin,
 but don't make it too big (numbers incoming)
 */
connectorPinRadius = .7;

// Comment/Uncomment these to change which module to render
include<earpiece.scad>;
//include<funkyStuff.scad>;
