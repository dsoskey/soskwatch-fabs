function noseBottomY(noseTop, noseHeight) = noseTop - noseHeight;

function frameLeftX(noseWidth) = noseWidth / 2;

function frameTopRight(length) = length / 2 - 13.8;

function frameBottomY(top, height) = top - height;

function frameBottomLeftX(frameLeftX) = frameLeftX + 23;

function frameRightX(length) = length / 2 - 1; // TODO: remove -1 from this number?

function frameRightY(frameTop) = frameTop - 15;

function bottomRightOffsetX(length) = frameRightX(length) - 10;


function generateFramePoints (
  // major dimenions
  // TODO: how does this relate to connectors
  length,
  height,
  nosePoints,
  // the width of your nose where the glasses meet your nose
  noseWidth,
  // TODO: Derive from where the glasses meet your nose. currently defined by top of nose piece
  noseHeight,
  //minor dimensions
  frameTop = 20,
  noseTop = 10,
) = [
  nosePoints[1],
  [frameLeftX(noseWidth) + 13, frameTop],
  [frameTopRight(length), frameTop],
  [frameRightX(length), frameRightY(frameTop)],
  [frameRightX(length) + 1, noseBottomY(noseTop, noseHeight)],
  [frameRightX(length) - 10, frameBottomY(frameTop, height)],
  [frameBottomLeftX(frameLeftX(noseWidth)), frameBottomY(frameTop, height)],
  [frameLeftX(noseWidth) + 6, noseBottomY(noseTop, noseHeight)],
  nosePoints[2],
];

function generateNosePoints (
  noseWidth,
  noseTop = 10,
  noseBottom = 4.25,
  frameLeftY = 3.5,
) = [
  [0, noseTop],
  [frameLeftX(noseWidth) + 1, noseTop],
  [frameLeftX(noseWidth), frameLeftY],
  // TODO: define 2
  [2, noseBottom],
  [0, noseBottom]
];