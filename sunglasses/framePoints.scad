function frameBottom(top, height)  = top - height;

function frameRightX(length) =  length / 2 - 1; // TODO: remove -1 from this number?

function generateFramePoints (
  // major dimenions
  // TODO: how does this relate to connectors
  length,
  height,
  //minor dimensions
  frameTop = 20,
  noseTop = 10,
  frameTopRight = 58,
  frameLeftX = 4,
  frameLeftY = 3.5,
  frameBottomLeftX = 27,
  frameRightY = 5,
) = [
  [frameLeftX + 1, noseTop],
  // TODO: name ur[0]
  [17, frameTop],
  [frameTopRight, frameTop],
  [frameRightX(length), frameRightY],
  [frameRightX(length) + 1, -10],
  [frameRightX(length) - 10, frameBottom(frameTop, height)],
  [frameBottomLeftX, frameBottom(frameTop, height)],
  [10, -10],
  [frameLeftX, frameLeftY]
];