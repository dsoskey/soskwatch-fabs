// This is the top of the nose piece, not the human nose
// I'm thinking about changing this to be the human nose
// One point of consideration: is the height of the nose piece constant?
__TOP_OF_NOSE = [0,5.75];

function frameLeftX(noseWidth) = noseWidth / 2;

function frameTopY() = __TOP_OF_NOSE[1] + 10;

function frameBottomY(height) = frameTopY() - height;

function frameBottomRightX(length) = frameRightX(length) - 10;

function frameBottomLeftX(noseWidth) = frameLeftX(noseWidth) + 23;

function frameRightX(length) = length / 2;

function frameTopRightX(length) = frameRightX(length) - 13.8;

function bottomRightOffsetX(length) = frameRightX(length) - 10;

function generateFramePoints (
  length,
  height,
  nosePoints,
  // the width of your nose where the glasses meet your nose
  noseWidth,
  noseHeight,
) = [
  nosePoints[1],
  [frameLeftX(noseWidth) + 13,  frameTopY()],
  [frameTopRightX(length),      frameTopY()],
  [frameRightX(length) - 1,     frameTopY() - 15],
  // this[1] is why i want to change __TOP_OF_NOSE to be the human one. noseHeight isn't accurate to a human nose height
  [frameRightX(length),         __TOP_OF_NOSE[1] - noseHeight],
  [frameBottomRightX(length),   frameBottomY(height)],
  [frameBottomLeftX(noseWidth), frameBottomY(height)],
  [frameLeftX(noseWidth) + 6,   __TOP_OF_NOSE[1] - noseHeight],
  nosePoints[2],
];

function generateNosePoints (
  noseWidth,
) = [
  __TOP_OF_NOSE,
  [frameLeftX(noseWidth) + 1, __TOP_OF_NOSE[1]],
  [frameLeftX(noseWidth),     __TOP_OF_NOSE[1] - 6.5],
  [__TOP_OF_NOSE[0] + 2,      __TOP_OF_NOSE[1] - 5.75],
  [__TOP_OF_NOSE[0],          __TOP_OF_NOSE[1] - 5.75] // This Y coord is the true top of the nose. TODO: Redo this
];