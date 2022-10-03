/** # My Configurationw

## Basic Parameters

Expect these to change these when printing
*/

/** earpieceLength: distance from the frame connector to the back of your ear
Measurement instructions
1. place your finger horizontally on the spot of your nose where your glasses rest, pointing right at 90deg.
2. measure the distance from the back of your ear to your finger along the side of your temple
3. change earpieceLength to your value.
*/
earpieceLength = 132.2;

/** ## Advanced Parameters
You only need to change these if you are hacking the glasses.
These parameters are included in this file to be the single source of truth for shared variables across modules
*/

/** connectorPinRadius: radius of the connector pin (plus tolerance).
Change this if you're using a different kind of pin, but don't make it too big (numbers incoming)
 */
connectorPinRadius = .7;

/** frameLength: length of the funkyStuff frame */
frameLength = 143.6;

/** frameHeight: height of the funkyStuff frame */
frameHeight = 53.5;

/** frameThickness: thickness of the frame's 2D projection.
Tread lightly with this one: I haven't fully tested its scaling capabilities
*/
frameThickness = 3.;

/** noseWidth: the width of your nose where the glasses meet your nose */
noseWidth = 8.;

/** noseHeight: the distance from the bottom of your nose to where the glasses meet your nose */
noseHeight = 20.;

/** zThickness: how far the frame's 2d projection gets extruded */
zThickness = 4.;

// Comment/Uncomment these to change which module to render
include<earpiece.scad>;
//include<funkyStuff.scad>;
//include<lensStencil.scad>;